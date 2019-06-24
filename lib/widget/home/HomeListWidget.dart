import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicknote/data/ColorPattle.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:quicknote/utils/Utils.dart';
import 'package:quicknote/data/TransactionView.dart';

class HomeListWidget extends StatefulWidget {
  HomeListWidget();

  _HomeListWidgetState createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends State<HomeListWidget> {
  TransactionViewModel _model;

  @override
  Widget build(BuildContext context) {
    _model = Provider.of<TransactionViewModel>(context);

    if (_model?.allTransactions == null) {
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
            itemCount: _model.allTransactions.length,
            itemBuilder: (BuildContext context, int index) {
              return _dataTile(_model.allTransactions[index]);
            },
          ),
        ),
      );
  }

  Widget _dataTile(TransactionView t) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/transaction',arguments: t.categoryId);
      },
      child: Container(
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
                            t.value < 0 ? '-' : '+',
                            style: TextStyle(
                                fontSize: 22,
                                color: t.value < 0
                                    ? ColorPattle.GREEN
                                    : ColorPattle.RED),
                          ),
                          Text(
                            '￥${Utils.getMoneyFormat(t.value)}',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Exo2',
                                fontWeight: FontWeight.bold,
                                color: t.value < 0
                                    ? ColorPattle.GREEN
                                    : ColorPattle.RED),
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
          )),
    );
  }
}
