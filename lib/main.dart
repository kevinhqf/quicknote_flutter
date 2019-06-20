import 'package:flutter/material.dart';
import 'package:quicknote/widget/home/HomePageWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickNote',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        
        body: HomePageWidget(),
      ),
    );
  }
}


