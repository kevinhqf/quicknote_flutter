import 'package:flutter/material.dart';

class CategoryListWidget extends StatefulWidget {
  CategoryListWidget({Key key}) : super(key: key);

  _CategoryListWidgetState createState() => _CategoryListWidgetState();
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: 12,
          itemBuilder: (BuildContext context, int index) {
            return _CategoryItemWidget();
          },
        ),
      ),
    );
  }

  Widget _CategoryItemWidget() {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 4),
      height: 110,
      child: Card(
        child: Stack(
          children: <Widget>[
            Container(
              alignment: AlignmentDirectional.centerEnd,
              child: Opacity(
                opacity: 0.37,
                child: Image.asset(
                  "images/icon_food.png",
                  width: 96,
                  height: 96,
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 16,
              child: Text(
                "饮食",
                style: TextStyle(
                    color: Color(0xff4a4a4a),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: Text(
                "￥1,200.00",
                style: TextStyle(
                    fontFamily: 'Exo2',
                    color: Color(0xff4a4a4a),
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
