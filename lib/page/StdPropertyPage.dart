import 'package:flutter/material.dart';
import 'package:art_man/components/Strings.dart';
import 'package:art_man/components/Button.dart';

class StdPropertyBody extends StatefulWidget {
  @override
  MyStdproperty createState() {
    return MyStdproperty();
  }
}

class MyStdproperty extends State<StdPropertyBody> {
  Button bottom = new Button([""],'/signinpage', "صفحه ورود/ثبت نام", 40.0, 10.0,
      startcolor: Color(0xFF5AE400), endcolor: Color(0xFF0F8F00), width: 130.0);

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
                        Strings.titlestdprop,
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
                child: Text(
                  Strings.studentProperty,
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 11),
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
