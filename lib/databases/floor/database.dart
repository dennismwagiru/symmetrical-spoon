
import 'dart:async';

import 'package:floor/floor.dart';
import 'package:tuntigi/databases/dao/user.dart';
import 'package:tuntigi/models/converters/datetine_converter.dart';
import 'package:tuntigi/models/converters/list_string_converter.dart';
import 'package:tuntigi/models/user.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@TypeConverters([DateTimeConverter, ListStringConverter])
@Database(version: 1, entities: [
  User
])

abstract class TunTigiDatabase extends FloorDatabase {
  UserDao get userDao;
}