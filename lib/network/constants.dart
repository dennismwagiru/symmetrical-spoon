class NetworkConstants {
  static const String _baseUrl = 'http://beta.tun-tigi.com/public';

  static const String _baseApi = '$_baseUrl/api/v1';

  static const String register      = '$_baseApi/auth/register';
  static const String login         = '$_baseApi/auth/login';
  static const String refreshToken  = '$_baseApi/auth/refresh';
  static const String userInfo      = '$_baseApi/player/getuserid';
  static const String playerProfile = '$_baseApi/player/profile';
}