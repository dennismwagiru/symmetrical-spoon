import 'package:floor/floor.dart';

// "gamezone_id": 82,
// "gamezone": "Tuntigi - Grandhustle",
// "county": "Mombasa",
// "constituency": "Mvita",
// "ward": "Jomvu Kuu",
// "contact": "254"

@entity
class Game {
  @primaryKey
  final String game_id;
  final String player_1;
  final String player_2;
  final String date_time;
  final String gamezone;
  final int player_1_score;
  final int player_2_score;

  Game({
    required this.game_id, required this.player_1, required this.player_2,
    required this.date_time,
    required this.gamezone, required this.player_1_score, required this.player_2_score
  });

  factory Game.fromMap(Map<dynamic, dynamic> data) {
    return Game(
      game_id: data['game_id'],
      player_1: data['player_1'],
      player_2: data['player_2'],
      date_time: data['date_time'],
      gamezone: data['gamezone'],
      player_1_score: data['player_1_score'],
      player_2_score: data['player_2_score'],
    );
  }
}