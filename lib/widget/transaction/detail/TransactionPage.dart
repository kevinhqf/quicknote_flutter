import 'package:flutter/material.dart';
import 'package:quicknote/api/API.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:quicknote/model/UserViewModel.dart';
import 'package:quicknote/utils/SPUtil.dart';
import 'package:quicknote/widget/transaction/detail/TimelineWidget.dart';
import 'package:quicknote/widget/transaction/detail/TransactionListWidget.dart';
import 'package:quicknote/widget/transaction/detail/TransactionTopWidget.dart';
import 'package:provider/provider.dart';

class TransactionPage extends StatelessWidget {
  int _categoryId = -1;

  @override
  Widget build(BuildContext context) {
    _categoryId = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      body: TransactionPageWidget(_categoryId),
    );
  }
}

class TransactionPageWidget extends StatefulWidget {
  int categoryId = -1;
  TransactionPageWidget(this.categoryId);

  _TransactionPageWidgetState createState() => _TransactionPageWidgetState();
}

class _TransactionPageWidgetState extends State<TransactionPageWidget> {
  TransactionViewModel _model;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SPUtil().getInt(UserViewModel.KEY_USER_ID).then((userId) {
      API
          .getCategoryTransactions(widget.categoryId, userId ?? -1)
          .then((value) {
        _model = Provider.of<TransactionViewModel>(context);
        _model.setCategoryTransactions(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          // background icon
          Positioned(
            right: 8,
            bottom: 10,
            child: Opacity(
              opacity: 0.37,
              child: _model == null
                  ? null
                  : Image.network(
                      _model.transactionCategoryIcon,
                      width: 200,
                      height: 200,
                    ),
            ),
          ),

          Container(
            alignment: AlignmentDirectional.topStart,
            child: Column(
              children: <Widget>[
                // top
                TransactionTopWidget(),
                //timeline
                TimelineWidget(),
                //list
                Expanded(
                  child: TransactionListWidget(),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
