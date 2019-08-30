
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


  ShowSnackbar(key,content){
    key.currentState.showSnackBar(new SnackBar(backgroundColor:Colors.red,content: new Text(content)));
  }

