import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicknote/api/API.dart';
import 'package:quicknote/data/TransactionView.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:quicknote/widget/home/HomeButtonWidget.dart';
import 'package:quicknote/widget/home/HomeListWidget.dart';
import 'package:quicknote/widget/home/SummaryCardWidget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatefulWidget {
  HomePageWidget({Key key}) : super(key: key);

  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  TransactionViewModel _model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    API.getAllTransactions(4).then((value) {
      _model=Provider.of<TransactionViewModel>(context);
      _model.setAllTransactions(value);
    });
  }

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
                    GestureDetector(
                      child: Image.asset(
                        "images/icon_user.png",
                        height: 40,
                        width: 40,
                      ),
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
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
              // label
              Flex(
                direction: Axis.horizontal,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 24, top: 8),
                    child: Text(
                      "最近收支",
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              // 列表
              Expanded(
                child: HomeListWidget(),
              )
            ],
          ),
        ),
      ],
    );
  }
}
