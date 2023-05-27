import 'package:floor/floor.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/models/user.dart';

@dao
abstract class ProfileDao {
  @Query('SELECT * FROM Profile Limit 1')
  Future<Profile?> getProfile();

  @Query('DELETE FROM Profile')
  Future<void> deleteAllProfiles();

  @update
  Future<void> updateSingle(Profile profile);

  @insert
  Future<void> insertSingle(Profile profile);
}