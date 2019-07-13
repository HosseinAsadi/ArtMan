import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget{
  String _text, _navigatorPush;
  CustomButton(this._text, this._navigatorPush);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CB(this._text, this._navigatorPush);
  }

}

class CB extends State<CustomButton>{
  String _text, _navigatorPush;

  CB(this._text, this._navigatorPush);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return button(this._text, this._navigatorPush);
  }

  Widget button(String text, String navigatorPush) => GestureDetector(
    child: Container(
        margin: EdgeInsets.only(
            left:  MediaQuery.of(context).size.width - 305,
            right:  MediaQuery.of(context).size.width - 305,
          top: 25
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
                fontSize: 22))),
    onTap: () {
//      if(_formKey.currentState.validate())
      Navigator.pushNamed(context, navigatorPush);
    },
  );


}