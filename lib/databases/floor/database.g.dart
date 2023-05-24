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

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
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
            'CREATE TABLE IF NOT EXISTS `User` (`id` TEXT NOT NULL, `email` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserDao get userDao {
    return _userDaoInstance ??= _$UserDao(database, changeListener);
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
            (User item) =>
                <String, Object?>{'id': item.id, 'email': item.email}),
        _userUpdateAdapter = UpdateAdapter(
            database,
            'User',
            ['id'],
            (User item) =>
                <String, Object?>{'id': item.id, 'email': item.email});

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<User> _userInsertionAdapter;

  final UpdateAdapter<User> _userUpdateAdapter;

  @override
  Future<User?> getCurrent() async {
    return _queryAdapter.query('SELECT * FROM User Limit 1',
        mapper: (Map<String, Object?> row) =>
            User(id: row['id'] as String, email: row['email'] as String));
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

// ignore_for_file: unused_element
final _dateTimeConverter = DateTimeConverter();
final _listStringConverter = ListStringConverter();
