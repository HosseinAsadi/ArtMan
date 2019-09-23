import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/page/signs/SingInPage.dart';
import 'package:flutter/material.dart';

class StdPropertyBody extends StatefulWidget {
  @override
  MyStdproperty createState() {
    return MyStdproperty();
  }
}

class MyStdproperty extends State<StdPropertyBody> {
  Button bottom = new Button([],MyCustomForm(), "صفحه ورود/ثبت نام", 40.0, 10.0,
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
                        strings.titlestdprop,
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
                  strings.studentProperty,
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
