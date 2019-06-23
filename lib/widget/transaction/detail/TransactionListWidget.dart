import 'package:flutter/material.dart';
import 'package:quicknote/data/ColorPattle.dart';

class TransactionListWidget extends StatefulWidget {
  TransactionListWidget({Key key}) : super(key: key);

  _TransactionListWidgetState createState() => _TransactionListWidgetState();
}

class _TransactionListWidgetState extends State<TransactionListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: ListView.builder(
          itemCount: 100,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return _transactionItemWidget();
          },
        ),
      ),
    );
  }

  Widget _transactionItemWidget() {
    return Container(
      margin: EdgeInsets.only(top: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // left date
          Padding(
            padding: EdgeInsets.only(left: 4),
            child: Visibility(
              visible: true,
              child: Column(
                children: <Widget>[
                  Text(
                    '26日',
                    style:
                        TextStyle(fontSize: 18, color: ColorPattle.LIGHT_GRAY),
                  ),
                  Text(
                    '-￥2.00',
                    style: TextStyle(
                        fontFamily: 'Exo2',
                        fontSize: 18,
                        color: ColorPattle.RED),
                  ),
                ],
              ),
            ),
          ),
          // right side
          Expanded(
            child: Column(
              children: <Widget>[
                //left: value description , right: icon
                Container(
                  margin: EdgeInsets.only(left: 16,right: 16),
                 
                  child: Flex(
                    direction: Axis.horizontal,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      // text
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '￥300',
                            style: TextStyle(
                              color: ColorPattle.GREEN,
                              fontSize: 18,
                              fontFamily: 'Exo2',
                            ),
                          ),
                          Text(
                            'Type Something',
                            style: TextStyle(
                              color: ColorPattle.LIGHT_GRAY,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      // icon
                      Image.asset(
                        'images/down_sign.png',
                        fit: BoxFit.cover,
                        width: 20,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.only(left: 16,right: 16,top: 5),
                  color: Color(0xff979797),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
