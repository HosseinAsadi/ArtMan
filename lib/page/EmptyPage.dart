import 'package:flutter/material.dart';
class EmptyPage extends StatelessWidget {
  final String text;
  EmptyPage({Key key, @required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Scrollbar(child: Container(
          padding: EdgeInsets.only(top: 40,right: 20,left: 20,bottom: 10),
          alignment: Alignment.topRight,
          color: Colors.white,
          child: Text(text,textAlign:TextAlign.center,style: TextStyle(color: Colors.black),),
        ),)
      ),
    );
  }
}
