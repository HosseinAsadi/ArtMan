import 'package:flutter/material.dart';
import 'package:art_man/components/InputText.dart';
import 'package:art_man/components/Bottom.dart';

class MyCustomForm extends StatefulWidget {
  @override
  SingInPage createState() {
    return SingInPage();
  }
}

class SingInPage extends State<MyCustomForm> {
  final _formkey = GlobalKey<FormState>();
  InputText username = new InputText( "نام کاربری خود را وارد نمایید ...");
  InputText password = new InputText("رمز عبور خود را وارد نمایید ...");
  Bottom signinbtn = new Bottom('/second',"ورود", 40.0, 20.0,marginleft: 5.0,
      startcolor: Color(0xFF5AE400), endcolor: Color(0xFF0F8F00));
  Bottom signupbtn = new Bottom('/signuppage',"ثبت نام", 40.0, 20.0,marginright: 5.0,
      startcolor: Colors.grey[700],endcolor: Colors.grey[700]);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body:
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child:
          Form(
              key: _formkey,
              child: Container(
                margin: EdgeInsets.only(left: 50, right: 50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    text("نام کاربری :"),
                    username,
                    text("رمز عبور :"),
                    password,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        GestureDetector(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "فراموشی رمز عبور",
                                style: TextStyle(decoration: TextDecoration.underline,
                                    fontSize: 10, color: Colors.white),
                              ),

                            ],
                          ),
                        ),
                        GestureDetector(
                          child: Column(
                            children: <Widget>[
                              Text("اصلاح شماره همراه",
                                  style: TextStyle(decoration: TextDecoration.underline,
                                      fontSize: 10, color: Colors.white)),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          flex: 1,
                          child: signinbtn
                        ),
                        Flexible(
                          flex: 1,
                          child: signupbtn,
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),

    );
  }

  Widget text(text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
    );
  }
}
