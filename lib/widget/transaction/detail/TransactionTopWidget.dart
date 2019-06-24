import 'package:flutter/material.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:provider/provider.dart';
import 'package:quicknote/utils/Utils.dart';

class TransactionTopWidget extends StatefulWidget {
  TransactionTopWidget({Key key}) : super(key: key);

  _TransactionTopWidgetState createState() => _TransactionTopWidgetState();
}

class _TransactionTopWidgetState extends State<TransactionTopWidget> {
  TransactionViewModel _model;
  @override
  Widget build(BuildContext context) {
    _model = Provider.of<TransactionViewModel>(context);
    return Container(
      child: Stack(
        children: <Widget>[
          // bg
          Image.asset(
            'images/default_bg.png',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          //content
          Column(
            children: <Widget>[
              // first row
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).padding.top, bottom: 8),
                child: Row(
                  children: <Widget>[
                    FlatButton.icon(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      label: Text(
                        _model.transactionCategoryName,
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
              // second row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: <Widget>[
                  Text(
                    _model.transactionTotalBalance<0?'-￥':'￥',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${Utils.getMoneyFormat(_model.transactionTotalBalance)}',
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.white,
                        fontFamily: 'Exo2',
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // third row
              Container(
                child: Padding(
                  padding: EdgeInsets.only(left: 24, top: 16),
                  child: Flex(
                    direction: Axis.horizontal,
                    children: <Widget>[
                      //收入
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Text(
                                '收入',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xbaffffff)),
                              ),
                            ),
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: <Widget>[
                                Text(
                                  '￥',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                                Text(
                                  '${Utils.getMoneyFormat(_model.transactionIncome)}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Exo2',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      // vertical line
                      Container(
                        margin: EdgeInsets.only(right: 24),
                        width: 1,
                        height: 40,
                        color: Color(0xbaffffff),
                      ),

                      // 支出
                      Expanded(
                        flex: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(bottom: 8),
                              child: Text(
                                '支出',
                                style: TextStyle(
                                    fontSize: 16, color: Color(0xbaffffff)),
                              ),
                            ),
                            Row(
                              textBaseline: TextBaseline.alphabetic,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              children: <Widget>[
                                Text(
                                  '￥',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                                Text(
                                  '${Utils.getMoneyFormat(_model.transactionSpend)}',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Exo2',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
