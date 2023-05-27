
import 'package:tuntigi/databases/floor/database.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/models/user.dart';

class AppDatabase {

  late Future _isDatabaseInstanceReady;

  late TunTigiDatabase _database;

  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() => _instance;

  AppDatabase._internal() {
    _isDatabaseInstanceReady = $FloorTunTigiDatabase.databaseBuilder('app_database.db')
        .build().then((database) => _database = database);
  }
  Future get isDatabaseReady => _isDatabaseInstanceReady;

  void saveUser({required User user}) {
    _database.userDao.deleteAllUsers();
    _database.userDao.insertSingle(user);
  }

  Future<User?> getUser() async {
    await isDatabaseReady;
    return _database.userDao.getCurrent();
  }

  Future<void> updateUser({required User user}) {
    return _database.userDao.updateSingle(user);
  }

  void savePlayerProfile({required Profile profile}) {
    _database.profileDao.deleteAllProfiles();
    _database.profileDao.insertSingle(profile);
  }

  Future<Profile?> getPlayerProfile() {
    return _database.profileDao.getProfile();
  }

  Future<void> updatePlayerProfile({required Profile profile}) {
    return _database.profileDao.updateSingle(profile);
  }



}