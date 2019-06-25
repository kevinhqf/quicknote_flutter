import 'TransactionView.dart';
class CategoryTransaction{
  int transactionId;
  String categoryName;
  String categoryIcon;
  double value;
  String description;
  String time;

  CategoryTransaction.fromJson(Map<String,dynamic> map):
  transactionId = map['transactionId'],
  categoryName = map['categoryName'],
  categoryIcon = map['categoryIcon'],
  value = map['value'],
  description = map['description'],
  time = map['time'];

  CategoryTransaction.fromMap(Map<String,dynamic> map){
    transactionId = map[columnId];
    description = map[columnDescription];
    value = map[columnValue];
    time = map[columnTime];
    categoryName = map[columnCategoryName];
    categoryIcon = map[columnCategoryIcon];
  }
}