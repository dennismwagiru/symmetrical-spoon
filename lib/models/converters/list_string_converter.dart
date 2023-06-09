import 'package:floor/floor.dart';

class ListStringConverter extends TypeConverter<List<String>, String> {
  @override
  List<String> decode(String databaseValue) {
    return databaseValue.split(", ");
  }

  @override
  String encode(List<String> list) {
    return list.join(", ");
  }
}