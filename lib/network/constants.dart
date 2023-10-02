class NetworkConstants {
  // static const String _baseUrl = 'https://tun-tigi.com/public';
  static const String _baseUrl = 'https://uat.tun-tigi.com/public';

  static const String _baseApi = '$_baseUrl/api/v1';

  static const String register      = '$_baseApi/auth/register';
  static const String login         = '$_baseApi/auth/login';
  static const String resetPin      = '$_baseApi/player/resetpin';
  static const String refreshToken  = '$_baseApi/auth/refresh';
  static const String userInfo      = '$_baseApi/player/getuserid';
  static const String saveDeviceToken = '$_baseApi/auth/savedevicetoken';
  static const String playerProfile = '$_baseApi/player/profile';
  static const String leaderboard   = '$_baseApi/player/leaderboard';
  static const String transactions  = '$_baseApi/player/transactions';
  static const String stkPush       = '$_baseApi/mpesa/stk/push';
  static const String b2c           = '$_baseApi/mpesa/b2cRequest';
  static const String gamezones     = '$_baseApi/general/gamezones';
  static const String challenges     = '$_baseApi/player/challenges';
  static const String replytochallenge     = '$_baseApi/player/replytochallenge';
  static const String uploadprofpic = '$_baseApi/player/uploadprofpic';
}