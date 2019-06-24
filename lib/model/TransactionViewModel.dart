import 'package:flutter/material.dart';
import 'package:quicknote/api/API.dart';
import 'package:quicknote/data/CategoryGroup.dart';
import 'package:quicknote/data/CategoryTransaction.dart';
import 'package:quicknote/data/TransactionView.dart';
import 'package:quicknote/model/UserViewModel.dart';
import 'package:quicknote/utils/SPUtil.dart';
import 'package:quicknote/utils/Utils.dart';

class TransactionViewModel with ChangeNotifier {
  static const NEW_TYPE_INCOME = 1;
  static const NEW_TYPE_SPEND = 0;
  // new transaction page
  int _newType = -1;
  String _newValueStr = "0";
  String _newDescription = "";
  int _newCategoryId = -1;

  // home page
  List<TransactionView> _allTransactions = List();
  double _homeTotalBalance = 0.0;
  double _homeTodayBalance = 0.0;

  // profile page
  List<CategoryGroup> _categoryGroups = List();
  double _profileIncome = 0.0;
  double _profileSpend = 0.0;

  // transaction page
  List<CategoryTransaction> _categoryTransactions = List();
  String _transactionCategoryName = "";
  String _transactionYearAndMonth = "";
  String _transactionCategoryIcon = "";
  double _transactionTotalBalance = 0.0;
  double _transactionIncome = 0.0;
  double _transactionSpend = 0.0;
  String _transactionMonthBalance = "￥0";

  void setNewCategoryId(int newCategoryId) {
    _newCategoryId = newCategoryId;
    notifyListeners();
  }

  void setNewType(int newType) {
    _newType = newType;
    notifyListeners();
  }

  void addTransaction(String tmpDescription) {
    SPUtil().getBool(UserViewModel.KEY_IS_USER_LOGIN).then((isLogin) {
      if (isLogin) {
        SPUtil().getInt(UserViewModel.KEY_USER_ID).then((userId) {
          TransactionView tv = TransactionView(
              null,
              _newDescription.isEmpty ? tmpDescription : _newDescription,
              _newType == NEW_TYPE_SPEND
                  ? (double.parse(_newValueStr) * -1)
                  : (double.parse(_newValueStr)),
              _newType,
              Utils.getNowDate(),
              _newCategoryId,
              null,
              null,
              userId);
          // 服务器添加数据
          API.addTransaction(tv).then((value) {
            _clearAllNewData();
            API.getAllTransactions(userId ?? -1).then((value) {
              setAllTransactions(value);
            });
          });
        });
      }
    });
  }

  void _clearAllNewData() {
    _newType = -1;
    _newValueStr = "0";
    _newDescription = "";
    _newCategoryId = -1;
  }

  void setCategoryTransactions(List<CategoryTransaction> data) {
    _categoryTransactions = data;
    _setTransactionDate(data);
    notifyListeners();
  }

  void _setTransactionDate(List<CategoryTransaction> data) {
    if (data.isNotEmpty) {
      var ct = data[0];
      _transactionCategoryName = ct.categoryName;
      _transactionCategoryIcon = ct.categoryIcon;
      setTransactionYearAndMonth(Utils.getYearAndMonth(ct.time),
          needNotify: false);
    }
    _transactionTotalBalance = data.fold(0.0, (acc, ct) => acc + ct.value);
    _transactionIncome =
        data.where((ct) => ct.value > 0).fold(0.0, (acc, ct) => acc + ct.value);
    _transactionSpend =
        data.where((ct) => ct.value < 0).fold(0.0, (acc, ct) => acc + ct.value);
  }

  void setTransactionYearAndMonth(String yearAndMonth,
      {bool needNotify = true}) {
    _transactionYearAndMonth = yearAndMonth;
    double balance = _categoryTransactions
        .where((ct) => Utils.isSameYearAndMonthWith(yearAndMonth, ct.time))
        .fold(0.0, (acc, ct) => acc + ct.value);
    _transactionMonthBalance = Utils.getSimpleMoneyFormat(balance);
    if (needNotify) notifyListeners();
  }

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

  void clearAllData() {
    _newCategoryId = -1;
    _newType = -1;
    _newValueStr = "0";
    _newDescription = "";
    // home page
    _allTransactions.clear();
    _homeTotalBalance = 0.0;
    _homeTodayBalance = 0.0;

    // profile page
    _categoryGroups.clear();
    _profileIncome = 0.0;
    _profileSpend = 0.0;

    // transaction page
    _categoryTransactions.clear();
    _transactionCategoryName = "";
    _transactionYearAndMonth = "";
    _transactionCategoryIcon = "";
    _transactionTotalBalance = 0.0;
    _transactionIncome = 0.0;
    _transactionSpend = 0.0;
    _transactionMonthBalance = "￥0";
    notifyListeners();
  }

  int get newCategoryId => _newCategoryId;
  int get newType => _newType;
  String get newValueStr => _newValueStr;
  String get newDescription => _newDescription;

  List<TransactionView> get allTransactions => _allTransactions;
  double get homeTotalBalance => _homeTotalBalance;
  double get homeTodayBalance => _homeTodayBalance;

  List<CategoryGroup> get categoryGroups => _categoryGroups;
  double get profileIncome => _profileIncome;
  double get profileSpend => _profileSpend;

  List<CategoryTransaction> get categoryTransactions => _categoryTransactions;
  String get transactionCategoryName => _transactionCategoryName;
  String get transactionCategoryIcon => _transactionCategoryIcon;
  String get transactionYearAndMonth => _transactionYearAndMonth;
  double get transactionTotalBalance => _transactionTotalBalance;
  double get transactionIncome => _transactionIncome;
  double get transactionSpend => _transactionSpend;
  String get transactionMonthBalance => _transactionMonthBalance;
}
