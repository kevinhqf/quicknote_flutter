import 'package:flutter/material.dart';
import 'package:quicknote/data/TransactionView.dart';
import 'package:quicknote/utils/Utils.dart';

class ProfileTopWidget extends StatefulWidget {

  _ProfileTopWidgetState _state = _ProfileTopWidgetState();

  ProfileTopWidget({Key key}) : super(key: key);

  _ProfileTopWidgetState createState() => _state;


  void setData(List<TransactionView> data){
    // todo get a single api in server
    _state.totalIncome = data.where((item)=>item.value>0).fold(0.0, (acc,cg)=>acc+cg.value);
     _state.totalSpend = data.where((item)=>item.value<0).fold(0.0, (acc,cg)=>acc+cg.value);
   
    _state.setState((){});
  }

}

class _ProfileTopWidgetState extends State<ProfileTopWidget> {
  double totalIncome = 0.0;
  double totalSpend = 0.0;

  @override
  Widget build(BuildContext context) {
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
                    '￥${Utils.getMoneyFormat(totalIncome)}',
                    style: TextStyle(
                        fontFamily: 'Exo2', fontSize: 20, color: Colors.white),
                  ),
                  Text(
                    '总支出',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                  Text(
                    '￥${Utils.getMoneyFormat(totalSpend)}',
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
