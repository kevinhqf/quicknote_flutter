import 'package:flutter/material.dart';
import 'package:quicknote/data/Category.dart';
import 'package:quicknote/data/ColorPattle.dart';
import 'package:quicknote/model/CategoryViewModel.dart';
import 'package:provider/provider.dart';

class NewCategoryCardWidget extends StatefulWidget {
  NewCategoryCardWidget({Key key}) : super(key: key);

  _NewCategoryCardWidgetState createState() => _NewCategoryCardWidgetState();
}

class _NewCategoryCardWidgetState extends State<NewCategoryCardWidget> {
  CategoryViewModel _model;
  var _isSelection = List.filled(12, false);
  @override
  Widget build(BuildContext context) {
    _model = Provider.of<CategoryViewModel>(context);
    return Column(
      children: <Widget>[
        Container(
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
                      itemCount: _model.categories.length,
                      itemBuilder: (BuildContext context, int index) {
                        return _categoryItemWidget(
                            _model.categories[index], index);
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
        ),
        Container(
          height: 100,
          margin: EdgeInsets.only(bottom: 48, left: 32, right: 32),
          child: Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                  elevation: 3.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  onPressed: () {},
                  color: Color(0xffff7171),
                  child: Text(
                    '完成',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  void _setSelection(int index) {
    for(var i=0;i<_isSelection.length;i++){
      _isSelection[i]=false;
    }
    _isSelection[index] = true;
  }

  Widget _categoryItemWidget(Category c, int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FlatButton(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          color: _isSelection[index] ? Colors.white : Color(0xfff7f7f7),
          padding: EdgeInsets.all(12),
          shape: CircleBorder(
              side: BorderSide(
                  color: _isSelection[index]
                      ? ColorPattle.RED
                      : Colors.transparent)),
          onPressed: () {
            setState(() {
              _setSelection(index);
            });
          },
          child: Image.network(
            c.icon,
            width: 35,
            height: 35,
            color: _isSelection[index] ? null : Color(0xffced0d2),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 8),
          child: Text(
            c.name,
            style: TextStyle(
              fontSize: 16,
              color: _isSelection[index] ? ColorPattle.RED : Color(0xffced0d2),
            ),
          ),
        )
      ],
    );
  }
}
