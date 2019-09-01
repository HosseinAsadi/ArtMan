import 'package:flutter/material.dart';

class OptionsDialog extends StatefulWidget {
  @override
  _OptionsDialogState createState() => _OptionsDialogState();
}

class _OptionsDialogState extends State<OptionsDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 117,
      child: Column(children: <Widget>[
        GestureDetector(
          child:Card(child: Container(
            height: 50,
            width: 250,
            child: Text("ایجاد سوپرست"),
          ),) ,
        ),
        GestureDetector(
          child: Card(child: Container(
            height: 50,
            width: 250,

            child: Text("حذف از لیست"),
          ),) ,
        ),
      ],),
    );
  }
}
