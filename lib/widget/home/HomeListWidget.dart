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
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            return _dataTile();
          },
        ),
      ),
    );
  }

  Widget _dataTile() {
    return Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Text(
                          '-',
                          style:
                              TextStyle(fontSize: 22, color: Color(0xff04d87f)),
                        ),
                        Text(
                          '￥122,222,222.00',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                              color: Color(0xff04d87f)),
                        )
                      ],
                    ),
                    Text(
                      'Type Something',
                      style: TextStyle(
                        fontSize: 18,
                        color: Color(0xff9b9b9b),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        '06-21 13:11',
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Exo2',
                            color: Color(0xff9b9b9b)),
                      ),
                    ),
                    Image.asset(
                      'images/icon_user.png',
                      height: 45,
                      width: 45,
                    )
                  ],
                ),
              ],
            ),
            Container(
              height: 1,
              color: Color(0x82979797),
              margin: EdgeInsets.only(top: 8, left: 100),
            ),
          ],
        ));
  }
}
