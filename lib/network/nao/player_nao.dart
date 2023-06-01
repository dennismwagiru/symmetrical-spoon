import 'dart:async';
import 'dart:io';

import 'package:tuntigi/network/constants.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/utils/network_util.dart';

class PlayerNao {

  static Future<NetworkResponse> list() =>
      NetworkUtil().post(url: NetworkConstants.leaderboard)
          .then((dynamic response) { // On response received
        return NetworkResponse(isSuccessful: true, data: response['Leaderboard Info.']);
      }).onError((error, stackTrace) {
        return NetworkResponse(
            isSocketException: (error is SocketException || error is TimeoutException),
            isSuccessful: false,  error: error.toString()
        );
      });
}