import 'package:floor/floor.dart';

@entity
class Player {
  @primaryKey
  final int id;
  final String name;
  final int? score;
  final int? wins;
  final int? draws;
  final int? loses;
  final int? gd;
  final int? position;

  Player({
    required this.id, required this.name,
    required this.score, this.wins, this.draws, this.loses, this.gd, this.position
  });

  factory Player.fromMap(Map<dynamic, dynamic> data) {
    return Player(
        id: data['player_id'],
        name: data['player'],
        score: data['total_score'],
        wins: data['wins'],
        draws: data['draws'],
        loses: data['loses'],
      gd: data['gd'],
      position: data['position'],
    );
  }

  @override
  String toString() {
    return 'id: $id, name: $name, score: $score, wins: $wins, draws: $draws, loses: $loses, gd: $gd position: $position';
  }
}