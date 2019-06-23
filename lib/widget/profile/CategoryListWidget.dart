import 'package:flutter/material.dart';
import 'package:quicknote/data/CategoryGroup.dart';
import 'package:quicknote/utils/Utils.dart';

class CategoryListWidget extends StatefulWidget {
  List<CategoryGroup> _data;
  _CategoryListWidgetState _state = _CategoryListWidgetState();
  CategoryListWidget({Key key}) : super(key: key);

  _CategoryListWidgetState createState() => _state;

  void setData(List<CategoryGroup> data) {
    _data = data;
    _state.setState(() {});
  }
}

class _CategoryListWidgetState extends State<CategoryListWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget._data == null) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else
      return Container(
        child: MediaQuery.removePadding(
          context: context,
          removeTop: true,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: widget._data.length,
            itemBuilder: (BuildContext context, int index) {
              return _categoryItemWidget(widget._data[index]);
            },
          ),
        ),
      );
  }

  Widget _categoryItemWidget(CategoryGroup cg) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 8, bottom: 4),
      height: 110,
      child: Card(
        elevation: 2.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(right: 16),
              alignment: AlignmentDirectional.centerEnd,
              child: Opacity(
                opacity: 0.37,
                child: Image.network(
                  cg.categoryIcon,
                  width: 96,
                  height: 96,
                ),
              ),
            ),
            Positioned(
              left: 16,
              top: 16,
              child: Text(
                cg.categoryName,
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
                (cg.value < 0 ? "-" : "") +
                    "￥${Utils.getMoneyFormat(cg.value)}",
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
