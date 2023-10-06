
import 'package:tuntigi/databases/floor/database.dart';
import 'package:tuntigi/models/player.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:tuntigi/models/transaction.dart';
import 'package:tuntigi/models/user.dart';

import 'floor/migrations.dart';

class AppDatabase {

  late Future _isDatabaseInstanceReady;

  late TunTigiDatabase _database;

  static final AppDatabase _instance = AppDatabase._internal();

  factory AppDatabase() => _instance;

  AppDatabase._internal() {
    _isDatabaseInstanceReady = $FloorTunTigiDatabase.databaseBuilder('app_database.db')
        .addMigrations([migration1to2, migration2to3, migration3to4, migration4to5])
        .build().then((database) => _database = database);
  }
  Future get isDatabaseReady => _isDatabaseInstanceReady;

  void saveUser({required User user}) {
    _database.userDao.deleteAllUsers();
    _database.userDao.insertSingle(user);
  }

  void clearUser() {
    _database.userDao.deleteAllUsers();
    _database.profileDao.deleteAllProfiles();
  }

  Future<User?> getUser() async {
    await isDatabaseReady;
    return _database.userDao.getCurrent();
  }

  Future<void> updateUser({required User user}) {
    return _database.userDao.updateSingle(user);
  }

  Future<void> savePlayerProfile({required Profile profile}) async {
    print('Profile: ${profile}');
    _database.profileDao.deleteAllProfiles();
    _database.profileDao.insertSingle(profile);
    final p = await _database.profileDao.countProfiles();
    print('Saved: ${p}');
  }

  Future<Profile?> getPlayerProfile() {
    return _database.profileDao.getProfile();
  }

  Future<void> updatePlayerProfile({required Profile profile}) {
    return _database.profileDao.updateSingle(profile);
  }

  Future<List<Player>> getPlayers() {
    return _database.playerDao.getAll();
  }

  Future<Player?> getPlayer({required int id}) {
    return _database.playerDao.findById(id);
  }

  Future<void> insertPlayer(Player player) {
    return _database.playerDao.insertSingle(player);
  }

  Future<void> insertPlayers(List<Player> players) {
    _database.playerDao.deleteAll();
    return _database.playerDao.insertMultiple(players);
  }


  Future<List<Trans>> getTransactions() {
    return _database.transactionDao.getAll();
  }

  Future<Trans?> getTransaction({required int id}) {
    return _database.transactionDao.findById(id);
  }

  Future<void> insertTransactions(List<Trans> transactions) {
    _database.transactionDao.deleteAll();
    return _database.transactionDao.insertMultiple(transactions);
  }
}