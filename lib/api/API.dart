import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'dart:convert';
import 'package:quicknote/data/Category.dart';
import 'package:quicknote/data/CategoryGroup.dart';
import 'package:quicknote/data/CategoryTransaction.dart';
import 'package:quicknote/data/TransactionView.dart';
import 'package:http/http.dart' as http;
import 'package:quicknote/data/UserResponse.dart';

class API {
  static const _BASE_URL = 'http://127.0.0.1:8000';

  static Future<List<TransactionView>> getAllTransactions(int userId) async {
    List<TransactionView> list = List();
    try {
      var url = _BASE_URL + "/transaction/all/$userId";
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var resJson = json.decode(response.body);
        for (var data in resJson) {
          var tv = TransactionView.fromJson(data);
          list.add(tv);
        }
      }
    } catch (e) {
      print(e);
    }
    return list;
  }

  static Future<List<CategoryGroup>> getCategoryGroups(int userId) async {
    List<CategoryGroup> list = List();
    try {
      var url = _BASE_URL + "/transaction/group/$userId";
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var resJson = json.decode(response.body);
        for (var data in resJson) {
          var cg = CategoryGroup.fromJson(data);
          list.add(cg);
        }
      }
    } catch (e) {
      print(e);
    }
    return list;
  }

  static Future<List<Category>> getCategories() async {
    List<Category> list = List();
    try {
      var url = _BASE_URL + "/category/all";
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var resJson = json.decode(response.body);
        for (var data in resJson) {
          var c = Category.fromJson(data);
          list.add(c);
        }
      }
    } catch (e) {
      print(e);
    }
    return list;
  }

  static Future<List<CategoryTransaction>> getCategoryTransactions(
      int categoryId, int userId) async {
    List<CategoryTransaction> list = List();
    try {
      var url = _BASE_URL + "/transaction/category/$categoryId/$userId";
      final response = await http.get(url);
      if (response.statusCode == 200) {
        var resJson = json.decode(response.body);
        for (var data in resJson) {
          var ct = CategoryTransaction.fromJson(data);
          list.add(ct);
        }
      }
    } catch (e) {
      print(e);
    }
    return list;
  }

  static Future<UserResponse> login(String phone, String password) async {
    UserResponse user;
    var encryptPwd = md5.convert(utf8.encode(password));

    try {
      var url = _BASE_URL + "/user/login";
      final response =
          await http.post(url, body: {'phone': phone, 'password': encryptPwd.toString()});
      if (response.statusCode == 200) {
        var resJson = json.decode(response.body);
        user = UserResponse.fromJson(resJson);
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}
