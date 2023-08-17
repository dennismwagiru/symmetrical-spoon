import 'package:floor/floor.dart';

// "gamezone_id": 82,
// "gamezone": "Tuntigi - Grandhustle",
// "county": "Mombasa",
// "constituency": "Mvita",
// "ward": "Jomvu Kuu",
// "contact": "254"

@entity
class Gamezone {
  @primaryKey
  final int gamezone_id;
  final String gamezone;
  final String county;
  final String constituency;
  final String ward;
  final String contact;

  Gamezone({
    required this.gamezone_id, required this.gamezone, required this.county, required this.constituency,
    required this.ward, required this.contact,
  });

  factory Gamezone.fromMap(Map<dynamic, dynamic> data) {
    return Gamezone(
      gamezone_id: data['gamezone_id'],
      gamezone: data['gamezone'],
      county: data['county'],
      constituency: data['constituency'],
      ward: data['ward'],
      contact: data['contact'],
    );
  }
}