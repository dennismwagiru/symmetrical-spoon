import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_interceptor/http/interceptor_contract.dart';
import 'package:http_interceptor/models/request_data.dart';
import 'package:http_interceptor/models/response_data.dart';
import 'package:http_interceptor/models/retry_policy.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/app/app_exceptions.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';


class AuthorizationInterceptor implements InterceptorContract {

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {

    try {
      // Fetching token from local data
      var preferences = const App().getAppPreferences();
      await preferences.isPreferenceReady;

      final String? token = await preferences.getAccessToken();

      // Clear previous header and update it with updated token
      data.headers.clear();

      data.headers['authorization'] = 'Bearer ${token!}';
      data.headers['content-type'] = 'application/json';
    } catch (e) {
      print(e);
    }

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}

class ExpiredTokenRetryPolicy extends RetryPolicy {
//Number of retry
  @override
  int maxRetryAttempts = 2;

  @override
  Future<bool> shouldAttemptRetryOnResponse(ResponseData response) async {
    if (response.statusCode == 401) {
      var preferences = const App().getAppPreferences();

      UserNAO.refreshToken().then((NetworkResponse response) async {
        await preferences.isPreferenceReady;
        preferences.setAccessToken(accessToken: response.data['access_token']);
      });
      return true;
    }
    return false;
  }
}

/// Network Util Class -> A utility class for handling network operations
class NetworkUtil {
  //----------------------- Singleton-Instance -----------------------//
  // Singleton Instance
  static final NetworkUtil _instance = NetworkUtil.internal();

  /// NetworkUtil Private Constructor -> NetworkUtil
  /// @param -> _
  /// @usage -> Returns the instance of NetworkUtil class
  NetworkUtil.internal();

  /// NetworkUtil Factory Constructor -> NetworkUtil
  /// @dependency -> _
  /// @usage -> Returns the instance of NetworkUtil class
  factory NetworkUtil() => _instance;

  //----------------------- Variables -----------------------//
  // JsonDecoder object
  final JsonDecoder _decoder = const JsonDecoder();

  Future<Map<String, String>> _headers() async {
    var headers = {
      HttpHeaders.userAgentHeader: 'beta.tun-tigi.com',
    };
    var preferences = const App().getAppPreferences();
    await preferences.isPreferenceReady;

    final String? token = await preferences.getAccessToken();
    if (token != null) {
      headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
    }
    return headers;
  }

  //----------------------- Methods -----------------------//
  /// Get Method -> Future<dynamic>
  /// @param -> @required url -> String
  /// @usage -> Make HTTP-GET request to specified URL and returns the response in JSON format
  Future<dynamic> get({required String url,}) async {
    var headers = await _headers();
    return await http.get(Uri.parse(url), headers: headers, )
        .timeout(const Duration(seconds: 10))
        .then((http.Response response) { // On response received
      print({
        'Method': 'GET',
        'Headers': headers,
        'URL': url,
        'StatusCode': response.statusCode,
        'Response': response.body
      });
      return _returnResponse(response);
    });
  }

  /// Post Method -> Future<dynamic>
  /// @param -> @required url -> String
  ///        -> headers -> Map
  ///        -> body -> dynamic
  ///        -> encoding -> dynamic
  /// @usage -> Make HTTP-POST request to specified URL and returns the response in JSON format
  Future<dynamic> post({required String url, body, encoding}) async {
    var payload = json.encode(body);
    var headers = await _headers();
    headers[HttpHeaders.contentTypeHeader] = 'application/json';
    return await http.post(Uri.parse(url), body: payload,
        headers: headers,
        encoding: encoding)
        .then((http.Response response) { // On response received
      print({
        'Method': 'POST',
        'URL': url,
        'body': payload,
        'Headers': headers,
        'StatusCode': response.statusCode,
        'Response': response.body
      });
      var body = _returnResponse(response);
      return body;
    });
  }

  /// Patch Method -> Future<dynamic>
  /// @param -> @required url -> String
  ///        -> headers -> Map
  ///        -> body -> dynamic
  ///        ->encoding -> dynamic
  Future<dynamic> patch({required String url, body, encoding}) async {
    var headers = await _headers();
    return await http.patch(Uri.parse(url), body: body,
        headers: headers,
        encoding: encoding)
        .timeout(const Duration(seconds: 10))
        .then((http.Response response) {
      print({
        'Method': 'PATCH',
        'URL': url,
        'Headers': headers,
        'StatusCode': response.statusCode,
        'Response': response.body
      });
      return _returnResponse(response);
    });
  }

  String parseQueryMap({required String url, required Map<String, dynamic> params}) {
    if(params.keys.isNotEmpty) {
      url += '?';
      params.forEach((i, value) {
        if(value != null) {
          url += '$i=$value&';
        }
      });
    }
    return url;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
      case 201:
        final String res = response.body;
        return _decoder.convert(res);
      case 422:
      case 400:
        throw BadRequestException(response.body);
      case 401:
      case 403:
        throw UnauthorisedException(response.body);
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while making the request. StatusCode : ${response.statusCode}'
        );
    }
  }
}