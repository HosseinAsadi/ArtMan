import 'package:flutter/material.dart';

class InputText extends StatefulWidget {
  String _hint;
  InputText(this._hint);
  @override
  myInputText createState() {
    return myInputText(_hint);
  }
}
class myInputText extends State<InputText> {
  String _hint;
  myInputText(this._hint);

  @override
  Widget build(BuildContext context) {

    return Container(

      alignment: Alignment.centerRight,

      margin: EdgeInsets.only(top:7,bottom: 7 ),
      padding: EdgeInsets.only(right: 15),
      height: 40.0,
      decoration: BoxDecoration(
          color:  Colors.white,
          borderRadius: BorderRadius.circular(20)
      ),

      child:TextField(

        decoration: InputDecoration.collapsed(

            hintText: _hint,
            hintStyle: TextStyle(
                color: Colors.grey,
                fontSize: 13
            )
        ),
      ) ,
    );
  }
}