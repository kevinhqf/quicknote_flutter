import 'package:flutter/material.dart';
import 'package:quicknote/data/Category.dart';

class CategoryViewModel with ChangeNotifier {
  List<Category> _categories = List();

  void setCategories(List<Category> categories) {
    _categories = categories;

    notifyListeners();
  }

  List<Category> get categories => _categories;
}
