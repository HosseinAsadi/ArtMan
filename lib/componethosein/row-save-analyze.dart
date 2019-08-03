import 'package:flutter/material.dart';

class RowSaveAnalyze extends StatefulWidget {
  String _title, _title1;
  bool _isSelected = false;

  RowSaveAnalyze(this._title, this._title1);

  @override
  State<StatefulWidget> createState() {
    return RSA(this._isSelected, this._title, this._title1);
  }
}

class RSA extends State<RowSaveAnalyze> {
  bool _isSelected = false;
  String _title, _title1;

  RSA(this._isSelected, this._title, this._title1);


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(bottom: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 140,
            height: 30,
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            margin: EdgeInsets.only(left: 8, right: 5),
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

          Container(
            width: 140,
            height: 30,
            padding: EdgeInsets.only(left: 10, right: 10, top: 5, bottom: 5),
            margin: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Text(
              this._title1,
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
        ],
      ),
    );
  }
}
