import 'package:floor/floor.dart';

// "gamezone_id": 82,
// "gamezone": "Tuntigi - Grandhustle",
// "county": "Mombasa",
// "constituency": "Mvita",
// "ward": "Jomvu Kuu",
// "contact": "254"

@entity
class Challenge {
  @primaryKey
  final int challenge_id;
  final String player_1;
  final String player_2;
  final int games;
  final String date_time;
  final String gamezone;

  Challenge({
    required this.challenge_id, required this.player_1, required this.player_2, required this.games,
    required this.date_time, required this.gamezone,
  });

  factory Challenge.fromMap(Map<dynamic, dynamic> data) {
    return Challenge(
      challenge_id: data['challenge_id'],
      player_1: data['player_1'],
      player_2: data['player_2'],
      games: data['games'],
      date_time: data['date_time'],
      gamezone: data['gamezone'],
    );
  }
}