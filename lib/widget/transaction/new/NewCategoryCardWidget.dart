import 'package:flutter/material.dart';

class NewCategoryCardWidget extends StatefulWidget {
  NewCategoryCardWidget({Key key}) : super(key: key);

  _NewCategoryCardWidgetState createState() => _NewCategoryCardWidgetState();
}

class _NewCategoryCardWidgetState extends State<NewCategoryCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125,
      child: Card(
        elevation: 3.0,
        margin: EdgeInsets.only(left: 32, right: 32),
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16, right: 8),
                child: Image.asset('images/black_arrow_left.png'),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 12,
                  itemBuilder: (BuildContext context, int index) {
                    return _categoryItemWidget();
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 16, left: 8),
                child: Image.asset('images/black_arrow_right.png'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _categoryItemWidget() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          color: Color(0xfff7f7f7),
          padding: EdgeInsets.all(8),
          shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
          onPressed: () {},
          child: Image.asset(
            'images/icon_food.png',
            width: 38,
            height: 38,
            color: Color(0xffced0d2),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            "饮食",
            style: TextStyle(
              fontSize: 16,
              color: Color(0xffced0d2),
            ),
          ),
        )
      ],
    );
  }
}
