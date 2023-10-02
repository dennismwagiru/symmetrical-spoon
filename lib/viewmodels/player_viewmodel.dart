import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:tuntigi/app/app.dart';
import 'package:tuntigi/models/challenge.dart';
import 'package:tuntigi/models/player.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/models/user.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/repository/player_repository.dart';
import 'package:tuntigi/repository/user_repository.dart';

class PlayerViewModel extends ChangeNotifier {

  late PlayerRepository _playerRepository;

  static late PlayerViewModel _instance;

  final _challengesResponse = StreamController<NetworkResponse>.broadcast();

  factory PlayerViewModel(App app) {
    _instance = PlayerViewModel._internal(playerRepository: app.getPlayerRepository(appDatabase: app.getAppDatabase()));

    return _instance;
  }

  PlayerViewModel._internal({required PlayerRepository playerRepository}) {
    _playerRepository = playerRepository;
  }

  Future<List<Player>> getPlayers() => _playerRepository.list();

  Future<List<Challenge>> getChallenges() => _playerRepository.getChallenges();

}