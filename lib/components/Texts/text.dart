import 'package:flutter/material.dart';

class CustomText extends StatelessWidget{
  String _text;

  CustomText(this._text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      alignment: Alignment(1, 0),
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.all(16),
      child: Text(
        _text,
        textDirection: TextDirection.rtl,
        style: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.white, fontSize: 18),
      ),
    );;
  }

}