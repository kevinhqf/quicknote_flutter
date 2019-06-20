import 'package:flutter/material.dart';
import 'package:quicknote/widget/home/HomeButtonWidget.dart';
import 'package:quicknote/widget/home/HomeListWidget.dart';
import 'package:quicknote/widget/home/SummaryCardWidget.dart';

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          "images/homebg.png",
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              // 顶部部件
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "首页",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Image.asset(
                      "images/icon_user.png",
                      height: 40,
                      width: 40,
                    )
                  ],
                ),
              ),
              // 卡片部件
              Padding(
                padding: EdgeInsets.only(top: 8, left: 24, right: 24),
                child: SummaryCardWidget(),
              ),
              // 按钮部件
              HomeButtonWidget(),
              // 列表
              HomeListWidget()
            ],
          ),
        ),
      ],
    );
  }
}
