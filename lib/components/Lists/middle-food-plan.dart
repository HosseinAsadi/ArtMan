import 'package:art_man/components/Texts/Strings.dart';
import 'package:flutter/material.dart';
import 'package:art_man/components/custom-loading.dart';

class MiddleFoodPlan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(left: 30, right: 30),
      margin:EdgeInsets.only(top: 25),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text('توضیحات برنامه', style: TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),),
              Icon(Icons.arrow_forward_ios, color: Colors.lightGreen,)
            ],
          ), 
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(Strings.EXPLAINMIDDLEFOODPLAN, style: TextStyle(color: Colors.white, fontSize: 10), textAlign: TextAlign.right,),
          ),
          Customloading(30)
        ],
      ),
    );
  }

}