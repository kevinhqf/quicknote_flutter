
import 'package:flutter/material.dart';

class LoadingDialog{

  static void show(BuildContext context){
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => Center(
        child:CircularProgressIndicator() ,
      ) 
    );
  }

  


}