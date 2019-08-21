import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/text-field-enter.dart';
import 'package:flutter/material.dart';


class Analyze1 extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return A();
  }

}
class A extends State<Analyze1>{
  List<String> members=[
    "age",
    "bloodGroup",
    "weight",
    "tall",
    "aroundNeck",
    "aroundArmFree",
    "aroundArmClose",
    "aroundSaed"
  ];
  @override
  Widget build(BuildContext context) {

    return Scaffold(  body: body(),
    );
  }



  Widget body() => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/background.png"),
        fit: BoxFit.cover,
      ),
    ),
    child:ListView(
      shrinkWrap: false,
  children: <Widget>[


     Container(
       margin: EdgeInsets.only(top: 30,bottom: 30),

       child: Column(
        children: <Widget>[
          Container(
            child: Text(
              "کلیه ی فیلد ها اجباری است",
              style: TextStyle(color: Colors.red,fontSize: 15,fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20, top: 10),
            child: CustomTextField(members[0],"سن", Colors.green, TextInputType.datetime, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
            child: CustomTextField(members[1],"گروه خونی", Colors.green, TextInputType.text, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
            child: CustomTextField(members[2],"وزن(کیلوگرم)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
            child: CustomTextField(members[3],"قد(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
            child: CustomTextField(members[4],"دورگردن(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15,left: 20, right: 20),
            child: CustomTextField(members[5],"دور بازو رها(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
            child: CustomTextField(members[6],"دور بازو گرفته(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Container(
            margin: EdgeInsets.only(bottom: 15, left: 20, right: 20),
            child: CustomTextField(members[7],"دور ساعد(سانتی متر)", Colors.green, TextInputType.number, textAlign: TextAlign.center),
          ),

          Button(members,"/Analyze2","ادامه آنالیز", 50.0, 10.0,width: 120,),

        ],
      ),
    )
],),);


}