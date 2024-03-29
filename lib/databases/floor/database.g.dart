// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorTunTigiDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TunTigiDatabaseBuilder databaseBuilder(String name) =>
      _$TunTigiDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$TunTigiDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$TunTigiDatabaseBuilder(null);
}

class _$TunTigiDatabaseBuilder {
  _$TunTigiDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$TunTigiDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$TunTigiDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<TunTigiDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$TunTigiDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$TunTigiDatabase extends TunTigiDatabase {
  _$TunTigiDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserDao? _userDaoInstance;

  ProfileDao? _profileDaoInstance;

  PlayerDao? _playerDaoInstance;

  TransactionDao? _transactionDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 5,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `User` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `email` TEXT, `usertype` INTEGER, `role` INTEGER, `mobile` TEXT, `isApproved` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Profile` (`id` INTEGER NOT NULL, `referalCode` TEXT, `mobile` TEXT, `name` TEXT, `alias` TEXT, `balance` TEXT, `rank` TEXT, `profpic` TEXT, `position` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Player` (`id` INTEGER NOT NULL, `name` TEXT NOT NULL, `score` INTEGER, `wins` INTEGER, `draws` INTEGER, `loses` INTEGER, `gd` INTEGER, `position` INTEGER, PRIMARY KEY (`id`))');
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Trans` (`id` TEXT NOT NULL, `date` TEXT NOT NULL, `amount` TEXT, `receipt` TEXT, `type` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
  }

  @override
  ProfileDao get profileDao {
    return _profileDaoInstance ??= _$ProfileDao(database, changeListener);
  }

  @override
  PlayerDao get playerDao {
    return _playerDaoInstance ??= _$PlayerDao(database, changeListener);
  }

  @override
  TransactionDao get transactionDao {
    return _transactionDaoInstance ??=
        _$TransactionDao(database, changeListener);
  }
}

class _$UserDao extends UserDao {
  _$UserDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _userInsertionAdapter = InsertionAdapter(
            database,
            'User',
            (User item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'usertype': item.usertype,
                  'role': item.role,
                  'mobile': item.mobile,
                  'isApproved': item.isApproved
                }),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['id'],
            (User item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'email': item.email,
                  'usertype': item.usertype,
                  'role': item.role,
                  'mobile': item.mobile,
                  'isApproved': item.isApproved
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  @override
  Future<User?> getCurrent() async {
    return _queryAdapter.query('SELECT * FROM User Limit 1',
        mapper: (Map<String, Object?> row) => User(
            id: row['id'] as int,
            name: row['name'] as String,
            email: row['email'] as String?,
            usertype: row['usertype'] as int?,
            role: row['role'] as int?,
            mobile: row['mobile'] as String?,
            isApproved: row['isApproved'] as int?));
  }

  @override
  Future<void> deleteAllUsers() async {
    await _queryAdapter.queryNoReturn('DELETE FROM User');
  }

  @override
  Future<void> insertSingle(User user) async {
    await _userInsertionAdapter.insert(user, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSingle(User user) async {
    await _userUpdateAdapter.update(user, OnConflictStrategy.abort);
  }
}

class _$ProfileDao extends ProfileDao {
  _$ProfileDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _profileInsertionAdapter = InsertionAdapter(
            database,
            'Profile',
            (Profile item) => <String, Object?>{
                  'id': item.id,
                  'referalCode': item.referalCode,
                  'mobile': item.mobile,
                  'name': item.name,
                  'alias': item.alias,
                  'balance': item.balance,
                  'rank': item.rank,
                  'profpic': item.profpic,
                  'position': item.position
                }),
        _profileUpdateAdapter = UpdateAdapter(
            database,
            'Profile',
            ['id'],
            (Profile item) => <String, Object?>{
                  'id': item.id,
                  'referalCode': item.referalCode,
                  'mobile': item.mobile,
                  'name': item.name,
                  'alias': item.alias,
                  'balance': item.balance,
                  'rank': item.rank,
                  'profpic': item.profpic,
                  'position': item.position
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Profile> _profileInsertionAdapter;

  final UpdateAdapter<Profile> _profileUpdateAdapter;

  @override
  Future<Profile?> getProfile() async {
    return _queryAdapter.query('SELECT * FROM Profile Limit 1',
        mapper: (Map<String, Object?> row) => Profile(
            id: row['id'] as int,
            referalCode: row['referalCode'] as String?,
            mobile: row['mobile'] as String?,
            name: row['name'] as String?,
            alias: row['alias'] as String?,
            balance: row['balance'] as String?,
            rank: row['rank'] as String?,
            position: row['position'] as int?,
            profpic: row['profpic'] as String?));
  }

  @override
  Future<int?> countProfiles() async {
    return _queryAdapter.query('SELECT count(*) FROM Profile',
        mapper: (Map<String, Object?> row) => row.values.first as int);
  }

  @override
  Future<void> deleteAllProfiles() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Profile');
  }

  @override
  Future<void> insertSingle(Profile profile) async {
    await _profileInsertionAdapter.insert(profile, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSingle(Profile profile) async {
    await _profileUpdateAdapter.update(profile, OnConflictStrategy.abort);
  }
}

class _$PlayerDao extends PlayerDao {
  _$PlayerDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _playerInsertionAdapter = InsertionAdapter(
            database,
            'Player',
            (Player item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'score': item.score,
                  'wins': item.wins,
                  'draws': item.draws,
                  'loses': item.loses,
                  'gd': item.gd,
                  'position': item.position
                }),
        _playerUpdateAdapter = UpdateAdapter(
            database,
            'Player',
            ['id'],
            (Player item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'score': item.score,
                  'wins': item.wins,
                  'draws': item.draws,
                  'loses': item.loses,
                  'gd': item.gd,
                  'position': item.position
                }),
        _playerDeletionAdapter = DeletionAdapter(
            database,
            'Player',
            ['id'],
            (Player item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'score': item.score,
                  'wins': item.wins,
                  'draws': item.draws,
                  'loses': item.loses,
                  'gd': item.gd,
                  'position': item.position
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Player> _playerInsertionAdapter;

  final UpdateAdapter<Player> _playerUpdateAdapter;

  final DeletionAdapter<Player> _playerDeletionAdapter;

  @override
  Future<List<Player>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Player',
        mapper: (Map<String, Object?> row) => Player(
            id: row['id'] as int,
            name: row['name'] as String,
            score: row['score'] as int?,
            wins: row['wins'] as int?,
            draws: row['draws'] as int?,
            loses: row['loses'] as int?,
            gd: row['gd'] as int?,
            position: row['position'] as int?));
  }

  @override
  Future<Player?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM Player WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Player(
            id: row['id'] as int,
            name: row['name'] as String,
            score: row['score'] as int?,
            wins: row['wins'] as int?,
            draws: row['draws'] as int?,
            loses: row['loses'] as int?,
            gd: row['gd'] as int?,
            position: row['position'] as int?),
        arguments: [id]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Player');
  }

  @override
  Future<void> insertSingle(Player player) async {
    await _playerInsertionAdapter.insert(player, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertMultiple(List<Player> players) async {
    await _playerInsertionAdapter.insertList(players, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSingle(Player player) async {
    await _playerUpdateAdapter.update(player, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMultiple(List<Player> players) async {
    await _playerUpdateAdapter.updateList(players, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSingle(Player item) async {
    await _playerDeletionAdapter.delete(item);
  }
}

class _$TransactionDao extends TransactionDao {
  _$TransactionDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _transInsertionAdapter = InsertionAdapter(
            database,
            'Trans',
            (Trans item) => <String, Object?>{
                  'id': item.id,
                  'date': item.date,
                  'amount': item.amount,
                  'receipt': item.receipt,
                  'type': item.type
                }),
        _transUpdateAdapter = UpdateAdapter(
            database,
            'Trans',
            ['id'],
            (Trans item) => <String, Object?>{
                  'id': item.id,
                  'date': item.date,
                  'amount': item.amount,
                  'receipt': item.receipt,
                  'type': item.type
                }),
        _transDeletionAdapter = DeletionAdapter(
            database,
            'Trans',
            ['id'],
            (Trans item) => <String, Object?>{
                  'id': item.id,
                  'date': item.date,
                  'amount': item.amount,
                  'receipt': item.receipt,
                  'type': item.type
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Trans> _transInsertionAdapter;

  final UpdateAdapter<Trans> _transUpdateAdapter;

  final DeletionAdapter<Trans> _transDeletionAdapter;

  @override
  Future<List<Trans>> getAll() async {
    return _queryAdapter.queryList('SELECT * FROM Trans',
        mapper: (Map<String, Object?> row) => Trans(
            id: row['id'] as String,
            date: row['date'] as String,
            amount: row['amount'] as String?,
            receipt: row['receipt'] as String?,
            type: row['type'] as String?));
  }

  @override
  Future<Trans?> findById(int id) async {
    return _queryAdapter.query('SELECT * FROM Trans WHERE id = ?1',
        mapper: (Map<String, Object?> row) => Trans(
            id: row['id'] as String,
            date: row['date'] as String,
            amount: row['amount'] as String?,
            receipt: row['receipt'] as String?,
            type: row['type'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> deleteAll() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Trans');
  }

  @override
  Future<void> insertSingle(Trans item) async {
    await _transInsertionAdapter.insert(item, OnConflictStrategy.abort);
  }

  @override
  Future<void> insertMultiple(List<Trans> items) async {
    await _transInsertionAdapter.insertList(items, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateSingle(Trans item) async {
    await _transUpdateAdapter.update(item, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateMultiple(List<Trans> item) async {
    await _transUpdateAdapter.updateList(item, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteSingle(Trans item) async {
    await _transDeletionAdapter.delete(item);
  }
}

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _listStringConverter = ListStringConverter();
