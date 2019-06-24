import 'package:shared_preferences/shared_preferences.dart';

class SPUtil {
  static SPUtil _instance = SPUtil._internal();
  SharedPreferences _sp;

  factory SPUtil() => _instance;

  SPUtil._internal() {}

  void save(String key, dynamic value) async {
    _sp = await SharedPreferences.getInstance();
    if (value is int) {
      _sp.setInt(key, value);
    } else if (value is bool) {
      _sp.setBool(key, value);
    } else if (value is String) {
      _sp.setString(key, value);
    } else if (value is double) {
      _sp.setDouble(key, value);
    }
  }

  Future<int> getInt(String key) async{

    _sp = await SharedPreferences.getInstance();
    return _sp.getInt(key);
  }
  Future<bool> getBool(String key) async{

    _sp = await SharedPreferences.getInstance();
    return _sp.getBool(key);
    
  }

  Future<String> getString(String key) async{
    _sp = await SharedPreferences.getInstance();
    return _sp.getString(key);
  }



}
