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
}
