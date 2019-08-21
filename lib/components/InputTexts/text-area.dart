
import 'package:flutter/material.dart';

class TextArea extends StatelessWidget{
  TextEditingController _controller = new TextEditingController();

  String _hint;
  double _height;

  TextArea(this._hint, this._height);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        height: _height,
        alignment: Alignment.topRight,
        padding: EdgeInsets.only(right: 5),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: TextField(
          textDirection: TextDirection.rtl,
          controller: _controller,
          textAlign: TextAlign.right,
          maxLines: 6,
          decoration: InputDecoration(
            hintText: _hint,
            hintStyle: TextStyle(fontSize: 12),
          ),
        )
    );
  }


}
