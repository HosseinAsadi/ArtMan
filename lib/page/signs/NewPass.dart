import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputPass.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'JoinedPage2.dart';

class NewPass extends StatefulWidget {
  @override
  myNewPass createState() {
    return myNewPass();
  }
}

class myNewPass extends State<NewPass> {
  static String type;
  InputPass password = new InputPass("","newpassword2");
  InputPass repeat = new InputPass("","repeatnewpassword2");


  passIsMatch(){
    if(Kelid.getter("newpassword2")==Kelid.getter("newpassword2")){
      Navigator.pushNamed(context,"/signinpage");
    }
    else{
      ShowToast("پسورد های وارد شده یکی نیستند",Colors.red,Colors.white);
    }
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

                text("رمز عبور جدید:"),
                password,
                text("تکرار رمز عبور :"),
                repeat,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ Button(
                    ["newpassword2","repeatnewpassword2"],
                    Membership(), "تایید و مرحله بعد", 40.0, 20.0,
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
