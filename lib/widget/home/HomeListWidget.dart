import 'package:flutter/material.dart';

class HomeListWidget extends StatefulWidget {
  HomeListWidget({Key key}) : super(key: key);

  _HomeListWidgetState createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends State<HomeListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8),
      child: Column(
        children: <Widget>[
          Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 24),
                child: Text(
                  "最近收支",
                  style: TextStyle(fontSize: 18),
                ),
              )
            ],
          ),
          // list

        ],
      ),
    );
  }
}
