import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:quicknote/widget/transaction/new/NewTransactionTopWidget.dart';

class NumpadWidget extends StatefulWidget {
  
  NumpadWidget();

  _NumpadWidgetState createState() => _NumpadWidgetState();
}

class _NumpadWidgetState extends State<NumpadWidget> {
  String _valueStr = "0";
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // first row 123
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(8),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                onPressed: () {
                  _onDigitalPressed(1);
                },
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Color(0xff4a4956),
                    fontSize: 36,
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(8),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                onPressed: () {
                  _onDigitalPressed(2);
                },
                child: Text(
                  '2',
                  style: TextStyle(
                    color: Color(0xff4a4956),
                    fontSize: 36,
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(8),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                onPressed: () {
                  _onDigitalPressed(3);
                },
                child: Text(
                  '3',
                  style: TextStyle(
                    color: Color(0xff4a4956),
                    fontSize: 36,
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        // second row 456
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(8),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                onPressed: () {
                  _onDigitalPressed(4);
                },
                child: Text(
                  '4',
                  style: TextStyle(
                    color: Color(0xff4a4956),
                    fontSize: 36,
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(8),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                onPressed: () {
                  _onDigitalPressed(5);
                },
                child: Text(
                  '5',
                  style: TextStyle(
                    color: Color(0xff4a4956),
                    fontSize: 36,
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(8),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                onPressed: () {
                  _onDigitalPressed(6);
                },
                child: Text(
                  '6',
                  style: TextStyle(
                    color: Color(0xff4a4956),
                    fontSize: 36,
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        // third row 789
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(8),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                onPressed: () {
                  _onDigitalPressed(7);
                },
                child: Text(
                  '7',
                  style: TextStyle(
                    color: Color(0xff4a4956),
                    fontSize: 36,
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(8),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                onPressed: () {
                  _onDigitalPressed(8);
                },
                child: Text(
                  '8',
                  style: TextStyle(
                    color: Color(0xff4a4956),
                    fontSize: 36,
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(8),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                onPressed: () {
                  _onDigitalPressed(9);
                },
                child: Text(
                  '9',
                  style: TextStyle(
                    color: Color(0xff4a4956),
                    fontSize: 36,
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),

        // forth row dot 0 backspace
        Expanded(
          child: Flex(
            direction: Axis.horizontal,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(8),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                onPressed: _onDotPressed,
                child: Text(
                  '.',
                  style: TextStyle(
                    color: Color(0xff4a4956),
                    fontSize: 36,
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                splashColor: Colors.transparent,
                padding: EdgeInsets.all(8),
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                onPressed: _onZeroPressed,
                child: Text(
                  '0',
                  style: TextStyle(
                    color: Color(0xff4a4956),
                    fontSize: 36,
                    fontFamily: 'Exo2',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FlatButton(
                padding: EdgeInsets.all(8),
                splashColor: Colors.transparent,
                shape:
                    CircleBorder(side: BorderSide(color: Colors.transparent)),
                onPressed: _onBackspacePressed,
                child: Image.asset(
                  'images/backspace.png',
                  height: 35,
                  width: 35,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void _onDigitalPressed(int value) {
    if (_valueStr == "0") {
      _valueStr = "$value";
      Provider.of<TransactionViewModel>(context).setNewValueStr(_valueStr);
      
      return;
    }
    if (!_has2DecimalAfterDot(_valueStr)) {
      _valueStr = _valueStr + "$value";
      Provider.of<TransactionViewModel>(context).setNewValueStr(_valueStr);
      return;
    }
  }

  void _onZeroPressed() {
    var withoutDot = _valueStr.indexOf('.') == -1;
    var canAppend = ((withoutDot && "0" != _valueStr) &&
            !_has2DecimalAfterDot(_valueStr)) ||
        (!withoutDot && !_has2DecimalAfterDot(_valueStr));
    _valueStr = canAppend ? _valueStr + "0" : _valueStr;
    Provider.of<TransactionViewModel>(context).setNewValueStr(_valueStr);
  }

  void _onDotPressed() {
    var canAppend = _valueStr.indexOf('.') == -1;
    _valueStr = canAppend ? "$_valueStr." : _valueStr;
    Provider.of<TransactionViewModel>(context).setNewValueStr(_valueStr);
  }

  void _onBackspacePressed() {
    if (_valueStr.length > 1)
      _valueStr = _valueStr.substring(0, _valueStr.length - 1);
    else
      _valueStr = "0";
    Provider.of<TransactionViewModel>(context).setNewValueStr(_valueStr);
  }

  bool _has2DecimalAfterDot(String value) {
    if (value.indexOf('.') == -1) return false;
    if (value.indexOf('.') == value.length - 3) return true;
    return false;
  }
}
