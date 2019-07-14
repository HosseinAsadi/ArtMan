import 'package:art_man/components/Button.dart';
import 'package:art_man/components/DropDown.dart';
import 'package:art_man/components/InputText.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  MySingup createState() {
    return MySingup();
  }
}

class MySingup extends State<SignUp> {
   final _formkey = GlobalKey<FormState>();
  InputText name = new InputText("نام و نام خانوادگی خود را وارد نمایید...");
  InputText phone = new InputText("شماره همراه خود را وارد نمایید...");
  DropDown dropCountry =
      new DropDown("کشور محل زندگی خود را انتخاب نمایید ...");
  DropDown dropCity = new DropDown("شهر محل زندگی خود را انتخاب نمایید ...");
  DropDown dropsex = new DropDown(
    "جنسیت خود را انتخاب نمایید ...",
  );
  Button button = new Button("/verifypage", "تایید ثبت نام", 40.0, 20.0,
      marginleft: 5.0,
      width: 140.0,
      startcolor: Color(0xFF5AE400),
      endcolor: Color(0xFF0F8F00),
  );




  @override
  Widget build(BuildContext context) {

    button.setkey(_formkey);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Form(
                    key: _formkey,
                    child: Container(
                      margin: EdgeInsets.only(left: 50, right: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          text("نام و نام خانوادگی :"),
                          name,
                          text("انتخاب کشور :"),
                          dropCountry,
                          text("انتخاب شهر :"),
                          dropCity,
                          text("جنسیت :"),
                          dropsex,
                          text("شماره همراه :"),
                          phone,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[button],
                          )
                        ],
                      ),
                    )),
              ),
            ],
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
