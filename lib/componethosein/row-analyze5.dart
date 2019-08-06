import 'package:flutter/material.dart';

class RowAnalyze5 extends StatefulWidget {
  String _title;
  bool _isSelected = false;

  TextEditingController _controller;

  RowAnalyze5(this._title);

  TextEditingController get controller => _controller;

  @override
  State<StatefulWidget> createState() {
    RA ra = new RA(this._isSelected, this._title);
    this._controller = ra._controller;
    return ra;
  }
}

class RA extends State<RowAnalyze5> {
  bool _isSelected = false;
  String _title;

  TextEditingController _controller = new TextEditingController();
  String text = ""; // empty string to carry what was there before it
  int maxLength = 15;

  RA(this._isSelected, this._title);

  TextEditingController get controller => _controller;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 150,
            height: 30,
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            margin: EdgeInsets.only(left: 8,bottom: 5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Text(
              this._title,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 11,
                  fontWeight: FontWeight.bold),
            ),
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.done,
                size: 30,
                color: this._isSelected ? Colors.green : Colors.grey,
              ),
            ),
            onTap: () {
              setState(() {
                this._isSelected = true;
              });
            },
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 8),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.close,
                size: 30,
                color: !this._isSelected ? Colors.red : Colors.grey,
              ),
            ),
            onTap: () {
              setState(() {
                this._isSelected = false;
              });
            },
          ),
          Container(
              height: 35,
              width: 100,
              alignment: Alignment(0, 0),
              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: TextField(
                textDirection: TextDirection.rtl,
                controller: _controller,
                onChanged: onChange,
                textAlign: TextAlign.right,
                decoration: InputDecoration(
                  hintText: 'توضیحات ...',
                  hintStyle: TextStyle(fontSize: 12),
                ),
              )
          ),
        ],
      ),
    );
  }

  onChange(String newVal) {
    if (newVal.length <= maxLength) {
      text = newVal;
    } else {
      _controller.value = new TextEditingValue(
          text: text,
          selection: new TextSelection(
              baseOffset: maxLength,
              extentOffset: maxLength,
              affinity: TextAffinity.downstream,
              isDirectional: false),
          composing: new TextRange(start: 0, end: maxLength));
      _controller.text = text;
    }
  }
}
