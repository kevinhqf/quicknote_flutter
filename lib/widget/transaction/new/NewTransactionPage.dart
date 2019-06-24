import 'package:flutter/material.dart';
import 'package:quicknote/api/API.dart';
import 'package:quicknote/data/ColorPattle.dart';
import 'package:quicknote/model/CategoryViewModel.dart';
import 'package:quicknote/widget/transaction/new/NewCategoryCardWidget.dart';
import 'package:quicknote/widget/transaction/new/NewTransactionTopWidget.dart';
import 'package:quicknote/widget/transaction/new/NumpadWidget.dart';
import 'package:provider/provider.dart';
class NewTransactionPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NewTransactionPageWidget(),
    );
  }
}

class NewTransactionPageWidget extends StatefulWidget {
 

  NewTransactionPageWidget();

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
            NewTransactionTopWidget(),
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
