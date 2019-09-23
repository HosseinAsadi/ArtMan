import 'package:art_man/page/Analyzes/SummaryAnswer.dart';
import 'package:flutter/material.dart';

import 'AnalyzeAwnser.dart';

class Branch extends StatefulWidget {
  String index;
  String username;
  String date;

  Branch({Key key, this.index, this.date,this.username}) : super(key: key);

  @override
  _BranchState createState() => _BranchState(index, date,username);
}

class _BranchState extends State<Branch> {
  String index;
  String username;

  int weight, hr, tee;
  double bmi, whr, bai, bf;
  String date;
  bool complete = false;

  _BranchState(this.index, this.date,this.username);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:Center(
            child: Container(
          alignment: Alignment.center,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
                child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 30),
              child:

                 Column(
                    mainAxisAlignment: MainAxisAlignment.center,

                    children: <Widget>[
                      Button(
                          "خلاصه آنالیز",
                          MaterialPageRoute(
                              builder: (context) => AnalyzeAnswer(
                                    index: index,
                                username: username,
                                  ))),
                      Button(
                          "جواب آنالیز",
                          MaterialPageRoute(
                              builder: (context) => AnalyzeResult(
                                    index: index,
                                    date: date,
                                username: username,
                                  ))),
                    ],
                  ),


                ),  ))));
  }

  Button(text, rout) => Card(
    child: InkWell(
      onTap: () {
        Navigator.push(context, rout);
      },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(5),
          height: 60,
          width: 130,


            child: Text(
              text,
              style: TextStyle(
                  color: Colors.black45,
                  fontSize: 17,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
}
