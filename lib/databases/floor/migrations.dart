import 'package:floor/floor.dart';

final migration1to2 = Migration(1, 2, (database) async {
  await database.execute('ALTER TABLE Player ADD COLUMN gd INTEGER');
});

final migration2to3 = Migration(2, 3, (database) async {
  await database.execute('ALTER TABLE Player ADD COLUMN position INTEGER');
});

final migration3to4 = Migration(2, 3, (database) async {
  await database.execute('ALTER TABLE Profile ADD COLUMN position INTEGER');
});