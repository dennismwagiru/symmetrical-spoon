import 'package:http_interceptor/http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';
import 'package:tuntigi/app/app.dart';

class AuthorizationInterceptor implements InterceptorContract {

  @override
  Future<RequestData> interceptRequest({required RequestData data}) async {

    try {
      // Fetching token from local data
      var preferences = App().getAppPreferences();
      await preferences.isPreferenceReady;

      final String? token = await preferences.getAccessToken();

      // Clear previous header and update it with updated token
      data.headers.clear();

      data.headers['authorization'] = 'Bearer ${token!}';
      data.headers['content-type'] = 'application/json';
    } catch (e) {
      print(e);
    }

    return data;
  }

  @override
  Future<ResponseData> interceptResponse({required ResponseData data}) async {
    return data;
  }
}