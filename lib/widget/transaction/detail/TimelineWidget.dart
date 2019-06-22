import 'package:flutter/material.dart';

class TimelineWidget extends StatefulWidget {
  TimelineWidget({Key key}) : super(key: key);

  _TimelineWidgetState createState() => _TimelineWidgetState();
}

class _TimelineWidgetState extends State<TimelineWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              Text(
                '1月',
                style: TextStyle(fontSize: 20),
              ),
              Text(
                '2019',
                style: TextStyle(fontSize: 15, fontFamily: 'Exo2'),
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Text(
                '￥10K',
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
