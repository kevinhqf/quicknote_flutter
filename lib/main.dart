import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quicknote/model/TransactionViewModel.dart';
import 'package:quicknote/widget/home/HomePage.dart';
import 'package:quicknote/widget/login/LoginPage.dart';
import 'package:quicknote/widget/profile/ProfilePage.dart';
import 'package:quicknote/widget/transaction/new/NewTransactionPage.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  var transactionModel =  TransactionViewModel();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<TransactionViewModel>.value(
        value:transactionModel,
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickNote',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      initialRoute: '/profile',
      routes: {
        '/home': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/newTransaction': (context) => NewTransactionPage(),
        '/profile':(context) => ProfilePage(),
      },
      home: ProfilePage(),
    );
  }
}
