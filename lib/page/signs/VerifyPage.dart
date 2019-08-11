import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputPass.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/UserInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class VerifyPage extends StatefulWidget {
  @override
  myVerifyPage createState() {
    return myVerifyPage();
  }
}

class myVerifyPage extends State<VerifyPage> {
  static String type=UserInfo.type;
  final _formkey = GlobalKey<FormState>();
  InputPass password = new InputPass("","password");
  InputPass repeat = new InputPass("","password");
  InputText username = new InputText("نام کاربری خود را وارد نمایید ...","username");
  Button bottom = new Button(

  type=="teacher"?'/joindepage':"/Membership", "تایید و مرحله بعد", 40.0, 20.0,
      marginleft: 5.0,
      width: 120.0,
      startcolor: Color(0xFF5AE400),
      endcolor: Color(0xFF0F8F00));

  @override
  Widget build(BuildContext context) {
    bottom.setkey(_formkey);
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
                text("تکرار رمز عبور :"),
                repeat,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[bottom],
                ),
              ],
            ),
          ),
        ),
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
