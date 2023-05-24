import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/models/user.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/repository/user_repository.dart';

class UserViewModel extends ChangeNotifier {

  late UserRepository _userRepository;

  static late UserViewModel _instance;

  final _loginResponse = StreamController<NetworkResponse>.broadcast();
  final _currentUserController = StreamController<NetworkResponse>.broadcast();
  final _isInitialLaunch = StreamController<bool>.broadcast();
  final _registeredUserResponse = StreamController<NetworkResponse>.broadcast();

  factory UserViewModel(App app) {
    _instance = UserViewModel._internal(userRepository: app.getUserRepository(appPreferences: app.getAppPreferences(), appDatabase: app.getAppDatabase()));

    return _instance;
  }

  UserViewModel._internal({required UserRepository userRepository}) {
    _userRepository = userRepository;
    _init();
  }

  void _init() {
    _userRepository.getLoginResponse().listen((event) => _loginResponse.add(event));
    // _userRepository.getUserResponse().listen((NetworkResponse response) => _currentUserController.add(response));
    // _userRepository.getUserUpdatedResponse().listen((event) => _updatedUserResponse.add(event));
    // _userRepository.getRegistrationResponse().listen((event) => _registeredUserResponse.add(event));
  }


  Future<User?> getUser() => _userRepository.getUser();

  void create({required Map<String, dynamic> body}) => _userRepository.create(body: body);

  void isAuthentic({required String email, required String password}) {
    _userRepository.isAuthenticUser(email: email, password: password);
  }



  Stream<NetworkResponse> getCurrentUserResponse() => _currentUserController.stream;
  Stream<bool> getIsInitialLaunch() => _isInitialLaunch.stream;
  Stream<NetworkResponse> getLoginResponse() => _loginResponse.stream;
  Stream<NetworkResponse> getRegisteredUser() => _registeredUserResponse.stream;
}