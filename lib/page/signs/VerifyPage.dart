import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputPass.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'JoinedPage.dart';
import 'JoinedPage2.dart';

class VerifyPage extends StatefulWidget {
  @override
  myVerifyPage createState() {
    return myVerifyPage();
  }
}

class myVerifyPage extends State<VerifyPage> {
  static String type;
  InputPass password = new InputPass("","password");
  InputPass repeat = new InputPass("","password2");
  InputText username = new InputText("نام کاربری خود را وارد نمایید ...","username",textAlign: TextAlign.center,);


  passIsMatch(){
    if(Kelid.getter("password")==Kelid.getter("password2")){
      Navigator.pushNamed(context, type=="teachers"?'/joindepage':"/Membership");
    }
    else{
      ShowToast("پسورد های وارد شده یکی نیستند",Colors.red,Colors.white);
    }
  }
  Future<Null> gettype() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String t = prefs.getString("type");
    print(t);
    setState(() {
      type = t;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettype();
  }
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
        child: Form(

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
                  children: <Widget>[ Button(
                  ["password","password2","username"],
                  type=="teachers"?JoinedPage():Membership(), "تایید و مرحله بعد", 40.0, 20.0,
                  marginleft: 5.0,
                  width: 120.0,
                  startcolor: Color(0xFF5AE400),
                  endcolor: Color(0xFF0F8F00),
                  functioncode: "passrepeat",
                  callback: this.passIsMatch,) ],
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
