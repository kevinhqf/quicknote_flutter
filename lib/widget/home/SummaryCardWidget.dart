import 'package:flutter/material.dart';
import 'package:quicknote/data/ColorPattle.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:quicknote/utils/Utils.dart';
import 'package:provider/provider.dart';
class SummaryCardWidget extends StatefulWidget {

  SummaryCardWidget({Key key}) : super(key: key);

  _SummaryCardWidgetState createState() =>_SummaryCardWidgetState();

}

class _SummaryCardWidgetState extends State<SummaryCardWidget> {
  TransactionViewModel _model;

  @override
  Widget build(BuildContext context) {
    _model = Provider.of<TransactionViewModel>(context);
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
                    _model.homeTotalBalance>0?'￥':'-￥',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    Utils.getMoneyFormat(_model.homeTotalBalance),
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
                    "￥" + Utils.getMoneyFormat(_model.homeTodayBalance),
                    style: TextStyle(
                      color: _model.homeTodayBalance < 0
                          ? ColorPattle.GREEN
                          : ColorPattle.RED,
                      fontFamily: 'Exo2',
                      fontSize: 24,
                    ),
                  ),
                  Visibility(
                    visible: _model.homeTodayBalance != 0,
                    child: Padding(
                      padding: EdgeInsets.only(left: 5),
                      child: Image.asset(_model.homeTodayBalance < 0
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
