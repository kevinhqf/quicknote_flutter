import 'package:flutter/material.dart';
import 'package:quicknote/widget/login/LoginCardWidget.dart';

class LoginPageWidget extends StatefulWidget {
  LoginPageWidget({Key key}) : super(key: key);

  _LoginPageWidgetState createState() => _LoginPageWidgetState();
}

class _LoginPageWidgetState extends State<LoginPageWidget> {
  @override
  Widget build(BuildContext context) {
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
                margin: EdgeInsets.only(top: 100,left: 78,right: 78),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      '登录',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xffff7171)
                      ),
                    ),
                    Text(
                      '注册',
                      style: TextStyle(
                        fontSize: 24,
                        color: Color(0xff8a8d97)
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
