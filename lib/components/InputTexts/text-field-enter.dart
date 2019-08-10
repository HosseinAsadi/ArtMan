import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget{
  String _hint;
  TextInputType _textInputType;
  TextEditingController _controller;
  TextAlign textAlign;
  Color _hintColor;


  CustomTextField(this._hint, this._hintColor, this._textInputType, {this.textAlign});

  @override
  State<StatefulWidget> createState() {
    TF tf = TF(this._hint, this._hintColor, this._textInputType, textAlign: this.textAlign);
    _controller = tf.getController();
    return tf;
  }

  getController() => _controller.text;

}

class TF extends State<CustomTextField>{
  String _hint;
  TextInputType _tit;
  TextAlign textAlign;
  TextEditingController _controller = new TextEditingController();
  Color _hintColor;

  TF(this._hint, this._hintColor, this._tit, {this.textAlign});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return getTextFields(_hint);
  }

  Widget getTextFields(String hint) => Container(
      height: 50,
      alignment: Alignment(0, 0),
      margin: EdgeInsets.only(left: 20, right: 20),
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),

      child: TextFormField(
        textDirection: TextDirection.rtl,
        keyboardType: this._tit,
        controller: _controller,
        textAlign: textAlign==null ? TextAlign.right: textAlign,
        validator: (String value){
          if(value.isEmpty) {
            return '';
          }
        },
        decoration: InputDecoration.collapsed(
          hintText: hint,
          hintStyle: TextStyle(color: this._hintColor, fontWeight: FontWeight.bold)
        ),
      )
  );

  getController() => _controller;

}