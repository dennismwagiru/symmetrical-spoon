
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:tuntigi/databases/dao/player.dart';
import 'package:tuntigi/databases/dao/profile.dart';
import 'package:tuntigi/databases/dao/transaction.dart';
import 'package:tuntigi/databases/dao/user.dart';
import 'package:tuntigi/models/player.dart';
import 'package:tuntigi/models/converters/datetine_converter.dart';
import 'package:tuntigi/models/converters/list_string_converter.dart';
import 'package:tuntigi/models/transaction.dart';
import 'package:tuntigi/models/user.dart';
import 'package:tuntigi/models/profile.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'database.g.dart';

@TypeConverters([DateTimeConverter, ListStringConverter])
@Database(version: 5, entities: [
  User, Profile, Player, Trans,
])

abstract class TunTigiDatabase extends FloorDatabase {
  UserDao get userDao;
  ProfileDao get profileDao;
  PlayerDao get playerDao;
  TransactionDao get transactionDao;
}