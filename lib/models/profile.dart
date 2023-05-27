import 'package:floor/floor.dart';

@entity
class Profile {
  @primaryKey
  final int id;
  final String? mobile;
  final String? name;
  final String? alias;
  final String? balance;
  final String? rank;

  Profile({
    required this.id, required this.mobile, required this.name, this.alias,
    this.balance, this.rank,
  });

  factory Profile.fromMap(Map<dynamic, dynamic> data) {
    return Profile(
        id: data['id'],
        mobile: data['mobileno'],
        name: data['name'],
      alias: data['alias'],
      balance: data['balance'],
      rank: data['rank']

    );
  }

  @override
  String toString() {
    return 'id: $id, name: $name, mobile: $mobile, ';
  }
}