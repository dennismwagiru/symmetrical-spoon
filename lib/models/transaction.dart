import 'package:floor/floor.dart';

@entity
class Trans {
  @primaryKey
  final String id;
  final String date;
  final String? amount;
  final String? receipt;
  final String? type;

  Trans({
    required this.id, required this.date, required this.amount,
    required this.receipt, this.type,
  });

  factory Trans.fromMap(Map<dynamic, dynamic> data) {
    return Trans(
      id: data['transactionID'],
      date: data['transactionDate'],
      amount: data['transactionAmount'],
      receipt: data['transactionReceipt'],
      type: data['transType'],
    );
  }

  @override
  String toString() {
    return 'id: $id,';
  }
}