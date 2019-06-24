import 'package:flutter/material.dart';
import 'package:quicknote/api/API.dart';
import 'package:quicknote/data/ColorPattle.dart';
import 'package:quicknote/model/CategoryViewModel.dart';
import 'package:quicknote/widget/transaction/new/NewCategoryCardWidget.dart';
import 'package:quicknote/widget/transaction/new/NewTransactionTopWidget.dart';
import 'package:quicknote/widget/transaction/new/NumpadWidget.dart';
import 'package:provider/provider.dart';
class NewTransactionPage extends StatelessWidget {
  static const TYPE_INCOME = 1;
  static const TYPE_SPEND = 0;
  int type = -1;
  @override
  Widget build(BuildContext context) {
    type = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: NewTransactionPageWidget(this.type),
    );
  }
}

class NewTransactionPageWidget extends StatefulWidget {
  int type = -1;

  NewTransactionPageWidget(this.type);

  _NewTransactionPageWidgetState createState() =>
      _NewTransactionPageWidgetState();
}

class _NewTransactionPageWidgetState extends State<NewTransactionPageWidget> {
  bool _isCardVisible = false;
  CategoryViewModel _categoryModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    API.getCategories().then((value){
      _categoryModel = Provider.of<CategoryViewModel>(context);
      _categoryModel.setCategories(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Flex(
          direction: Axis.vertical,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            //top
            NewTransactionTopWidget(widget.type),
            //numpad
            Expanded(
              child: NumpadWidget(),
            ),

            //bottom btn
            Container(
              height: 100,
              margin: EdgeInsets.only(bottom: 48, left: 32, right: 32),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      onPressed: () {
                        _onButtonAction();
                      },
                      color: ColorPattle.RED,
                      child: Text(
                        '选择分类',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        Visibility(
          visible: _isCardVisible,
          child: GestureDetector(
            onTap: _toggleCardVisibility,
            child: Container(
              color: Color(0x3C000000),
            ),
          ),
        ),
        // 分类卡片
        Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: Visibility(
              visible: _isCardVisible,
              child: NewCategoryCardWidget(),
            ))
      ],
    );
  }

  void _onButtonAction() {
    _toggleCardVisibility();
  }

  void _toggleCardVisibility() {
    setState(() {
      _isCardVisible = !_isCardVisible;
    });
  }
}
