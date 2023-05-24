import 'package:floor/floor.dart';

@entity
class User {
  @primaryKey
  final String id;
  final String email;

  User({required this.id, required this.email});

  factory User.fromMap(Map<dynamic, dynamic> data) {
    return User(
      id: data['id'],
      email: data['email'],
    );
  }

  @override
  String toString() {
    return 'id: $id, email: $email, ';
  }
}