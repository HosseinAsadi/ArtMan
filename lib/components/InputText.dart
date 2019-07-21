import 'package:flutter/material.dart';
import 'Keys.dart';

class InputText extends StatefulWidget {
  String _hint, id;
  double height;
  TextEditingController ctrl;
  Color brdercolor;
  double brderwidth;
  double radius;
  double margintop;
  Alignment alignment;

  InputText(this._hint, this.id,
      {this.height,
      this.brdercolor,
      this.brderwidth,
      this.margintop,
      this.radius,
      this.alignment});

  @override
  myInputText createState() {
    myInputText it = new myInputText(_hint,
        height: height,
        brdercolor: brdercolor,
        brderwidth: brderwidth,
        margintop: margintop,
        radius: radius);
    ctrl = it.getcontoroler();
    Keys.setter(id, ctrl);
    return it;
  }
}

class myInputText extends State<InputText> {
  String _hint;
  double height;
  Color brdercolor;
  double brderwidth;
  double radius;
  double margintop;
  Alignment alignment;

  myInputText(this._hint,
      {this.height,
      this.brdercolor,
      this.brderwidth,
      this.margintop,
      this.radius,
      this.alignment});

  var ctrl = new TextEditingController();

  getcontoroler() => ctrl;

  @override
  Widget build(BuildContext context) {

    if (height == null) height = 50.0;
    if (brdercolor == null) brdercolor = Colors.white;
    if (brderwidth == null) brderwidth = 0.0;
    return Container(
      alignment: alignment == null ? Alignment.centerRight : Alignment.topRight,
      margin: EdgeInsets.only(
        top: margintop == null ? 7.0 : margintop,
      ),
      padding: EdgeInsets.only(right: 15),
      height: height,
      decoration: BoxDecoration(
          border: Border.all(color: brdercolor, width: brderwidth),
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius == null ? 25 : radius)),
      child: TextFormField(
        maxLines: 5,
        keyboardType: TextInputType.multiline,
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
