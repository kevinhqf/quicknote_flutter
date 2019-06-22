import 'package:flutter/material.dart';
import 'package:quicknote/data/ColorPattle.dart';
import 'package:quicknote/utils/Utils.dart';
import 'package:quicknote/data/TransactionView.dart';

class HomeListWidget extends StatefulWidget {
  List<TransactionView> _datas;
  State _state;
  HomeListWidget();

  _HomeListWidgetState createState() {
    _state = _HomeListWidgetState();
    return _state;
  } 

  void setData(List<TransactionView> datas){
    this._datas = datas;
     _state.setState((){

     });
  }
}

class _HomeListWidgetState extends State<HomeListWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget._datas == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else
      return Container(
        margin: EdgeInsets.only(top: 8),
        child: MediaQuery.removePadding(
          removeTop: true,
          context: context,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget._datas.length,
            itemBuilder: (BuildContext context, int index) {
              return _dataTile(widget._datas[index]);
            },
          ),
        ),
      );
  }

  Widget _dataTile(TransactionView t) {
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
                          t.value<0?'-':'+',
                          style:
                              TextStyle(fontSize: 22, color: t.value<0?ColorPattle.GREEN:ColorPattle.RED),
                        ),
                        Text(
                          '￥${Utils.getMoneyFormat(t.value)}',
                          style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'Exo2',
                              fontWeight: FontWeight.bold,
                              color: t.value<0?ColorPattle.GREEN:ColorPattle.RED),
                        )
                      ],
                    ),
                    // description
                    Text(
                      t.description,
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
                    // time
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Text(
                        Utils.getDateAndTime(t.time),
                        style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Exo2',
                            color: Color(0xff9b9b9b)),
                      ),
                    ),
                    // icon
                    Image.network(
                      t.categoryIcon,
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
