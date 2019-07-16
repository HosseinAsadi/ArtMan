import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget{
  String _text;
  CustomButton(this._text);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CB(this._text);
  }

}

class CB extends State<CustomButton>{
  String _text;

  CB(this._text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return button(this._text);
  }

  Widget button(String text) => Container(
        margin: EdgeInsets.only(
            left:  MediaQuery.of(context).size.width - 305,
            right:  MediaQuery.of(context).size.width - 305,
            top: 30
        ),
        padding: EdgeInsets.only(top: 8, bottom: 8),
        alignment: Alignment(0, 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [new Color(0xFF0F8F00), new Color(0xFF5AB403)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(25),

        ),
        child: Text(text,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22))
  );


}