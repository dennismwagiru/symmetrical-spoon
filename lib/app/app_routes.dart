import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:tuntigi/ui/screens/dashboard/leaderboard_screen.dart';
import 'package:tuntigi/ui/screens/dashboard/referral_screen.dart';
import 'package:tuntigi/ui/screens/dashboard/statement_screen.dart';
import 'package:tuntigi/ui/screens/home/challenges_screen.dart';
import 'package:tuntigi/ui/screens/home/dashboard_screen.dart';
import 'package:tuntigi/ui/screens/home/wallet_screen.dart';
import 'package:tuntigi/ui/screens/home/settings_screen.dart';
import 'package:tuntigi/ui/screens/login_screen.dart';
import 'package:tuntigi/ui/screens/referral_code_screen.dart';
import 'package:tuntigi/ui/screens/register_screen.dart';
import 'package:tuntigi/ui/screens/regististration_success_screen.dart';
import 'package:tuntigi/ui/screens/splash_screen.dart';
import 'package:tuntigi/ui/screens/topup_screen.dart';
import 'package:tuntigi/ui/screens/topup_successful_screen.dart';
import 'package:tuntigi/ui/screens/withdrawal_screen.dart';
import 'package:tuntigi/ui/screens/withdrawal_successful_screen.dart';

class AppRoutes {

  // Base Routes
  static const String appRouteDashboard = '/dashboard';
  static const String appRouteWallet = '/wallet';
  static const String appRouteChallenges = '/challenges';
  static const String appRouteSettings = '/settings';
  static const String appRouteReferralCode = '/referral_code';
  static const String appRouteWithdraw = '/withdraw';
  static const String appRouteTopup = '/topup';
  static const String appRouteTopupSuccessful = '/topup/success';
  static const String appRouteWithdrawalSuccessful = '/withdraw/success';

  // Auth Routes
  static const String appRouteLogin = '/auth/login';
  static const String appRouteRegister = '/auth/register';
  static const String appRouteRegistrationSuccessful = '/auth/registration/success';

  // Dashboard Routes
  static const String appRouteStatement = '/dashboard/statement';
  static const String appRouteLeaderboard = '/dashboard/leaderboard';
  static const String appRouteReferral = '/dashboard/referral';


  Route getRoutes(RouteSettings routeSettings) {
    print(routeSettings);
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

      case appRouteDashboard: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const DashboardScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteWallet: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const WalletScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteChallenges: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const ChallengesScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteSettings: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const SettingsScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteWallet: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const WalletScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteStatement: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const StatementScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteLeaderboard: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const LeaderboardScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteReferral: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const ReferralScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteReferralCode: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const ReferralCodeScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteWithdraw: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const WithdrawalScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteTopup: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const TopUpScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteTopupSuccessful: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const TopupSuccessfulScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      case appRouteWithdrawalSuccessful: {
        return MaterialPageRoute(
            builder: (BuildContext context) => const WithdrawalSuccessfulScreen(),
            fullscreenDialog: true,
            settings: routeSettings
        );
      }

      default:
        return MaterialPageRoute<void>(
          builder: (BuildContext context) => const SplashScreen(),
          fullscreenDialog: true,
          settings: routeSettings,
        );
    }
  }
}