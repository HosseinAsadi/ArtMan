import 'package:flutter/material.dart';

class InputPass extends StatefulWidget {
  String _hint;
  InputPass(this._hint);

  @override
  myInputPass createState() {

    return myInputPass(_hint);
  }
}
class myInputPass extends State<InputPass> {
  String _hint;

  myInputPass(this._hint);

  @override
  Widget build(BuildContext context) {
    return Container(

      alignment: Alignment.centerRight,

      margin: EdgeInsets.only(top: 7, bottom: 7),
      padding: EdgeInsets.only(right: 15),
      height: 40.0,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),

      child: TextField(
        obscureText: true,
        textAlign: TextAlign.center,


        decoration: InputDecoration.collapsed(
            hintText: _hint,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 13
            )
        ),
      ),
    );
  }
}