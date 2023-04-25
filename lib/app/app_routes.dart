import 'package:flutter/material.dart';
import 'package:tuntigi/ui/screens/home_screen.dart';
import 'package:tuntigi/ui/screens/login_screen.dart';
import 'package:tuntigi/ui/screens/register_screen.dart';
import 'package:tuntigi/ui/screens/regististration_success_screen.dart';
import 'package:tuntigi/ui/screens/splash_screen.dart';

class AppRoutes {
  static const String appRouteLogin = '/auth/login';
  static const String appRouteRegister = '/auth/register';
  static const String appRouteRegistrationSuccessful = '/auth/registration/success';
  static const String appRouteHome = '/home';

  Route getRoutes(RouteSettings routeSettings) {
    switch(routeSettings.name) {
      case appRouteLogin: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const LoginScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteRegister: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegisterScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteRegistrationSuccessful: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const RegistrationSuccessScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteHome: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const HomeScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      default:
        return MaterialPageRoute<void>(
            settings: routeSettings,
            builder: (BuildContext context) => const LoginScreen(),
            fullscreenDialog: true
        );
    }
  }
}