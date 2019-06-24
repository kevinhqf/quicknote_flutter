import 'package:flutter/material.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:provider/provider.dart';
import 'package:quicknote/utils/Utils.dart';
class TimelineWidget extends StatefulWidget {
  TimelineWidget({Key key}) : super(key: key);

  _TimelineWidgetState createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  TransactionViewModel _model;
  @override
  Widget build(BuildContext context) {
    _model = Provider.of<TransactionViewModel>(context);
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              // month
              Text(
                '${Utils.getMonth(_model.transactionYearAndMonth)}月',
                style: TextStyle(fontSize: 20),
              ),
              // year
              Text(
                Utils.getYear(_model.transactionYearAndMonth),
                style: TextStyle(fontSize: 15, fontFamily: 'Exo2'),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                _model.transactionMonthBalance,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '总收支',
                style: TextStyle(fontSize: 16),
              ),
            ],
          )
        ],
      ),
    );
  }
}
