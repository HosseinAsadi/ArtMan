import 'package:flutter/material.dart';

class ProfileButtone extends StatefulWidget{
  String _text, _navigatorPush;
  IconData _icon;
  Color _color;

  ProfileButtone(this._text, this._icon, this._color, this._navigatorPush);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PBe(this._text, this._icon, this._color, this._navigatorPush);
  }

}

class PBe extends State<ProfileButtone>{
  String _text, _navigatorPush;
  IconData _icon;
  Color _color;

  PBe(this._text, this._icon, this._color, this._navigatorPush);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 10, ),
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: <Widget>[
            Icon(_icon),
            Container(
              alignment: Alignment(0, 0),
              width: 200,
              child: Text(_text,
                style: TextStyle(color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
      onTap: (){
        setState(() {
          Navigator.pushNamed(context, this._navigatorPush);
        });
      },
      onTapDown: (Details){

      },
    );
  }

}