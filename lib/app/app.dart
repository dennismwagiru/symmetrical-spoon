import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/databases/app_preferences.dart';
import 'package:tuntigi/databases/providers/balance_provider.dart';
import 'package:tuntigi/databases/providers/profile_provider.dart';
import 'package:tuntigi/repository/player_repository.dart';
import 'package:tuntigi/repository/user_repository.dart';

import 'package:tuntigi/utils/colors.dart';

import 'app_routes.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => ShowBalanceProvider()),
          ChangeNotifierProvider(create: (context) => ProfileProvider()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // useMaterial3: true,
          primaryColor: Colors.white,
          // visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'SFUIText',
        ),
        onGenerateRoute: getAppRoutes().getRoutes,
      ),
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

  getPlayerRepository({required AppDatabase appDatabase}) {
    return PlayerRepository(appDatabase: appDatabase);
  }
}