import 'Keys.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class Sender{

  send(List<String> Form_Content){
    List<TextEditingController> keys=new List();
    for(int i=0;i<Form_Content.length;i++){
      keys.add(Keys.getter(Form_Content[i]));
    }
    
  }
}


