import 'package:quicknote/data/CategoryTransaction.dart';
import 'package:quicknote/data/TransactionView.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBUtil {
  Database _db;

  Future _open() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'quicknote.db');
    print(path);
    _db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
      create table $tableTransactionView (
        $columnId integer primary key autoincrement,
        $columnDescription text not null,
        $columnValue real not null,
        $columnType integer not null,
        $columnTime text not null,
        $columnCategoryId integer not null,
        $columnCategoryName text ,
        $columnCategoryIcon text,
        $columnUserId integer not null)
      ''');
    });
  }

  Future<TransactionView> _insert(TransactionView tv) async {
    tv.id = await _db.insert(tableTransactionView, tv.toMap());
    return tv;
  }

  Future<List<TransactionView>> _getAll() async {
    List<Map<String, dynamic>> records =
        await _db.query(tableTransactionView, orderBy: '$columnTime desc');
    List<TransactionView> transactions = List();
    for (var item in records) {
      transactions.add(TransactionView.fromMap(item));
    }
    return transactions;
  }

  Future<List<CategoryTransaction>> _getCategoryTransactions(
      int categoryId) async {
    List<Map<String, dynamic>> records = await _db.query(tableTransactionView,
        where: '$columnCategoryId=?',
        whereArgs: [categoryId],
        orderBy: '$columnTime desc');
    List<CategoryTransaction> categoryTransactions = List();
    for (var item in records) {
      categoryTransactions.add(CategoryTransaction.fromMap(item));
    }
    return categoryTransactions;
  }

  Future<List<CategoryTransaction>> getCategoryTransactions(
      int categoryId) async {
    List<CategoryTransaction> transactions = List();
    await _open();
    transactions = await _getCategoryTransactions(categoryId);
    await _close();
    return transactions;
  }

  Future<int> _deleteAll() async {
    return await _db.delete(tableTransactionView,
        where: '$columnUserId = ?', whereArgs: [-1]);
  }

  void clear() async{
    await _open();
    await _deleteAll();
    await _close();
  }

  Future _close() async => _db.close();

  void insertTransaction(TransactionView tv) async {
    await _open();
    await _insert(tv);
    await _close();
  }

  Future<List<TransactionView>> insertAndQuery(TransactionView tv) async {
    List<TransactionView> transactions = List();
    await _open();
    await _insert(tv);
    transactions = await _getAll();
    await _close();
    return transactions;
  }

  Future<List<TransactionView>> getAllTransaction() async {
    List<TransactionView> transactions = List();
    await _open();
    transactions = await _getAll();
    await _close();
    return transactions;
  }
}
