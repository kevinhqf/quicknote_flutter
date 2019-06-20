import 'package:flutter/material.dart';
import 'package:quicknote/utils/Utils.dart';

class SummaryCardWidget extends StatefulWidget {
  SummaryCardWidget({Key key}) : super(key: key);

  _SummaryCardWidgetState createState() => _SummaryCardWidgetState();
}

class _SummaryCardWidgetState extends State<SummaryCardWidget> {
  double totalBalance = 12345676.0;
  double todayBalance = 12345.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
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
                    getMoneyFormat(totalBalance),
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
                    "￥" + getMoneyFormat(todayBalance),
                    style: TextStyle(
                      color: Color(0xffff7171),
                      fontFamily: 'Exo2',
                      fontSize: 24,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 5),
                    child: Image.asset("images/up_sign.png"),
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
