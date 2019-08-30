import 'package:art_man/components/Utility/Keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPass extends StatefulWidget {
  String _hint, id;

  InputPass(this._hint, this.id);

  @override
  myInputPass createState() {
    return myInputPass(_hint, id);
  }
}

class myInputPass extends State<InputPass> {
  String _hint, id;

  myInputPass(this._hint, this.id);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      margin: EdgeInsets.only(top: 7, bottom: 7),
      padding: EdgeInsets.only(right: 15),
      height: 40.0,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: TextField(
        textInputAction: TextInputAction.next,
        keyboardType: TextInputType.number,
        inputFormatters: [
          new LengthLimitingTextInputFormatter(30),
        ],
        onChanged: (value) {
          Kelid.setter(id, value);
          print(Kelid.getter(id));
        },
        textAlign: TextAlign.center,
        maxLines: 1,
        style: TextStyle(
          fontSize: 14,
        ),
        textDirection: TextDirection.ltr,
        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(0.0),
            hintText: _hint,
            errorStyle: TextStyle(height: 0),
            hintStyle: TextStyle(color: Colors.grey, fontSize: 13)),
        obscureText: true,
      ),
    );
  }
}
