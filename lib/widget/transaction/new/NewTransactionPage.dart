import 'package:flutter/material.dart';
import 'package:quicknote/widget/transaction/new/NewCategoryCardWidget.dart';
import 'package:quicknote/widget/transaction/new/NewTransactionTopWidget.dart';
import 'package:quicknote/widget/transaction/new/NumpadWidget.dart';

class NewTransactionPage extends StatelessWidget {
  static const TYPE_INCOME = 1;
  static const TYPE_SPEND = 0;
  int type = -1;
  @override
  Widget build(BuildContext context) {
    type = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: NewTransactionPageWidget(this.type),
    );
  }
}

class NewTransactionPageWidget extends StatefulWidget {
  int type = -1;
  double value = 0.0;
  NewTransactionPageWidget(this.type);

  _NewTransactionPageWidgetState createState() =>
      _NewTransactionPageWidgetState();
}

class _NewTransactionPageWidgetState extends State<NewTransactionPageWidget> {
  bool _isCardVisible = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //top
            NewTransactionTopWidget(widget.type),
            //numpad
            Expanded(
              child: NumpadWidget(),
            ),
            //bottom btn
            Container(
              height: 100,
              margin: EdgeInsets.only(bottom: 48, left: 32, right: 32),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      onPressed: () {
                        _onButtonAction();
                      },
                      color: Color(0xffff7171),
                      child: Text(
                        '选择分类',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        // 分类卡片
        Positioned(
            bottom: 138,
            width: MediaQuery.of(context).size.width,
            child: Visibility(
              visible: _isCardVisible,
              child: NewCategoryCardWidget(),
            ))
      ],
    );
  }

  void _onButtonAction() {
    setState(() {
      _isCardVisible = true;
    });
  }
}
