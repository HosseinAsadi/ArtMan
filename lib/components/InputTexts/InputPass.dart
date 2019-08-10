import 'package:art_man/components/Keys.dart';
import 'package:flutter/material.dart';

class InputPass extends StatefulWidget {
  String _hint,id;

  InputPass(this._hint,this.id);

  @override
  myInputPass createState() {
    return myInputPass(_hint,id);
  }
}

class myInputPass extends State<InputPass> {
  String _hint,id;

  myInputPass(this._hint,this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 7, bottom: 7),
      padding: EdgeInsets.only(right: 15),
      height: 40.0,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextFormField(
        obscureText: true,
        onSaved: (value) {
          Kelid.setter(id, value);
          print(Kelid.getter(id)) ;

        },
        validator: (String value) {
          if (value.isEmpty) {
            return "";
          }
          return null;
        },
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr,
        decoration: InputDecoration.collapsed(
            hintText: _hint,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 13)),
      ),
    );
  }
}
