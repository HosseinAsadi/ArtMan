import 'package:flutter/material.dart';
import 'package:art_man/components/appbar.dart';
import 'package:art_man/components/text-field-enter.dart';
import 'package:art_man/components/button.dart';

class Analyze1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return A();
  }

}

class A extends State<Analyze1>{
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
            child: CustomTextField("تاریخ تولد", Colors.green, TextInputType.datetime, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 60, right: 60),
            child: CustomTextField("گروه خونی", Colors.green, TextInputType.text, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 60, right: 60),
            child: CustomTextField("وزن(کیلوگرم)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 60, right: 60),
            child: CustomTextField("قد(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 60, right: 60),
            child: CustomTextField("دورگردن(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 60, right: 60),
            child: CustomTextField("دور بازو رها(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 60, right: 60),
            child: CustomTextField("دور بازو گرفته(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 60, right: 60),
            child: CustomTextField("دور ساعد(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          CustomButton("ادامه آنالیز", _formKey, '/analyze2'),

        ],
      ),
    )
  );


}