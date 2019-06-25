final String tableTransactionView = "transaction_view";
final String columnId = '_id';
final String columnDescription = 'description';
final String columnValue = 'value';
final String columnType = 'type';
final String columnTime = 'time';
final String columnCategoryId = 'categoryId';
final String columnCategoryName = 'categoryName';
final String columnCategoryIcon = 'categoryIcon';
final String columnUserId = 'userId';

class TransactionView {
  int id;
  String description;
  double value;
  int type;
  String time;
  int categoryId;
  String categoryName;
  String categoryIcon;
  int userId;

  TransactionView(this.id, this.description, this.value, this.type, this.time,
      this.categoryId, this.categoryName, this.categoryIcon, this.userId);

  TransactionView.fromJson(Map<String, dynamic> map)
      : id = map['id'],
        description = map['description'],
        value = map['value'],
        type = map['type'],
        time = map['time'],
        categoryId = map['categoryId'],
        categoryName = map['categoryName'],
        categoryIcon = map['categoryIcon'],
        userId = map['userId'];

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      columnDescription: description,
      columnValue: value,
      columnType: type,
      columnTime: time,
      columnCategoryId: categoryId,
      columnCategoryName: categoryName,
      columnCategoryIcon: categoryIcon,
      columnUserId: userId
    };
    if (id != null) {
      map[columnId] = id;
    }
    return map;
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'description': description,
        'value': value,
        'type': type,
        'time': time,
        'categoryId': categoryId,
        'categoryName': categoryName,
        'categoryIcon': categoryIcon,
        'userId': userId,
      };

  TransactionView.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    description = map[columnDescription];
    value = map[columnValue];
    type = map[columnType];
    time = map[columnTime];
    categoryId = map[columnCategoryId];
    categoryName = map[columnCategoryName];
    categoryIcon = map[columnCategoryIcon];
    userId = map[columnUserId];
  }
}
