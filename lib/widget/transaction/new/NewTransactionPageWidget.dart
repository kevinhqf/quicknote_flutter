import 'package:flutter/material.dart';
import 'package:quicknote/widget/transaction/new/NewCategoryCardWidget.dart';
import 'package:quicknote/widget/transaction/new/NewTransactionTopWidget.dart';
import 'package:quicknote/widget/transaction/new/NumpadWidget.dart';

class NewTransactionPageWidget extends StatefulWidget {
  NewTransactionPageWidget({Key key}) : super(key: key);

  _NewTransactionPageWidgetState createState() =>
      _NewTransactionPageWidgetState();
}

class _NewTransactionPageWidgetState extends State<NewTransactionPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //top
            NewTransactionTopWidget(),
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
                      onPressed: () {},
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
              visible: false,
              child: NewCategoryCardWidget(),
            ))
      ],
    );
  }
}
