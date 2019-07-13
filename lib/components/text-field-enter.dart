import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget{
  String _hint;
  TextInputType _textInputType;

  CustomTextField(this._hint, this._textInputType);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return TF(this._hint, this._textInputType);
  }

}

class TF extends State<CustomTextField>{
  String _hint;
  TextInputType _tit;

  TF(this._hint, this._tit);

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
        textAlign: TextAlign.right,
        validator: (String value){
          if(value.isEmpty) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('لطفا همه فیلد ها را پر کنید!')));
            return null;
          }
        },
        decoration: InputDecoration.collapsed(
            hintText: hint,
            fillColor: Colors.grey
        ),
      )

  );


}