import 'package:flutter/material.dart';

class CustomAppbar extends StatefulWidget{
  String _title;

  CustomAppbar(this._title);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CA(this._title);
  }

}

class CA extends State<CustomAppbar>{
  String _title;

  CA(this._title);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title: Text(this._title),
      leading: null, // location, in drawer location
      actions: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10),
          child: Icon(Icons.search),
        )
      ],
      backgroundColor:Colors.lightGreen,
    );
  }

}