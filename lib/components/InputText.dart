import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  String _hint;
  TextEditingController ctrl;

  getcontoroler() => ctrl;


  InputText(String hint){
    this._hint = hint;
  }


  @override
  myInputText createState() {
    myInputText it = new myInputText(_hint);
    ctrl = it.getcontoroler();
    return it;
  }
}

class myInputText extends State<InputText> {
  String _hint;

  myInputText(this._hint);

  TextEditingController ctrl = new TextEditingController();

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
        controller: ctrl,
        validator: (String value) {
          if (value.isEmpty) {
            return "";
          }
          return null;
        },
        decoration: InputDecoration(
            hintText: _hint,
            errorStyle: TextStyle(height: 0),
            border: InputBorder.none,
            hintStyle: TextStyle(color: Colors.grey, fontSize: 13)),
      ),
    );
  }

  getcontoroler() => ctrl;
}
