import 'package:flutter/material.dart';
import 'package:quicknote/widget/transaction/new/NewTransactionPage.dart';

class HomeButtonWidget extends StatefulWidget {
  HomeButtonWidget({Key key}) : super(key: key);

  _HomeButtonWidgetState createState() => _HomeButtonWidgetState();
}

class _HomeButtonWidgetState extends State<HomeButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 12),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
            elevation: 3.0,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.only(left: 40, right: 40, top: 8, bottom: 8),
            color: Color(0xffff7171),
            onPressed: _onIncomeBtnPressed,
            child: Text(
              "收入",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          ),
          RaisedButton(
            elevation: 3.0,
            shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            padding: EdgeInsets.only(left: 40, right: 40, top: 8, bottom: 8),
            color: Color(0xff04d87f),
            onPressed: _onSpendBtnPressed,
            child: Text(
              "支出",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }

  void _onIncomeBtnPressed() {
    Navigator.pushNamed(context, '/newTransaction',arguments: NewTransactionPage.TYPE_INCOME);
  }

  void _onSpendBtnPressed(){
    Navigator.pushNamed(context, '/newTransaction',arguments: NewTransactionPage.TYPE_SPEND);
  }
}
