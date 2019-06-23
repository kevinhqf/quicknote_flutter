import 'package:flutter/material.dart';
import 'package:quicknote/data/ColorPattle.dart';
import 'package:quicknote/data/TransactionView.dart';
import 'package:quicknote/utils/Utils.dart';

class SummaryCardWidget extends StatefulWidget {
  List<TransactionView> _data;
  _SummaryCardWidgetState _state;
  SummaryCardWidget({Key key}) : super(key: key);

  _SummaryCardWidgetState createState() {
    _state = _SummaryCardWidgetState();
    return _state;
  }

  void setData(List<TransactionView> data) {
    _data = data;
    //todo  get a single api in server
    _state._totalBalance = _data.fold(0.0, (acc, tv) => acc + tv.value);
    _state._todayBalance = _data
        .where((item) => Utils.isToday(item.time))
        .fold(0.0, (acc, tv) => acc + tv.value);
    _state.setState(() {});
  }
}

class _SummaryCardWidgetState extends State<SummaryCardWidget> {
  double _totalBalance = 0.00;
  double _todayBalance = 0.00;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3.0,
        color: Color(0xf2ffffff),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 16, bottom: 8),
              child: Text(
                '总收支',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            // 总收支
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[
                  Text(
                    '￥',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Utils.getMoneyFormat(_totalBalance),
                    style: TextStyle(
                      fontFamily: 'Exo2',
                      fontSize: 36,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            // 今日收支
            Container(
              margin: EdgeInsets.only(bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "￥" + Utils.getMoneyFormat(_todayBalance),
                    style: TextStyle(
                      color: _todayBalance < 0
                          ? ColorPattle.GREEN
                          : ColorPattle.RED,
                      fontFamily: 'Exo2',
                      fontSize: 24,
                    ),
                  ),
                  Visibility(
                    visible: _todayBalance != 0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Image.asset(_todayBalance < 0
                          ? "images/down_sign.png"
                          : "images/up_sign.png",
                          width: 20,),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
