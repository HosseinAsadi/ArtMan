import 'package:flutter/material.dart';

import 'Keys.dart';

class InputText extends StatefulWidget {
  String _hint,id;
  TextEditingController ctrl;

  InputText(this._hint,this.id);

  @override
  myInputText createState() {
    myInputText it = new myInputText(_hint);
    ctrl = it.getcontoroler();
    Keys.setter(id, ctrl);
    return it;
  }
}

class myInputText extends State<InputText> {
  String _hint;

  myInputText(this._hint);

  var ctrl = new TextEditingController();
  getcontoroler() => ctrl;

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


}
