import 'package:flutter/material.dart';
import 'package:quicknote/api/API.dart';
import 'package:quicknote/data/ColorPattle.dart';
import 'package:quicknote/model/UserViewModel.dart';
import 'package:quicknote/utils/DBUtil.dart';
import 'package:quicknote/utils/LoadingDialog.dart';
import 'package:quicknote/utils/SPUtil.dart';
import 'package:quicknote/utils/ToastUtil.dart';

class PasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.dark,
        backgroundColor: ColorPattle.RED,
        title: Text('设置密码'),
      ),
      body: PasswordPageWidget(),
    );
  }
}

class PasswordPageWidget extends StatefulWidget {
  PasswordPageWidget({Key key}) : super(key: key);

  _PasswordPageWidgetState createState() => _PasswordPageWidgetState();
}

class _PasswordPageWidgetState extends State<PasswordPageWidget> {
  GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();
  String _password;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(24),
      child: Form(
        autovalidate: true,
        key: _passwordKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              style: TextStyle(fontSize: 18),
              obscureText: true,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: '请输入密码',
              ),
              onSaved: (value) {
                _password = value;
              },
              validator: (value) {
                if (value.length < 6) {
                  return '密码必须不小于6位';
                }
              },
            ),
            Padding(
              padding: EdgeInsets.only(top: 16),
              child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: ColorPattle.RED,
                  onPressed: _setPassword,
                  child: Text(
                    '确   认',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }

  void _setPassword() {
    if (_passwordKey.currentState.validate()) {
      _passwordKey.currentState.save();
      LoadingDialog.show(context);
      SPUtil().getInt(UserViewModel.KEY_USER_ID).then((userId) {
        if (userId != -1) {
          API.updatePassword(_password, userId).then((result) {
            if (result != -1) {
              ToastUtil.show('设置成功');
            }
            //dismiss loading
            Navigator.of(context).pop();
            //返回上一页
            Navigator.pop(context);
          });
        }
      });
    }
  }
}
