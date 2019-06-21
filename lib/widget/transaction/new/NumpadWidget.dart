import 'package:flutter/material.dart';

class NumpadWidget extends StatefulWidget {
  NumpadWidget({Key key}) : super(key: key);

  _NumpadWidgetState createState() => _NumpadWidgetState();
}

class _NumpadWidgetState extends State<NumpadWidget> {
  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        // first row 123
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(8),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: _onDigitalPressed,
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
              padding: EdgeInsets.all(8),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: _onDigitalPressed,
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
              padding: EdgeInsets.all(8),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: _onDigitalPressed,
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

        // second row 456
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(8),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: _onDigitalPressed,
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
              padding: EdgeInsets.all(8),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: _onDigitalPressed,
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
              padding: EdgeInsets.all(8),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: _onDigitalPressed,
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

        // third row 789
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(8),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: _onDigitalPressed,
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
              padding: EdgeInsets.all(8),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: _onDigitalPressed,
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
              padding: EdgeInsets.all(8),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: _onDigitalPressed,
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

        // forth row dot 0 backspace
        Flex(
          direction: Axis.horizontal,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FlatButton(
              padding: EdgeInsets.all(8),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: _onDigitalPressed,
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
              padding: EdgeInsets.all(8),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: _onDigitalPressed,
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
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
              onPressed: _onDigitalPressed,
              child: Image.asset(
                'images/backspace.png',
                height: 35,
                width: 35,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _onDigitalPressed() {}
}
