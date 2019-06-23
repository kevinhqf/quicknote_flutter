import 'package:flutter/material.dart';
import 'package:quicknote/api/API.dart';
import 'package:quicknote/data/CategoryGroup.dart';
import 'package:quicknote/widget/profile/CategoryListWidget.dart';
import 'package:quicknote/widget/profile/ProfileTopWidget.dart';

class ProfilePageWidget extends StatefulWidget {
  ProfilePageWidget({Key key}) : super(key: key);

  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  
  CategoryListWidget _listWidget = CategoryListWidget();
  ProfileTopWidget _topWidget = ProfileTopWidget();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    API.getCategoryGroups(4).then((value) {
      _listWidget.setData(value);
    });
    API.getAllTransactions(4).then((value){
      _topWidget.setData(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //top
        _topWidget,
        // category list
        Expanded(
          child: _listWidget,
        )
      ],
    );
  }
}
