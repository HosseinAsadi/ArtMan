import 'package:art_man/components/InputTexts/text-field-enter.dart';
import 'package:flutter/material.dart';


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

    return   Container(
      child: body(),
    );
  }




  Widget body() => Container(
    child: Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 10),
            child: CustomTextField("تاریخ تولد", Colors.green, TextInputType.datetime, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
            child: CustomTextField("گروه خونی", Colors.green, TextInputType.text, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
            child: CustomTextField("وزن(کیلوگرم)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
            child: CustomTextField("قد(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
            child: CustomTextField("دورگردن(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15,left: 20, right: 20),
            child: CustomTextField("دور بازو رها(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
            child: CustomTextField("دور بازو گرفته(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
            child: CustomTextField("دور ساعد(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

        /*  Button([""],"/analyze2","ادامه آنالیز", 40.0, 10.0,),*/

        ],
      ),
    )
  );


}