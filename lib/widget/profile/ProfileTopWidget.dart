import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:quicknote/utils/Utils.dart';

class ProfileTopWidget extends StatefulWidget {
  ProfileTopWidget({Key key}) : super(key: key);

  _ProfileTopWidgetState createState() => _ProfileTopWidgetState();
}

class _ProfileTopWidgetState extends State<ProfileTopWidget> {
  TransactionViewModel _model;
  @override
  Widget build(BuildContext context) {
    _model = Provider.of<TransactionViewModel>(context);
    return Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        //bg
        Image.asset(
          'images/default_bg.png',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),

        // left side message
        Container(
          margin: EdgeInsets.only(top: 16),
          child: Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Image.asset(
                  'images/icon_user.png',
                  width: 100,
                  height: 100,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    '总收入',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    '￥${Utils.getMoneyFormat(_model.profileIncome)}',
                    style: TextStyle(
                        fontFamily: 'Exo2', fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    '总支出',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    '￥${Utils.getMoneyFormat(_model.profileSpend)}',
                    style: TextStyle(
                        fontFamily: 'Exo2', fontSize: 20, color: Colors.white),
                  ),
                ],
              )
            ],
          ),
        ),

        // logout
        Positioned(
          right: 16,
          top: MediaQuery.of(context).padding.top + 8,
          child: Image.asset(
            'images/log_out.png',
            width: 30,
            height: 30,
          ),
        )
      ],
    );
  }
}
