import 'package:flutter/material.dart';
import 'package:quicknote/widget/transaction/detail/TimelineWidget.dart';
import 'package:quicknote/widget/transaction/detail/TransactionListWidget.dart';
import 'package:quicknote/widget/transaction/detail/TransactionTopWidget.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TransactionPageWidget(),
    );
  }
}

class TransactionPageWidget extends StatefulWidget {
  TransactionPageWidget({Key key}) : super(key: key);

  _TransactionPageWidgetState createState() => _TransactionPageWidgetState();
}

class _TransactionPageWidgetState extends State<TransactionPageWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          // background icon
          Positioned(
            right: 8,
            bottom: 10,
            child: Opacity(
              opacity: 0.37,
              child: Image.network(
                'http://118.24.246.193/pic/quicknote/icon_entertainment.png',
                width: 200,
                height: 200,
              ),
            ),
          ),

          Container(
            alignment: AlignmentDirectional.topStart,
            child: Column(
              children: <Widget>[
                // top
                TransactionTopWidget(),
                //timeline
                TimelineWidget(),
                //list
                Expanded(
                  child: TransactionListWidget(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
