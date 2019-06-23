import 'dart:convert';

import 'package:quicknote/data/CategoryGroup.dart';
import 'package:quicknote/data/TransactionView.dart';
import 'package:http/http.dart' as http;

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
      if(response.statusCode == 200){
        var resJson = json.decode(response.body);
        for(var data in resJson){
          var cg = CategoryGroup.fromJson(data);
          list.add(cg);
        }
      }
    } catch (e) {
      print(e);
    }
    return list;
  }
}
