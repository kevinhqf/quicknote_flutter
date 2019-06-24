import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quicknote/data/CategoryTransaction.dart';
import 'package:quicknote/data/ColorPattle.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:provider/provider.dart';
import 'package:quicknote/utils/Utils.dart';

class TransactionListWidget extends StatefulWidget {
  TransactionListWidget({Key key}) : super(key: key);

  _TransactionListWidgetState createState() => _TransactionListWidgetState();
}

class _TransactionListWidgetState extends State<TransactionListWidget> {
  TransactionViewModel _model;

  @override
  Widget build(BuildContext context) {
    _dateBalanceMap = HashMap();
    _model = Provider.of<TransactionViewModel>(context);
    return Container(
      child: MediaQuery.removePadding(
        removeTop: true,
        context: context,
        child: NotificationListener(
          onNotification: (ScrollNotification notification) {
            switch (notification.runtimeType) {
              case ScrollUpdateNotification:
                var pixels = notification.metrics.pixels;
                if (!notification.metrics.outOfRange) {
                  _setMonthBalance(pixels);
                }
                break;
            }
          },
          child: ListView.builder(
            itemCount: _model.categoryTransactions.length,
            shrinkWrap: true,
            cacheExtent: 25,
            itemBuilder: (BuildContext context, int index) {
              return _transactionItemWidget(
                  _model.categoryTransactions[index], index);
            },
          ),
        ),
      ),
    );
  }

  int _getFirstVisibleItemIndex(double pixels) {
    return (pixels / (_itemHeight + _itemVerticalMargin)).floor();
  }

  void _setMonthBalance(double scrollPixels) {
    int index = _getFirstVisibleItemIndex(scrollPixels);
    var firstItem = _model.categoryTransactions[index];
    if (!Utils.isSameYearAndMonthWith(
        _model.transactionYearAndMonth, firstItem.time)) {
      _model.setTransactionYearAndMonth(Utils.getYearAndMonth(firstItem.time));
    }
  }

  bool _isSameDateWithLastItem(CategoryTransaction ct, int index) {
    if (index == 0) {
      return false;
    } else {
      if (Utils.isSameDate(
          _model.categoryTransactions[index - 1].time, ct.time)) {
        return true;
      } else {
        return false;
      }
    }
  }

  Map<String, String> _dateBalanceMap;
  String _getDateBalance(CategoryTransaction ct) {
    if (_dateBalanceMap == null) _dateBalanceMap = HashMap();
    var date = Utils.getDate(ct.time);
    if (_dateBalanceMap[date] != null) return _dateBalanceMap[date];

    double balance = _model.categoryTransactions
        .where((item) => Utils.isSameDate(item.time, ct.time))
        .fold(0.0, (acc, item) => acc + item.value);
    _dateBalanceMap[date] = Utils.getSimpleMoneyFormat(balance);
    return _dateBalanceMap[date];
  }

  double _itemHeight = 52.0;
  double _itemVerticalMargin = 12.0;
  Widget _transactionItemWidget(CategoryTransaction ct, int index) {
    return Container(
      height: _itemHeight,
      margin: EdgeInsets.only(top: _itemVerticalMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          // left date
          Container(
            width: 85,
            margin: EdgeInsets.only(left: 8),
            child: Visibility(
              visible: !_isSameDateWithLastItem(ct, index),
              maintainState: true,
              maintainSize: true,
              maintainAnimation: true,
              child: Column(
                children: <Widget>[
                  Text(
                    '${Utils.getDay(ct.time)}日',
                    style:
                        TextStyle(fontSize: 18, color: ColorPattle.LIGHT_GRAY),
                  ),
                  Text(
                    _getDateBalance(ct),
                    style: TextStyle(
                        fontFamily: 'Exo2',
                        fontSize: 18,
                        color: _getDateBalance(ct).contains('-')
                            ? ColorPattle.GREEN
                            : ColorPattle.RED),
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
                  margin: EdgeInsets.only(left: 10, right: 24),
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
                            (ct.value < 0 ? '-' : '') +
                                '￥${Utils.getMoneyFormat(ct.value)}',
                            style: TextStyle(
                              color: ct.value > 0
                                  ? ColorPattle.RED
                                  : ColorPattle.GREEN,
                              fontSize: 18,
                              fontFamily: 'Exo2',
                            ),
                          ),
                          Text(
                            ct.description,
                            style: TextStyle(
                              color: ColorPattle.LIGHT_GRAY,
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                      // icon
                      Image.asset(
                        ct.value > 0
                            ? 'images/up_sign.png'
                            : 'images/down_sign.png',
                        fit: BoxFit.cover,
                        width: 20,
                      )
                    ],
                  ),
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.only(left: 16, right: 16, top: 5),
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
