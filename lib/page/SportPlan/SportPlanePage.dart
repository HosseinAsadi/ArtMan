
import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Buttons/RequestButton.dart';
import 'package:flutter/material.dart';

class SportPlanPage extends StatefulWidget {
  String myprogrampageroute;
  String button1Text;
  String button2Text,SportRoute,myplansrout;


  SportPlanPage(this.button1Text, this.button2Text,this.SportRoute,this.myplansrout);

  @override
  _SportPlanPageState createState() => _SportPlanPageState(button1Text,button2Text,SportRoute,myplansrout);
}

class _SportPlanPageState extends State<SportPlanPage> {
  String button1Text,myplansrout;
  String button2Text,route;

  _SportPlanPageState(this.button1Text, this.button2Text,this.route,this.myplansrout);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),

          child:Container(
            margin: EdgeInsets.only(right: 10,left: 10),
            child:  Column(
              children: <Widget>[
                Button([],myplansrout,button1Text,35.0,80.0,startcolor: Color(0xFF088B00),endcolor:Color(0xFF088B00) ,marginbottom: 10.0,),
                RequestButton(Icons.add,button2Text,"قابلیت سفارشی سازی طبق آنالیز",Colors.green,route),

              ],
            ),
          ),

        ),

      ),
    );
  }
}
