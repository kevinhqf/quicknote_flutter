class Category{
  int category_id;
  String name;
  String icon;

  Category.fromJson(Map<String,dynamic> map):
    category_id = map['category_id'],
    name = map['name'],
    icon = map['icon'];
}