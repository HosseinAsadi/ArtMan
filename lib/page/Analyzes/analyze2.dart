import 'package:art_man/components/Buttons/costumbutton.dart';
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
    return Scaffold(
      appBar: PreferredSize(child: CustomAppbar('آنالیز هنرجو', Icons.search), preferredSize: Size.fromHeight(55)),
      drawer: Drawer(),
      body: setBackground(),
    );
  }

  Widget setBackground() => Container(
    alignment: Alignment(1, 0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/background.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: body(),
  );

  Widget body() => Container(
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 15, left: 60, right: 60, top: 40),
              child: CustomTextField("دورمچ(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, left: 60, right: 60),
              child: CustomTextField("دور قفسه سینه(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, left: 60, right: 60),
              child: CustomTextField("دور کمر(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, left: 60, right: 60),
              child: CustomTextField("لگن(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, left: 60, right: 60),
              child: CustomTextField("دور ران(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, left: 60, right: 60),
              child: CustomTextField("ساق پا(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
            ),

            Container(
              margin: EdgeInsets.only(bottom: 15, left: 60, right: 60),
              child: CustomTextField("پهنای متغییر شانه(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
            ),

            CustomButton("ادامه آنالیز", _formKey, '/analyze5'),

          ],
        ),
      )
  );


}