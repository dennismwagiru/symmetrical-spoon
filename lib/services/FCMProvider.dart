import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:tuntigi/app/app_routes.dart';

import 'FirebaseService.dart';

class FCMProvider with ChangeNotifier {
  static BuildContext? _context;

  static void setContext(BuildContext context) {
    FCMProvider._context = context;
    print('COntext Set');
  }

  /// when app is in the foreground
  static Future<void> onTapNotification() async {
    if (FCMProvider._context == null) {
      return;
    }
    print(FCMProvider._context);
    print(FCMProvider._context == null ? 'Context Null' : 'Context Not Null');
    Navigator.of(FCMProvider._context!).pushNamed(AppRoutes.appRouteChallenges);
  }

  static Future<void> onMessageOpenedApp() async {
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
      onTapNotification();
    });
  }

  static Future<void> onMessage() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
        await FirebaseService.localNotificationsPlugin.show(
          0, message.notification!.title,
          message.notification!.body,
          FirebaseService.platformChannelSpecifics,
          payload: message.data.toString(),
        );
    });
  }

  static Future<void> backgroundHandler(RemoteMessage message) async {

  }
}