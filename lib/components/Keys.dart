
import 'package:flutter/cupertino.dart';

class Keys{
 static Map<String,TextEditingController> keys = new Map();
 static setter(key,value){
    keys[key]=value;
  }
 static getter(String id){
   return keys[id];
 }
}