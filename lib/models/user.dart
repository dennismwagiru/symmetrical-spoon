import 'package:floor/floor.dart';

@entity
class User {
  @primaryKey
  final int id;
  final String name;
  final String? email;
  final int? usertype;
  final int? role;
  final String? mobile;
  final int? isApproved;

  User({
    required this.id, required this.name, required this.email, this.usertype,
    this.role, this.mobile, this.isApproved,
  });

  factory User.fromMap(Map<dynamic, dynamic> data) {
    return User(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        usertype: data['usertype'],
        role: data['role'],
        mobile: data['mobileno'],
        isApproved: data['is_approved']
    );
  }

  @override
  String toString() {
    return 'id: $id, name: $name, email: $email, ';
  }
}