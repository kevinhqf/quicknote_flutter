import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:quicknote/api/API.dart';
import 'package:quicknote/data/ColorPattle.dart';
import 'package:quicknote/data/TransactionView.dart';
import 'package:quicknote/data/User.dart';
import 'package:quicknote/data/UserResponse.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:quicknote/model/UserViewModel.dart';
import 'package:quicknote/utils/DBUtil.dart';
import 'package:quicknote/utils/LoadingDialog.dart';
import 'package:quicknote/utils/SPUtil.dart';
import 'package:quicknote/utils/ToastUtil.dart';
import 'package:quicknote/utils/Utils.dart';
import 'package:provider/provider.dart';
import 'package:mobsms/mobsms.dart';
import 'dart:async';

class LoginCardWidget extends StatefulWidget {
  LoginCardWidget({Key key}) : super(key: key);

  _LoginCardWidgetState createState() => _LoginCardWidgetState();
}

class _LoginCardWidgetState extends State<LoginCardWidget> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _phone = "";
  String _password = "";
  String _smsCode = "";
  UserViewModel _model;
  int _countDown = 30;
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _timer?.cancel();
    _model.setCanGetSmsCode(true, needNotify: false);
  }

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
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      padding: EdgeInsets.only(left: 24, right: 24),
                      child: Flex(
                        direction: Axis.horizontal,
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: TextFormField(
                              keyboardType: _model.smsCodeMode
                                  ? TextInputType.number
                                  : TextInputType.text,
                              obscureText: !_model.smsCodeMode,
                              decoration: InputDecoration(
                                helperStyle: TextStyle(color: Colors.red),
                                labelText: (_model.smsCodeMode ? '验证码' : '密码'),
                                labelStyle: TextStyle(fontSize: 18),
                              ),
                              onSaved: (String value) {
                                if (_model.smsCodeMode) {
                                  _smsCode = value;
                                } else {
                                  _password = value;
                                }
                              },
                              validator: (String value) {
                                if (!_model.smsCodeMode && value.length < 6)
                                  return "密码必须大于6位";
                              },
                            ),
                          ),
                          Visibility(
                            visible: _model.smsCodeMode,
                            child: Expanded(
                              flex: 3,
                              child: Padding(
                                padding: EdgeInsets.only(left: 8),
                                child: FlatButton(
                                  disabledColor: ColorPattle.LIGHT_GRAY,
                                  color: ColorPattle.RED,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8)),
                                  onPressed: _model.canGetSmsCode
                                      ? _onGetSmsCodePressed
                                      : null,
                                  child: Text(
                                    _model.canGetSmsCode
                                        ? '获取验证码'
                                        : '($_countDown秒)后重新获取',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(top: 16, bottom: 38, left: 12),
                      child: Visibility(
                        visible: _model.isLoginActive,
                        child: FlatButton(
                          highlightColor: Colors.transparent,
                          onPressed: () {
                            _model.setSMSCodeMode(!_model.smsCodeMode);
                          },
                          child: Text(
                            _model.smsCodeMode ? '密码方式登录' : '短信验证码登录',
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              // 按钮
              Positioned(
                right: 35,
                bottom: -15,
                height: 45,
                child: RaisedButton(
                  color: Color(0xffff7171),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(28)),
                  onPressed: _onActionPressed,
                  child: Text(
                    _model.isLoginActive ? 'Go!' : "注册",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  //Image.asset('images/icon_arrow_right.png')
                ),
              )
            ],
          ),
        ));
  }

  Timer _timer;
  void _startCountdownTimer() {
    setState(() {
      _countDown = 30;
    });

    const oneSec = const Duration(seconds: 1);
    var callback = (timer) => {
          setState(() {
            if (_countDown < 1) {
              _timer?.cancel();
              _model.setCanGetSmsCode(true);
            } else {
              _countDown--;
            }
          })
        };
    _timer = Timer.periodic(oneSec, callback);
  }

  void _onGetSmsCodePressed() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      // 注册时检查手机是否已注册
      if (!_model.isLoginActive) {
        API.getUser(_phone).then((userResponse) {
          if (userResponse.user != null) {
            ToastUtil.show('该手机号码已经被注册啦！');
          } else {
            // 注册时获取验证码
            _requestSmsCode(_phone);
            _startCountdownTimer();
            _model.setCanGetSmsCode(false);
          }
        });
      } else {
        // 登录时获取验证码
        _requestSmsCode(_phone);
        _startCountdownTimer();
        _model.setCanGetSmsCode(false);
      }
    }
  }

  void _requestSmsCode(String phone) {
    Smssdk.getTextCode(phone, "86", "", (dynamic ret, Map err) {
      if (err != null) {
        print("request err");
        print(err.toString());
      } else {
        String rst = ret.toString();
        if (rst == null || rst == "") {
          rst = '获取验证码成功!';
        }
        print(rst);
      }
    });
  }

  void _onActionPressed() {
    LoadingDialog.show(context);
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      if (_model.smsCodeMode) {
        // 短信验证码方式登录
        Smssdk.commitCode(_phone, "86", _smsCode, (dynamic ret, Map err) {
          print(_smsCode);
          if (err != null) {
            print("commit err ");
            print(err.toString());
            ToastUtil.show('验证码错误');
          } else {
            print("提交验证码成功");
            // api 登录
            API.loginWithSmsCode(_phone).then((value) {
              //dismiss loading
              Navigator.of(context).pop();
              if (value.user != null) {
                _saveUserAndPullHomePageData(value.user);
              }
              ToastUtil.show(value.md.message);
            });
          }
        });
      } else {
        // 密码方式登录
        if (_model.isLoginActive) {
          API.login(_phone, _password).then((value) {
            //dismiss loading
            Navigator.of(context).pop();
            if (value.user != null) {
              _saveUserAndPullHomePageData(value.user);
            }
            ToastUtil.show(value.md.message);
          });
        }
      }
      /*   else {
        //注册
        API.signup(_phone, _password).then((value) {
          if (value.user != null) {
            _saveUserAndPullHomePageData(value.user);
          }
          ToastUtil.show(value.md.message);
        });
      } */
    }
  }

  void _showSyncAlertDialog(int userId) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
                title: Text('同步提示'),
                content: Text('需要将本地数据同步到你的账户吗？'),
                actions: <Widget>[
                  FlatButton(
                    child: Text('现在同步'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      LoadingDialog.show(context);
                      DBUtil().getAllTransaction().then((value) {
                        var list = value
                            .map((it) => TransactionView(
                                null,
                                it.description,
                                it.value,
                                it.type,
                                it.time,
                                it.categoryId,
                                null,
                                null,
                                userId))
                            .toList();
                        API.addAllTransactions(list).then((_) {
                          DBUtil().clear();
                          // 刷新首页数据
                          API.getAllTransactions(userId).then((value) {
                            Provider.of<TransactionViewModel>(context)
                                .setAllTransactions(value);
                            //dismiss loading
                            Navigator.of(context).pop();
                            // 返回首页
                            Navigator.pop(context);
                            ToastUtil.show('数据同步成功');
                          });
                        });
                      });
                    },
                  ),
                  FlatButton(
                    child: Text('以后再说'),
                    onPressed: () {
                      Navigator.of(context).pop();
                      LoadingDialog.show(context);
                      // 刷新首页数据
                      API.getAllTransactions(userId).then((value) {
                        Provider.of<TransactionViewModel>(context)
                            .setAllTransactions(value);
                        //dismiss loading
                        Navigator.of(context).pop();
                        // 返回首页
                        Navigator.pop(context);
                      });
                    },
                  )
                ]));
  }

  void _saveUserAndPullHomePageData(User user) {
    SPUtil().save(UserViewModel.KEY_IS_USER_LOGIN, true);
    SPUtil().save(UserViewModel.KEY_USER_ID, user.user_id);
    _showSyncAlertDialog(user.user_id);
  }
}
