import 'dart:async';

import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/databases/app_preferences.dart';
import 'package:tuntigi/models/user.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'dart:developer' as developer;

class UserRepository {

  final _isShowingBalance = StreamController<bool>.broadcast();
  final _loggedInUser = StreamController<NetworkResponse>.broadcast();
  final _loginResponse = StreamController<NetworkResponse>.broadcast();
  final _registrationResponse = StreamController<NetworkResponse>.broadcast();

  late AppPreferences _appPreferences;
  late AppDatabase _appDatabase;

  //----------------------- Constructors -----------------------//
  /// @dependency -> @required appPreferences -> AppPreferences
  /// @usage -> Returns UserRepository instance by injecting dependencies for private constructor.
  factory UserRepository({required AppPreferences appPreferences, required AppDatabase appDatabase}) => UserRepository._internal(appPreferences, appDatabase);
  //----------------------- Methods -----------------------//
  /// Is Authentic User Method -> void
  /// @param -> @required username -> String
  ///        -> @required password -> String
  /// @usage -> Initiate authentication process and listen to response of authentication, therefore notify authentication result to all listeners
  void isAuthenticUser(
      {required String email, required String password}) {
    UserNAO.login(email: email, password: password)
        .then((NetworkResponse response) { // On Response
      _loginResponse.add(response);
      developer.log(
        'login response',
        name: 'login',
        error: response.data
      );
    });
  }

  void create({required Map<String, dynamic> body}) {
    UserNAO.register(body: body)
        .then((NetworkResponse response) {
      developer.log(
          'register response',
          name: 'register',
          error: response.data
      );
      // if(response.isSuccessful) {
      //   User user = User.fromMap(response.data['user']);
      //   // _appDatabase.cacheLoggedInUser(user: user);
      //   // _appPreferences.setAccessToken(accessToken: response.data['access_token']);
      //   // _appPreferences.setLoggedIn(isLoggedIn: true);
      //
      // } else {
      //   _appPreferences.setLoggedIn(isLoggedIn: false);
      // }
      _registrationResponse.add(response);
    });
  }

  void isShowingBalance() async {
    _appPreferences.isPreferenceReady;
    _appPreferences.getShowBalance()
        .then((value) => _isShowingBalance.add(value));
  }

  void setIsShowingBalance(bool showBalance) async {
    _appPreferences.setShowBalance(showBalance: showBalance);
  }

  Future<User?> getUser() async {
    User? user = await _appDatabase.getLoggedInUser();
    return user;
  }

  /// User Repository Private Constructor -> UserRepository
  /// @param -> @required appPreference -> AppPreferences
  /// @usage -> Create Instance of UserRepository and initialize variables
  UserRepository._internal(this._appPreferences, this._appDatabase);

  /// Get Login Response Method -> Stream<bool>
  /// @param -> _
  /// @usage -> Stream of type bool for streaming login response
  Stream<NetworkResponse> getLoginResponse() {
    return _loginResponse.stream;
  }

  /// Get Login Response Method -> Stream<bool>
  /// @param -> _
  /// @usage -> Stream of type bool for streaming login response
  Stream<NetworkResponse> getRegistrationResponse() {
    return _registrationResponse.stream;
  }

  Stream<bool> getIsShowingBalance() {
    return _isShowingBalance.stream;
  }

}