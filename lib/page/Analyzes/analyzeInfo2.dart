import 'package:art_man/components/Buttons/Button.dart';
import 'package:flutter/material.dart';
import 'package:art_man/components/InputTexts/text-field-enter.dart';
import 'package:art_man/componethosein/appbar.dart';

class Analyze2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return A();
  }
}

class A extends State<Analyze2> {
  List<String> members = [
    "aroundWrist",
    "aroundChest",
    "waist",
    "aroundLaver",
    "aroundLeg",
    "leg",
    "widthComb",
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: body(),
    );
  }

  Widget body() => Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: ListView(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 30),
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    "کلیه ی فیلد ها اجباری است",
                    style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w500),
                  ),
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 10),
                  child: CustomTextField(members[0], "دورمچ(سانتی متر)",
                      Colors.green, TextInputType.number,
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
                  child: CustomTextField(members[1], "دور قفسه سینه(سانتی متر)",
                      Colors.green, TextInputType.number,
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
                  child: CustomTextField(members[2], "دور کمر(سانتی متر)",
                      Colors.green, TextInputType.number,
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
                  child: CustomTextField(members[3], "لگن(سانتی متر)",
                      Colors.green, TextInputType.number,
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
                  child: CustomTextField(members[4], "دور ران(سانتی متر)",
                      Colors.green, TextInputType.number,
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
                  child: CustomTextField(members[5], "ساق پا(سانتی متر)",
                      Colors.green, TextInputType.number,
                      textAlign: TextAlign.center),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
                  child: CustomTextField(
                    members[6],
                    "پهنای متغیر شانه(سانتی متر)",
                    Colors.green,
                    TextInputType.number,
                    textAlign: TextAlign.center,
                  ),
                ),
                Button(members, "/Analyze6", "ادامه آنالیز", 45.0, 10.0,
                    width: 120),
              ],
            ),
          )
        ],
      ));
}
