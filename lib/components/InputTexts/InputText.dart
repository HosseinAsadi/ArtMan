import 'package:art_man/components/Keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class InputText extends StatefulWidget {
  String _hint, id;
  double height;
  TextEditingController ctrl;
  Color brdercolor;
  double brderwidth;
  double radius;
  double margintop;
  TextAlign textAlign;
  int maxlines;
  Color hintconlor;
  double hintsize;

  InputText(this._hint, this.id,
      {this.height,
      this.brdercolor,
      this.brderwidth,
      this.margintop,
      this.radius,
      this.textAlign,
      this.maxlines,
      this.hintconlor,
      this.hintsize});

  @override
  myInputText createState() {
    myInputText it = new myInputText(id,_hint,
        height: height,
        brdercolor: brdercolor,
        brderwidth: brderwidth,
        margintop: margintop,
        radius: radius,
        maxlines: maxlines,
        hintconlor: hintconlor,
        alignment: textAlign,
        hintsize: hintsize);
    return it;
  }
}

class myInputText extends State<InputText> {
  String _hint;
  String id;
  double height;
  Color brdercolor;
  double brderwidth;
  double radius;
  double margintop;
  TextAlign alignment;
  int maxlines;
  Color hintconlor;
  double hintsize;

  myInputText(this.id,this._hint,
      {this.height,
      this.brdercolor,
      this.brderwidth,
      this.margintop,
      this.radius,
      this.alignment,
      this.maxlines,
      this.hintsize,
      this.hintconlor});

  var ctrl = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Container(

     alignment: Alignment.center,
      margin: EdgeInsets.only(
        top: margintop == null ? 1.0 : margintop,
      ),
      padding: EdgeInsets.only(right: 3),
      height: height == null ? 40.0 : height,
      decoration: BoxDecoration(
          border: Border.all(
              color: brdercolor == null ? Colors.white : brdercolor,
              width: brderwidth == null ? 0.0 : brderwidth),
          color: Colors.white,
          borderRadius: BorderRadius.circular(radius == null ? 25 : radius)),
      child: TextFormField(
        inputFormatters: [
          new LengthLimitingTextInputFormatter(30),
        ],

        onSaved: (value) {
          Kelid.setter(id, value);
         print(Kelid.getter(id)) ;

        },
        textAlign: alignment == null ? TextAlign.right : alignment,
        maxLines: maxlines==null?1:maxlines,
        style: TextStyle(
          fontSize: 14,

        ),
        textDirection: TextDirection.rtl,
        controller: ctrl,

        validator: (String value) {
          if (value.isEmpty) {
            return "";
          }
          return null;
        },

        decoration: InputDecoration(
            border: InputBorder.none,
            contentPadding: const EdgeInsets.all(0.0),
            hintText: _hint,
            errorStyle: TextStyle(height: 0),
            hintStyle: TextStyle(

                color: hintconlor == null ? Colors.grey : hintconlor,
                fontSize: hintsize == null ? 13 : hintsize)),
      ),
    );
  }
}
