import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputPass.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/SharedPreference.dart';
import 'package:flutter/material.dart';


class MyCustomForm extends StatefulWidget {
  @override
  SingInPage createState() {
    return SingInPage();
  }
}

class SingInPage extends State<MyCustomForm> {
  static ShPre typeuser=new ShPre();
  final _formkey = GlobalKey<FormState>();

  InputText username = new InputText("نام کاربری خود را وارد نمایید ...","username");
  InputPass password = new InputPass("password");
  Button signinbtn = new Button(["username","password"],typeuser.getValuesSF()=="teacher"?'/TeacherProfilePage':"/Profile", "ورود", 40.0, 20.0,
      marginleft: 5.0,
      startcolor: Color(0xFF5AE400),
      endcolor: Color(0xFF0F8F00));
  Button signupbtn = new Button(["username","password"],typeuser.getValuesSF()=="teacher"?'/Register':"/signuppage", "ثبت نام", 40.0, 20.0,
      marginright: 5.0,
      startcolor: Colors.grey[700],
      endcolor: Colors.grey[700]);

  @override
  Widget build(BuildContext context) {
   // signupbtn.setkey(_formkey);
    signinbtn.setkey(_formkey);
   // signupbtn.setinputs([username.ctrl.text, password.ctrl.text]);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
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
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontSize: 10,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Column(
                          children: <Widget>[
                            Text("اصلاح شماره همراه",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    fontSize: 10,
                                    color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(flex: 1, child: signinbtn),
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
