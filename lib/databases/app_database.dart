
import 'package:tuntigi/databases/floor/database.dart';
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

  void clearLoggedInUser() => _database.userDao.deleteAllUsers();

  void cacheLoggedInUser({required User user}) {
    clearLoggedInUser();
    _database.userDao.insertSingle(user);
  }

  Future<User?> getLoggedInUser() {
    return _database.userDao.getCurrent();
  }

  Future<void> updateUser({required User user}) {
    return _database.userDao.updateSingle(user);
  }



}