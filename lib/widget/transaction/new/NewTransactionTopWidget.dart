import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:quicknote/utils/Utils.dart';
import 'package:quicknote/widget/transaction/new/NewTransactionPage.dart';

class NewTransactionTopWidget extends StatefulWidget {
  int type = -1;

  NewTransactionTopWidget(this.type);

  _NewTransactionTopWidgetState createState() =>
      _NewTransactionTopWidgetState();
}

class _NewTransactionTopWidgetState extends State<NewTransactionTopWidget> {
  GlobalKey<FormState> _descKey = GlobalKey<FormState>();
  TransactionViewModel _model;
  @override
  Widget build(BuildContext context) {
    _model = Provider.of<TransactionViewModel>(context);
    return Stack(
      children: <Widget>[
        // top bg
        Image.asset(
          "images/new_transaction_top.png",
          fit: BoxFit.cover,
          width: MediaQuery.of(context).size.width,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            // title
            Padding(
              padding: EdgeInsets.only(
                  left: 24, top: MediaQuery.of(context).padding.top),
              child: Text(
                widget.type == NewTransactionPage.TYPE_INCOME ? '收入' : '支出',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            // money value
            Padding(
              padding: EdgeInsets.only(top: 56),
              child: Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '￥',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    _model.newValueStr,
                    style: TextStyle(
                      fontFamily: 'Exo2',
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // line
            Container(
              height: 2,
              color: Colors.white,
              margin: EdgeInsets.only(top: 3, left: 50, right: 50),
            ),
            // descript text
            Padding(
              padding: EdgeInsets.only(top: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) => _onEditDescription());
                    },
                    child: Text(
                      _model.newDescription.isEmpty
                          ? '点击编辑描述'
                          : _model.newDescription,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Image.asset(
                    'images/arrow.png',
                    width: 20,
                    height: 20,
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }

  Widget _onEditDescription() {
    return SimpleDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: EdgeInsets.all(0),
      children: <Widget>[
        Form(
          key: _descKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16, right: 16, bottom: 24),
                child: TextFormField(
                  controller: TextEditingController(text: _model?.newDescription),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    hintText: '请输入收入描述',
                    labelText: '收支描述',
                    labelStyle: TextStyle(fontSize: 18),
                  ),
                  onSaved: (value) {
                    _model?.setNewDescription(value);
                  },
                  
                ),
              ),
              FlatButton(
                onPressed: () {
                  _descKey.currentState.save();
                  Navigator.of(context).pop();
                  setState(() {});
                },
                child: Text('确定'),
              )
            ],
          ),
        )
      ],
    );
  }
}
