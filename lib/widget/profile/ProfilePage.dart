import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicknote/api/API.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:quicknote/model/UserViewModel.dart';
import 'package:quicknote/utils/SPUtil.dart';
import 'package:quicknote/widget/profile/CategoryListWidget.dart';
import 'package:quicknote/widget/profile/ProfileTopWidget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfilePageWidget(),
    );
  }
}

class ProfilePageWidget extends StatefulWidget {
  ProfilePageWidget({Key key}) : super(key: key);

  _ProfilePageWidgetState createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  TransactionViewModel _model;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SPUtil().getInt(UserViewModel.KEY_USER_ID).then((userId) {
      API.getCategoryGroups(userId ?? -1).then((value) {
        _model = Provider.of<TransactionViewModel>(context);
        _model?.setCategoryGroups(value);
      });
    });
  }

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
