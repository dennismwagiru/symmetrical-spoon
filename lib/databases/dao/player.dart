import 'package:floor/floor.dart';
import 'package:tuntigi/models/player.dart';
import 'package:tuntigi/models/user.dart';

@dao
abstract class PlayerDao {
  @Query('SELECT * FROM Player')
  Future<List<Player>> getAll();

  @Query('SELECT * FROM Player WHERE id = :id')
  Future<Player?> findById(int id);

  @insert
  Future<void> insertSingle(Player player);

  @insert
  Future<void> insertMultiple(List<Player> players);

  @update
  Future<void> updateSingle(Player player);

  @update
  Future<void> updateMultiple(List<Player> players);

  @delete
  Future<void> deleteSingle(Player item);

  @Query('DELETE FROM Player')
  Future<void> deleteAll();
}