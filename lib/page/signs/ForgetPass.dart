import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:flutter/material.dart';

import 'JoinedPage.dart';

class ForgetPass extends StatefulWidget {
  @override
  myForgetPass createState() {
    return myForgetPass();
  }
}

class myForgetPass extends State<ForgetPass> {

  InputText username = new InputText("نام کاربری خود را وارد نمایید ...","newusername",textAlign: TextAlign.center,);
  InputText phone = new InputText("شماره همراه ...","newphone",textAlign: TextAlign.center,keyboardtype: TextInputType.phone,);


  phoneIsExist()async{

      Navigator.pushNamed(context, '/NewPass');
   /* }
    else{
      ShowToast("کاربری با مشخصات وارد شده وجود ندارد",Colors.red,Colors.white);
    }*/
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

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
                text("شماره همراه :"),
                phone,

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[ Button(
                    ["newphone","newusername"],
                    JoinedPage(), "تایید و مرحله بعد", 40.0, 20.0,
                    marginleft: 5.0,
                    width: 120.0,
                    startcolor: Color(0xFF5AE400),
                    endcolor: Color(0xFF0F8F00),
                    functioncode: "gorget",
                    callback: this.phoneIsExist,) ],
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
