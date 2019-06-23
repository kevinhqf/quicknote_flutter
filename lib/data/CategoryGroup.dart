class CategoryGroup{
  int categoryId;
  String categoryName;
  double value;
  String categoryIcon;

  CategoryGroup.fromJson(Map<String,dynamic> map)
  : categoryId=map['categoryId'],
  categoryName = map['categoryName'],
  value = map['value'],
  categoryIcon = map['categoryIcon'];
}