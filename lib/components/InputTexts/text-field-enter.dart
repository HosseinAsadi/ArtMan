import 'package:art_man/components/Buttons/HelpButton.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  String _hint;
  String id;
  TextInputType _textInputType;
  TextEditingController _controller;
  TextAlign textAlign;
  Color _hintColor;

  CustomTextField(this.id,this._hint, this._hintColor, this._textInputType,
      {this.textAlign});

  @override
  State<StatefulWidget> createState() {
    TF tf = TF(id,this._hint, this._hintColor, this._textInputType,
        textAlign: this.textAlign);

    return tf;
  }

  getController() => _controller.text;
}

class TF extends State<CustomTextField> {
  String _hint;
  String id;
  bool showhint=true;
  TextInputType _tit;
  TextAlign textAlign;
  TextEditingController _controller = new TextEditingController();
  Color _hintColor;
  bool showhelp = false,idexist=false;

  TF(this.id,this._hint, this._hintColor, this._tit, {this.textAlign});


  @override
  Widget build(BuildContext context) {
    return getTextFields(_hint);
  }

  Widget getTextFields(String hint) => Stack(
        children: <Widget>[
         id=="age" || id=="bloodGroup"? Container(width: 0,height: 0,):HelpButton(id),
          Container(
              height: 50,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 30),
              padding: EdgeInsets.only(left: 15, right: 15),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: TextField(
                inputFormatters: [
                  new LengthLimitingTextInputFormatter(6),
                ],
                onChanged: (value) {
                  setState(() {
                    showhint=false;
                    hint="";
                    showhelp=true;
                    textAlign=TextAlign.left;

                  });
                  Kelid.setter(id, value);
                },
                textAlign:textAlign==null? TextAlign.center:textAlign,
                maxLines: 1,
                style: TextStyle(
                  fontSize: 14,
                ),
                textDirection: TextDirection.rtl,
                keyboardType: this._tit,
                controller: _controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.all(0.0),
                    errorStyle: TextStyle(height: 0),
                    hintText: showhint?hint:"",
                    hintStyle: TextStyle(
                        decorationThickness: 5,
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                        height: -10)),
              )),
         showhelp? Positioned(

            right: 30,
            child: Container(
              padding: EdgeInsets.all(3),
              alignment: Alignment.center,
              height: 50,
              width: 140,

              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.only(topRight: Radius.circular(25),bottomRight: Radius.circular(25))
              ),
              child: Text(hint,textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 12),),
            ),
          ):Container(width: 0,height: 0,)
        ],
      );


}


