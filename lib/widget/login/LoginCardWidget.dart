import 'package:flutter/material.dart';
import 'package:quicknote/api/API.dart';
import 'package:quicknote/data/User.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:quicknote/model/UserViewModel.dart';
import 'package:quicknote/utils/SPUtil.dart';
import 'package:quicknote/utils/ToastUtil.dart';
import 'package:quicknote/utils/Utils.dart';
import 'package:provider/provider.dart';

class LoginCardWidget extends StatefulWidget {
  LoginCardWidget({Key key}) : super(key: key);

  _LoginCardWidgetState createState() => _LoginCardWidgetState();
}

class _LoginCardWidgetState extends State<LoginCardWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _phone = "";
  String _password = "";
  UserViewModel _model;
  @override
  Widget build(BuildContext context) {
    _model = Provider.of<UserViewModel>(context);
    return Container(
        margin: EdgeInsets.only(top: 8, left: 32, right: 32),
        child: Form(
          key: _formKey,
          autovalidate: true,
          child: Stack(
            overflow: Overflow.visible,
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                elevation: 3.0,
                child: Column(
                  children: <Widget>[
                    // 手机号码
                    Padding(
                      padding: EdgeInsets.only(
                          left: 24, right: 24, top: 24, bottom: 8),
                      child: TextFormField(
                        keyboardType: TextInputType.phone,
                        decoration: const InputDecoration(
                          helperStyle: TextStyle(color: Colors.red),
                          labelText: '手机号码',
                          labelStyle: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                        onSaved: (String value) {
                          _phone = value;
                        },
                        validator: (String value) {
                          if (!Utils.isPhoneNumber(value)) return "非法的手机号码";
                        },
                      ),
                    ),
                    // 密码
                    Padding(
                      padding: EdgeInsets.only(left: 24, right: 24, bottom: 60),
                      child: TextFormField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: const InputDecoration(
                          helperStyle: TextStyle(color: Colors.red),
                          labelText: '密码',
                          labelStyle: TextStyle(fontSize: 18),
                        ),
                        onSaved: (String value) {
                          _password = value;
                        },
                        validator: (String value) {
                          if (value.length < 6) return "密码必须大于6位";
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // 按钮
              Positioned(
                right: 50,
                bottom: -15,
                height: 45,
                child: RaisedButton(
                  color: Color(0xffff7171),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28)),
                  onPressed: _onActionPressed,
                  child: Image.asset('images/icon_arrow_right.png'),
                ),
              )
            ],
          ),
        ));
  }

  void _onActionPressed() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      //登录
      if (_model.isLoginActive) {
        API.login(_phone, _password).then((value) {
          if (value.user != null) {
            _saveUserAndPullHomePageData(value.user);
          }
          ToastUtil.show(value.md.message);
        });
      } else {
        //注册
        API.signup(_phone, _password).then((value) {
          if (value.user != null) {
            _saveUserAndPullHomePageData(value.user);
          }
          ToastUtil.show(value.md.message);
        });
      }
    }
  }

  void _saveUserAndPullHomePageData(User user) {
    SPUtil().save(UserViewModel.KEY_IS_USER_LOGIN, true);
    SPUtil().save(UserViewModel.KEY_USER_ID, user.user_id);
    Navigator.pop(context);
    // 刷新首页数据
    API.getAllTransactions(user.user_id).then((value) {
      Provider.of<TransactionViewModel>(context).setAllTransactions(value);
    });
  }
}
