import 'package:floor/floor.dart';

final migration1to2 = Migration(1, 2, (database) async {
  await database.execute('ALTER TABLE Player ADD COLUMN gd INTEGER');
});

final migration2to3 = Migration(2, 3, (database) async {
  await database.execute('ALTER TABLE Player ADD COLUMN position INTEGER');
});

final migration3to4 = Migration(3, 4, (database) async {
  await database.execute('ALTER TABLE Profile ADD COLUMN position INTEGER');
});

final migration4to5 = Migration(4, 5, (database) async {
  await database.execute('ALTER TABLE Profile ADD COLUMN profpic TEXT');
});