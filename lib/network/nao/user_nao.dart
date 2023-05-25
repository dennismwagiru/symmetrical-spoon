import 'dart:async';
import 'dart:io';

import 'package:tuntigi/network/constants.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/utils/network_util.dart';

class UserNAO {

  static Future<NetworkResponse> register(
      {required Map<String, dynamic> body}
      ) =>
      NetworkUtil().post(url: NetworkConstants.register, body: body)
          .then((dynamic response) { // On response received
        return NetworkResponse(isSuccessful: true, data: response);
      }).onError((error, stackTrace) {
        print({
          'Error': error,
        });
        return NetworkResponse(
            isSocketException: (error is SocketException || error is TimeoutException),
            isSuccessful: false,  error: error.toString()
        );
      });

  /// Static Is Authentic User Method -> Future<UserModel>
  /// @param -> @required username -> String
  ///        -> @required password -> String
  /// @usage -> Makes a HTTP-POST request to REST api on server.
  static Future<NetworkResponse> login(
      {required String email, required String password}) {
    return NetworkUtil().post( // HTTP-POST request
        url: NetworkConstants.login, // REST api URL
        body: { // Request body
          'email': email,
          'password': password,
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
}