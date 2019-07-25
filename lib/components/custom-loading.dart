import 'package:flutter/material.dart';

class Customloading extends StatelessWidget{
  int _percent;

  Customloading(this._percent);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(top: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            height: 4,
            alignment: Alignment.topRight,
            width: (MediaQuery.of(context).size.width),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4)
            ),
            child: Container(
              height: 4,
              width: (((MediaQuery.of(context).size.width) * this._percent) / 100) - 30,
              decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  borderRadius: BorderRadius.circular(4)
              ),
            ),
          ),
          Container(
              alignment: Alignment(-1, 0),
              margin: EdgeInsets.only(top: 5),
              child: Text('70% تا اتمام برنامه', style: TextStyle(color: Colors.white, fontSize: 10), textAlign: TextAlign.end,)
          )
        ],
      ),
    );
  }
}