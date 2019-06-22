import 'package:flutter/material.dart';
import 'package:quicknote/widget/home/HomePageWidget.dart';
import 'package:quicknote/widget/login/LoginPageWidget.dart';
import 'package:quicknote/widget/profile/ProfilePageWidget.dart';
import 'package:quicknote/widget/transaction/detail/DetailTransactionPageWidget.dart';
import 'package:quicknote/widget/transaction/new/NewTransactionPageWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickNote',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        
        body: DetailTransactionPageWidget(),
      ),
    );
  }
}



