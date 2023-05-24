import 'package:floor/floor.dart';
import 'package:tuntigi/models/user.dart';

@dao
abstract class UserDao {
  @Query('SELECT * FROM User Limit 1')
  Future<User?> getCurrent();

  @Query('DELETE FROM User')
  Future<void> deleteAllUsers();

  @update
  Future<void> updateSingle(User user);

  @insert
  Future<void> insertSingle(User user);
}