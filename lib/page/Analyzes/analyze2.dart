import 'package:art_man/components/Buttons/Button.dart';
import 'package:flutter/material.dart';
import 'package:art_man/components/InputTexts/text-field-enter.dart';
import 'package:art_man/componethosein/appbar.dart';

class Analyze2 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return A();
  }

}

class A extends State<Analyze2>{
  var _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return body();

  }



  Widget body() => Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 10),
              child: CustomTextField("دورمچ(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
              child: CustomTextField("دور قفسه سینه(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
              child: CustomTextField("دور کمر(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
              child: CustomTextField("لگن(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
              child: CustomTextField("دور ران(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
              child: CustomTextField("ساق پا(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
              child: CustomTextField("پهنای متغیر شانه(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center,),
            ),

         //   Button([""],"/analyze5","ادامه آنالیز", 40.0, 10.0,),

          ],
        ),
      )
  );


}