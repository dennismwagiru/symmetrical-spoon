import 'dart:async';

import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/databases/app_preferences.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/models/user.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'dart:developer' as developer;

class UserRepository {

  final _isShowingBalance = StreamController<bool>.broadcast();
  final _isLoggedIn = StreamController<bool>.broadcast();
  final _loginResponse = StreamController<NetworkResponse>.broadcast();
  final _registrationResponse = StreamController<NetworkResponse>.broadcast();
  final _userInfo = StreamController<NetworkResponse>.broadcast();
  final _playerProfile = StreamController<NetworkResponse>.broadcast();

  late AppPreferences _appPreferences;
  late AppDatabase _appDatabase;

  factory UserRepository({required AppPreferences appPreferences, required AppDatabase appDatabase}) => UserRepository._internal(appPreferences, appDatabase);

  UserRepository._internal(this._appPreferences, this._appDatabase);

  void isAuthenticUser(
      {required String mobileno, required String pin}) {
    UserNAO.login(mobileno: mobileno, pin: pin)
        .then((NetworkResponse response) {
      if(response.isSuccessful) {
        print({'access_token': response.data['access_token']});
        _appPreferences.setLoggedIn(isLoggedIn: true);
        _appPreferences.setAccessToken(
            accessToken: response.data['access_token']
        );
      }
      fetchUserInfo();
      _loginResponse.add(response);

    });
  }

  void create({required Map<String, dynamic> body}) {
    UserNAO.register(body: body)
        .then((NetworkResponse response) {
      _registrationResponse.add(response);
    });
  }

  Future<User?> fetchUserInfo() async {
    UserNAO.userInfo()
        .then((NetworkResponse response) {
      if(response.isSuccessful) {
        User user = User.fromMap(response.data);
        _appDatabase.saveUser(user: user);
        _appPreferences.setUserId(userId: user.id);
        fetchPlayerProfile(user.id);

        return user;
      }
      _playerProfile.add(response);
    });
    return null;
  }

  Future<Profile?> fetchPlayerProfile(playerId) async{
    // int playerId = 56;
    UserNAO.playerProfile({"player_id": playerId})
        .then((NetworkResponse response) {
      if(response.isSuccessful) {
        Profile profile = Profile.fromMap(response.data);
        _appDatabase.savePlayerProfile(profile: profile);

        return profile;
      }
      _playerProfile.add(response);
    });

    return null;
  }

  void isShowingBalance() async {
    _appPreferences.isPreferenceReady;
    _appPreferences.getShowBalance()
        .then((value) => _isShowingBalance.add(value));
  }

  void isUserLoggedIn() async {
    await _appPreferences.isPreferenceReady;
    _appPreferences.getLoggedIn()
        .then((value) => _isLoggedIn.add(value));
  }

  void setIsShowingBalance(bool showBalance) async {
    _appPreferences.setShowBalance(showBalance: showBalance);
  }

  Future<User?> getUser() async {
    User? user = await _appDatabase.getUser();
    if(user != null) {
      return user;
    }
    return fetchUserInfo();
  }



  Future<Profile?> getPlayerProfile() async {
    Profile? profile = await _appDatabase.getPlayerProfile();
    if(profile != null) {
      return profile;
    }
    getUser().then((User? user) async {
      if(user != null) {
        return fetchPlayerProfile(user.id);
      }
    });

    return null;
  }

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

  Stream<bool> getIsLoggedIn() {
    return _isLoggedIn.stream;
  }

}