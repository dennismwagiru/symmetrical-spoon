import 'dart:async';

import 'package:tuntigi/databases/app_database.dart';
import 'package:tuntigi/databases/app_preferences.dart';
import 'package:tuntigi/models/challenge.dart';
import 'package:tuntigi/models/player.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/models/user.dart';
import 'package:tuntigi/network/entities/response.dart';
import 'package:tuntigi/network/nao/player_nao.dart';
import 'package:tuntigi/network/nao/user_nao.dart';
import 'dart:developer' as developer;

class PlayerRepository {

  late AppDatabase _appDatabase;

  factory PlayerRepository({required AppDatabase appDatabase}) =>
      PlayerRepository._internal(appDatabase);

  PlayerRepository._internal(this._appDatabase);

  Future<List<Player>> list() {
    return PlayerNao.list()
        .then((NetworkResponse response) async {
      List<Player> players = [];
      if(response.isSuccessful) {

        for(var item in response.data) {
          players.add(Player.fromMap(item));
        }

        await _appDatabase.isDatabaseReady;
        _appDatabase.insertPlayers(players);
      }
      return players;
    });
  }

  Future<List<Challenge>> getChallenges() {
    return UserNAO.challenges()
        .then((NetworkResponse response) async {
      List<Challenge> challenges = [];
      if(response.isSuccessful) {

        for(var item in response.data) {
          challenges.add(Challenge.fromMap(item));
        }

      }
      return challenges;
    });
  }

  Future<List<Player>> getPlayers() async {
    await _appDatabase.isDatabaseReady;
    List<Player> players = await _appDatabase.getPlayers();
    if(players.isNotEmpty) {
      return players;
    }
    return await list();
  }

}