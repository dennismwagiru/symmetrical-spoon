import 'package:flutter/material.dart';
import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/databases/app_preferences.dart';
import 'package:tuntigi/repository/user_repository.dart';

import 'package:tuntigi/utils/colors.dart';

import 'app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
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

  AppDatabase getAppDatabase() {
    return AppDatabase();
  }

  getUserRepository({required AppPreferences appPreferences, required AppDatabase appDatabase}) {
    return UserRepository(appPreferences: appPreferences, appDatabase: appDatabase);
  }
}