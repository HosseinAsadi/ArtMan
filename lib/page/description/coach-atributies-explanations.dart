
import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:flutter/material.dart';

class CoachExplan extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyStdproperty();
  }
}

class MyStdproperty extends State<CoachExplan> {
  Button bottom = new Button([],'/signinpage', "صفحه ورود/ثبت نام", 40.0, 10.0,
      startcolor: Color(0xFF5AE400), endcolor: Color(0xFF0F8F00), width: 150.0);
  Strings strings=new Strings();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Flexible(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(bottom: 1),
                  child: Column(
                    children: <Widget>[
                      Text(
                        strings.TITLECOACHEXPLAN,
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Center(
                        child: Container(
                          height: 2.5,
                          width: 250.0,
                          color: Color(0xFF0F8F00),
                        ),
                      )
                    ],
                  ),
                )),
            Flexible(
              flex: 7,
              child: Container(
                margin: EdgeInsets.only(left: 10, right: 10),
                child:  Text(
                  strings.COACHATRIBEXPLAN,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                      height: 1.5
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Flexible(flex: 2, child: bottom),
          ],
        ),
      ),
    );
  }
}
