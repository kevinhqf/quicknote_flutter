import 'package:flutter/material.dart';

class NewTransactionTopWidget extends StatefulWidget {
  NewTransactionTopWidget({Key key}) : super(key: key);

  _NewTransactionTopWidgetState createState() =>
      _NewTransactionTopWidgetState();
}

class _NewTransactionTopWidgetState extends State<NewTransactionTopWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        // top bg
        Image.asset(
          "images/new_transaction_top.png",
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // title
            Padding(
              padding: EdgeInsets.only(
                  left: 24, top: MediaQuery.of(context).padding.top),
              child: Text(
                '收入',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            // money value
            Padding(
              padding: EdgeInsets.only(top: 56),
              child: Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '￥',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '123,456,789.00',
                    style: TextStyle(
                      fontFamily: 'Exo2',
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // line
            Container(
              height: 2,
              color: Colors.white,
              margin: EdgeInsets.only(top: 3, left: 50, right: 50),
            ),
            // descript text
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '点击编辑描述',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                  Image.asset(
                    'images/arrow.png',
                    width: 20,
                    height: 20,
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
