import 'dart:async';
import 'dart:io';

import 'package:tuntigi/network/constants.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/utils/network_util.dart';

class UserNAO {

  static Future<NetworkResponse> register({required Map<String, dynamic> body}) =>
      NetworkUtil().post(url: NetworkConstants.register, body: body)
          .then((dynamic response) { // On response received
        return NetworkResponse(isSuccessful: true, data: response);
      }).onError((error, stackTrace) {
        return NetworkResponse(
            isSocketException: (error is SocketException || error is TimeoutException),
            isSuccessful: false,  error: error.toString()
        );
      });


  static Future<NetworkResponse> login(
      {required String mobileno, required String pin}) {
    return NetworkUtil().post( // HTTP-POST request
        url: NetworkConstants.login, // REST api URL
        body: { // Request body
          'mobileno': mobileno,
          'pin': pin,
        })
        .then((dynamic response) { // On response received
      return NetworkResponse(isSuccessful: true, data: response);
    }).onError((error, stackTrace) {
      return NetworkResponse(
          isSocketException: (error is SocketException || error is TimeoutException),
          isSuccessful: false,  error: error.toString()
      );
    });
  }

  static Future<NetworkResponse> refreshToken() {
    return NetworkUtil().post(url: NetworkConstants.refreshToken)
        .then((dynamic response) { // On response received
      return NetworkResponse(isSuccessful: true, data: response);
    }).onError((error, stackTrace) {
      return NetworkResponse(
          isSocketException: (error is SocketException || error is TimeoutException),
          isSuccessful: false,  error: error.toString()
      );
    });
  }

  static Future<NetworkResponse> userInfo() {
    return NetworkUtil().post(url: NetworkConstants.userInfo)
        .then((dynamic response) {
      return NetworkResponse(isSuccessful: true, data: response['User Info.']);
    }).onError((error, stackTrace) {
      return NetworkResponse(
          isSocketException: (error is SocketException || error is TimeoutException),
          isSuccessful: false,  error: error.toString()
      );
    });
  }

  static Future<NetworkResponse> playerProfile(Map<String, dynamic> payload) {
    return NetworkUtil().post(url: NetworkConstants.playerProfile, body: payload)
        .then((dynamic response) {
      return NetworkResponse(isSuccessful: true, data: response['Player Info.']);
    }).onError((error, stackTrace) {
      return NetworkResponse(
          isSocketException: (error is SocketException || error is TimeoutException),
          isSuccessful: false,  error: error.toString()
      );
    });
  }

  static Future<NetworkResponse> deposit(Map<String, dynamic> payload) {
    return NetworkUtil().post(url: NetworkConstants.stkPush, body: payload)
        .then((dynamic response) {
      return NetworkResponse(isSuccessful: true, data: response);
    }).onError((error, stackTrace) {
      return NetworkResponse(
          isSocketException: (error is SocketException || error is TimeoutException),
          isSuccessful: false,  error: error.toString()
      );
    });
  }

  static Future<NetworkResponse> withdraw(Map<String, dynamic> payload) {
    return NetworkUtil().post(url: NetworkConstants.b2c, body: payload)
        .then((dynamic response) {
      return NetworkResponse(isSuccessful: true, data: response);
    }).onError((error, stackTrace) {
      return NetworkResponse(
          isSocketException: (error is SocketException || error is TimeoutException),
          isSuccessful: false,  error: error.toString()
      );
    });
  }
}