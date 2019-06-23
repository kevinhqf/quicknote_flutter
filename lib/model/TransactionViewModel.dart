import 'package:flutter/material.dart';
import 'package:quicknote/data/CategoryGroup.dart';
import 'package:quicknote/data/TransactionView.dart';
import 'package:quicknote/utils/Utils.dart';

class TransactionViewModel with ChangeNotifier {
  // new transaction page
  int _newType;
  String _newValueStr = "0";
  String _newDescription = "";
  // home page
  List<TransactionView> _allTransactions = List();
  double _homeTotalBalance = 0.0;
  double _homeTodayBalance = 0.0;

  // profile page
  List<CategoryGroup> _categoryGroups = List();
  double _profileIncome = 0.0;
  double _profileSpend = 0.0;

  void setCategoryGroups(List<CategoryGroup> groups) {
    _categoryGroups = groups;
    _setProfileData(_allTransactions);
    notifyListeners();
  }

  void _setProfileData(List<TransactionView> data) {
    _profileIncome = data
        .where((item) => item.value > 0)
        .fold(0.0, (acc, cg) => acc + cg.value);
    _profileSpend = data
        .where((item) => item.value < 0)
        .fold(0.0, (acc, cg) => acc + cg.value);
  }

  void setAllTransactions(List<TransactionView> transaction) {
    _allTransactions = transaction;
    _setHomeData(transaction);
    notifyListeners();
  }

  void _setHomeData(List<TransactionView> data) {
    _homeTotalBalance = data.fold(0.0, (acc, tv) => acc + tv.value);
    _homeTodayBalance = data
        .where((item) => Utils.isToday(item.time))
        .fold(0.0, (acc, tv) => acc + tv.value);
  }

  void setNewValueStr(String newValue) {
    _newValueStr = newValue;
    notifyListeners();
  }

  void setNewDescription(String newDescription) {
    _newDescription = newDescription;
    notifyListeners();
  }

  String get newValueStr => _newValueStr;
  String get newDescription => _newDescription;

  List<TransactionView> get allTransactions => _allTransactions;
  double get homeTotalBalance => _homeTotalBalance;
  double get homeTodayBalance => _homeTodayBalance;

  List<CategoryGroup> get categoryGroups => _categoryGroups;
  double get profileIncome => _profileIncome;
  double get profileSpend => _profileSpend;
}
