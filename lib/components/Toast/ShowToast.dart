import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
ShowToast(msg,backColor,textColor){
  print("show toast0");
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIos: 1,
      backgroundColor: backColor,
      textColor: textColor,
      fontSize: 16.0
  );
}