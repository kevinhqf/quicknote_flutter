import 'package:flutter/material.dart';
import 'package:quicknote/widget/profile/CategoryListWidget.dart';
import 'package:quicknote/widget/profile/ProfileTopWidget.dart';

class ProfilePageWidget extends StatefulWidget {
  ProfilePageWidget({Key key}) : super(key: key);

  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        //top 
        ProfileTopWidget(),
        // category list
        Expanded(
          child: CategoryListWidget(),
        )
        
      ],
    );
  }
}