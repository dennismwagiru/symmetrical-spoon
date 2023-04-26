import 'package:flutter/material.dart';
import 'package:tuntigi/databases/app_preferences.dart';

import 'package:tuntigi/utils/colors.dart';

import 'app_routes.dart';

class App extends StatelessWidget {

  static const App _instance = App._internal();

  const App._internal();

  factory App() => _instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: CustomColor.primaryColor,
        // visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'SFUIText',
      ),
      onGenerateRoute: getAppRoutes().getRoutes,
    );
  }

  AppRoutes getAppRoutes() {
    return AppRoutes();
  }

  AppPreferences getAppPreferences() {
    return AppPreferences();
  }
}