import 'package:flutter/material.dart';
import 'package:tuntigi/ui/screens/login_screen.dart';
import 'package:tuntigi/ui/screens/splash_screen.dart';

class AppRoutes {
  static const String appRouteLogin = '/auth/login';
  static const String appRouteRegister = '/auth/register';
  static const String appRouteHome = '/home';

  Route getRoutes(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case appRouteLogin: {
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginScreen(),
          fullscreenDialog: true,
          settings: routeSettings
        );
      }

      default:
        return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const SplashScreen(),
            fullscreenDialog: true
        );
    }
  }
}