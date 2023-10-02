import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:image_picker/image_picker.dart';
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
            isSuccessful: false,  error: error is TimeoutException ? "Request Timed Out. Please try again later" : error.toString()
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
          isSuccessful: false,  error: error is TimeoutException ? "Request Timed Out. Please try again later" : error.toString()
      );
    });
  }

  static Future<NetworkResponse> resetPin(
      {required String mobileno}) {
    print('reset');
    return NetworkUtil().post( // HTTP-POST request
        url: NetworkConstants.resetPin, // REST api URL
        body: { // Request body
          'mobileno': mobileno,
        })
        .then((dynamic response) { // On response received
      return NetworkResponse(isSuccessful: true, data: response);
    }).onError((error, stackTrace) {
      return NetworkResponse(
          isSocketException: (error is SocketException || error is TimeoutException),
          isSuccessful: false,  error: error is TimeoutException ? "Request Timed Out. Please try again later" : error.toString()
      );
    });
  }
  static Future<NetworkResponse> uploadAvatar({required XFile file}) =>
      NetworkUtil().upload(url: NetworkConstants.uploadprofpic, file: file)
          .then((response) {
        return NetworkResponse(isSuccessful: true, data: response);
      }
      ).onError((error, stackTrace) =>
          NetworkResponse(isSuccessful: false, error: error.toString())
      );


  static Future<NetworkResponse> refreshToken() {
    return NetworkUtil().post(url: NetworkConstants.refreshToken)
        .then((dynamic response) { // On response received
      return NetworkResponse(isSuccessful: true, data: response);
    }).onError((error, stackTrace) {
      return NetworkResponse(
          isSocketException: (error is SocketException || error is TimeoutException),
          isSuccessful: false,  error: error is TimeoutException ? "Request Timed Out. Please try again later" : error.toString()
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
          isSuccessful: false,  error: error is TimeoutException ? "Request Timed Out. Please try again later" : error.toString()
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
          isSuccessful: false,  error: error is TimeoutException ? "Request Timed Out. Please try again later" : error.toString()
      );
    });
  }

  static Future<NetworkResponse> saveDeviceToken() async {
    final fcmToken = await FirebaseMessaging.instance.getToken();
    return NetworkUtil().post(url: NetworkConstants.saveDeviceToken, body: {'token': fcmToken})
        .then((dynamic response) {
      return NetworkResponse(isSuccessful: true, data: response);
    }).onError((error, stackTrace) {
      return NetworkResponse(
          isSocketException: (error is SocketException || error is TimeoutException),
          isSuccessful: false,  error: error is TimeoutException ? "Request Timed Out. Please try again later" : error.toString()
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
          isSuccessful: false,  error: error is TimeoutException ? "Request Timed Out. Please try again later" : error.toString()
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
          isSuccessful: false,  error: error is TimeoutException ? "Request Timed Out. Please try again later" : error.toString()
      );
    });
  }

  static Future<NetworkResponse> transactions(Map<String, dynamic> payload) {
    return NetworkUtil().post(url: NetworkConstants.transactions, body: payload)
        .then((dynamic response) {
      return NetworkResponse(isSuccessful: true, data: response['Transactions Info.']);
    }).onError((error, stackTrace) {
      return NetworkResponse(
          isSocketException: (error is SocketException || error is TimeoutException),
          isSuccessful: false,  error: error is TimeoutException ? "Request Timed Out. Please try again later" : error.toString()
      );
    });
  }

  static Future<NetworkResponse> gamezones() {
    return NetworkUtil().get(url: NetworkConstants.gamezones)
        .then((dynamic response) {
      return NetworkResponse(isSuccessful: true, data: response['Gamezones Info.']);
    }).onError((error, stackTrace) {
      return NetworkResponse(
          isSocketException: (error is SocketException || error is TimeoutException),
          isSuccessful: false,  error: error is TimeoutException ? "Request Timed Out. Please try again later" : error.toString()
      );
    });
  }

  static Future<NetworkResponse> challenges() {
    return NetworkUtil().post(url: NetworkConstants.challenges)
        .then((dynamic response) {
          print(response);
      return NetworkResponse(isSuccessful: true, data: response['Challenges Info.']);
    }).onError((error, stackTrace) {
      return NetworkResponse(
          isSocketException: (error is SocketException || error is TimeoutException),
          isSuccessful: false,  error: error is TimeoutException ? "Request Timed Out. Please try again later" : error.toString()
      );
    });
  }

  static Future<NetworkResponse> replyToChallenge(Map<String, dynamic> payload) {
    return NetworkUtil().post(url: NetworkConstants.replytochallenge, body: payload)
        .then((dynamic response) {
      return NetworkResponse(isSuccessful: true, data: response['Message']);
    }).onError((error, stackTrace) {
      return NetworkResponse(
          isSocketException: (error is SocketException || error is TimeoutException),
          isSuccessful: false,  error: error is TimeoutException ? "Request Timed Out. Please try again later" : error.toString()
      );
    });
  }
}