import 'dart:async';

import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/databases/app_preferences.dart';
import 'package:tuntigi/models/gamezone.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/models/transaction.dart';
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
          print(response);
      if(response.isSuccessful) {
        _appPreferences.setLoggedIn(isLoggedIn: true);
        _appPreferences.setAccessToken(
            accessToken: response.data['access_token']
        );
      }
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
    return UserNAO.userInfo()
        .then((NetworkResponse response) async {
      if(response.isSuccessful) {
        User user = User.fromMap(response.data);
        _appDatabase.saveUser(user: user);
        _appPreferences.setUserId(userId: user.id);
        await fetchPlayerProfile(user.id);

        return user;
      }
      return null;
    });
  }

  Future<Profile?> fetchPlayerProfile(playerId) async{
    return UserNAO.playerProfile({"player_id": playerId})
        .then((NetworkResponse response) {
      if(response.isSuccessful) {
        Profile profile = Profile.fromMap(response.data);
        print({'......': profile});
        _appDatabase.savePlayerProfile(profile: profile);

        return profile;
      }
      return null;
    });
  }

  Future<List<Trans>> fetchTransactions({userId}) async{
    return UserNAO.transactions({"userid": userId})
        .then((NetworkResponse response) async {
      List<Trans> transactions = [];
      if(response.isSuccessful) {

        for(var item in response.data) {
          transactions.add(Trans.fromMap(item));
        }

        await _appDatabase.isDatabaseReady;
        _appDatabase.insertTransactions(transactions);
      }
      return transactions;
    });
  }

  Future<List<Gamezone>> fetchGamezones() async{
    return UserNAO.gamezones()
        .then((NetworkResponse response) async {
      List<Gamezone> gamezones = [];
      if(response.isSuccessful) {

        for(var item in response.data) {
          gamezones.add(Gamezone.fromMap(item));
        }

      }
      return gamezones;
    });
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

  Future<User?> getUser({bool refresh = false}) async {
    await _appDatabase.isDatabaseReady;
    if(!refresh) {
      User? user = await _appDatabase.getUser();
      if (user != null) {
        return user;
      }
    }
    return fetchUserInfo();
  }

  Future<Profile?> getPlayerProfile({bool refresh = false}) async {
    await _appDatabase.isDatabaseReady;
    if(!refresh) {
      Profile? profile = await _appDatabase.getPlayerProfile();
      if (profile != null) {
        return profile;
      }
    }
    User? user = await fetchUserInfo();
    return fetchPlayerProfile(user?.id ?? '');
  }

  Future<List<Trans>> getTransactions({bool refresh = false}) async {
    if(!refresh) {
      await _appDatabase.isDatabaseReady;
      List<Trans> transactions = await _appDatabase.getTransactions();
      return transactions;
    }
    User? user = await _appDatabase.getUser();
    // await fetchTransactions(userId: '36');
    await fetchTransactions(userId: user?.id ?? '');
    return await _appDatabase.getTransactions();
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