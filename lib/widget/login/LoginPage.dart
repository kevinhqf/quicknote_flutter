import 'package:flutter/material.dart';
import 'package:quicknote/data/ColorPattle.dart';
import 'package:quicknote/model/UserViewModel.dart';
import 'package:quicknote/widget/login/LoginCardWidget.dart';
import 'package:provider/provider.dart';
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LoginPageWidget(),
    );
  }
}

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  UserViewModel _model;
 
  @override
  Widget build(BuildContext context) {
    _model = Provider.of<UserViewModel>(context);
    return Container(
      child: Stack(
        children: <Widget>[
          //背景
          Image.asset(
            'images/login_bg.png',
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              //顶部 label
              Container(
                margin: EdgeInsets.only(top: 100, left: 78, right: 78),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _model.setLoginActive(true);
                      },
                      child: Text(
                        '登录',
                        style: TextStyle(
                            fontSize: 24,
                            color: _model.isLoginActive
                                ? ColorPattle.RED
                                : ColorPattle.TEXT_GRAY),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                         _model.setLoginActive(false);
                         _model.setSMSCodeMode(true);
                      },
                      child: Text(
                        '注册',
                        style: TextStyle(
                            fontSize: 24,
                            color: !_model.isLoginActive
                                ? ColorPattle.RED
                                : ColorPattle.TEXT_GRAY),
                      ),
                    )
                  ],
                ),
              ),
              LoginCardWidget()
            ],
          )
        ],
      ),
    );
  }
}
