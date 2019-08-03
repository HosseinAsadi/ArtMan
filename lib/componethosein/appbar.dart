import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget{
  String _title;
  IconData _icon;

  CustomAppbar(this._title, this._icon);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CA(this._title, this._icon);
  }

}

class CA extends State<CustomAppbar>{
  String _title;
  IconData _icon;

  CA(this._title, this._icon);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title: Text(this._title),
      leading: null, // location, in drawer location

      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Icon(_icon),
        )
      ],
      backgroundColor:Colors.lightGreen,
    );
  }

}