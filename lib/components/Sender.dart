import 'Keys.dart';
import 'package:flutter/cupertino.dart';

class Sender{
  send(List<String> FormContent){
    List<TextEditingController> keys=new List();
    for(int i=0;i<FormContent.length;i++){
      keys.add(Keys.getter(FormContent[i]));
    }
    
  }
}