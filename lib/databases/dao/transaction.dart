import 'package:floor/floor.dart';
import 'package:tuntigi/models/player.dart';
import 'package:tuntigi/models/transaction.dart';
import 'package:tuntigi/models/user.dart';

@dao
abstract class TransactionDao {
  @Query('SELECT * FROM Trans')
  Future<List<Trans>> getAll();

  // @Query('SELECT * FROM Transaction WHERE type = "Deposit"')
  // Future<List<Transaction>> getDeposits();
  //
  // @Query('SELECT * FROM Transaction WHERE type = "Withdrawal"')
  // Future<List<Transaction>> getWithdrawals();

  @Query('SELECT * FROM Trans WHERE id = :id')
  Future<Trans?> findById(int id);

  @insert
  Future<void> insertSingle(Trans item);

  @insert
  Future<void> insertMultiple(List<Trans> items);

  @update
  Future<void> updateSingle(Trans item);

  @update
  Future<void> updateMultiple(List<Trans> item);

  @delete
  Future<void> deleteSingle(Trans item);

  @Query('DELETE FROM Trans')
  Future<void> deleteAll();
}