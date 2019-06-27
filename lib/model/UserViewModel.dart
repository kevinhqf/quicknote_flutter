import 'package:flutter/material.dart';

class UserViewModel with ChangeNotifier {
  static const KEY_USER_ID = "user_id";
  static const KEY_IS_USER_LOGIN = "is_user_login";

  bool _isSMSCodeMode = true;
  bool _canGetSmsCode = true;

  bool _loginActive = true;

  void setLoginActive(bool active) {
    _loginActive = active;
    notifyListeners();
  }

  void setSMSCodeMode(bool active) {
    _isSMSCodeMode = active;
    notifyListeners();
  }

  void setCanGetSmsCode(bool canGet, {bool needNotify = true}) {
    _canGetSmsCode = canGet;
    if (needNotify) notifyListeners();
  }

  bool get isLoginActive => _loginActive;
  bool get smsCodeMode => _isSMSCodeMode;
  bool get canGetSmsCode => _canGetSmsCode;
}
