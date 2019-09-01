import 'dart:convert';

import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Buttons/virtualButton.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Networking/SendData.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Toast/ShowSnackbar.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/RandomGenerator.dart';
import 'package:flutter/material.dart';

class SMSVerify extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SMSV();
  }
}

class SMSV extends State<SMSVerify> {
  double width=120.0;
  double height=40.0;
  String inputcode;
  var _formKey = GlobalKey<FormState>();
  var _scaffoldkey = GlobalKey<ScaffoldState>();
  static String verifycode;

  Widget ct = new Text(
    "کد‌تایید‌ثبت‌نام:",
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
  );


  InputText _ctf = new InputText("کد تاییدیه را وارد نمایید..", "sms",keyboardtype: TextInputType.number,maxlenght: 5.0,);



  sender() {
    Strings strings=new Strings();

    setState(() {
      verifycode = RandromGenerator.Generate().toString();
    });
    Post.SendSmS(
        "${strings.baseurl}/admin/sendSMS",
        json.encode({
          "code": verifycode,
          "number": Kelid.getter("phone"),
        }));
  }

  @override
  void initState() {
    super.initState();
    sender();
    print(verifycode);
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      key: _scaffoldkey,
      body: setBackground(),
    );
  }

  Widget setBackground() => Container(
        alignment: Alignment(1, 0),
        padding: EdgeInsets.only(left: 20, right: 20),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: body(),
      );


  Widget body() => Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              ct,
            ],
          ),
          _ctf,
          getRow(),
          Container(
            alignment: Alignment(0, 0),
            width: width,
            height: height,
            margin: EdgeInsets.only(top: 10, ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [Color(0xFF5AE100), Color(0xFF0F8F00)])),
            child: GestureDetector(
              onTapDown: (tapDetails) {
                setState(() {
                  width = width - 2;
                  --height;

                });
              },
              onTapUp: (TapUpDetails) {
                setState(() {
                  width = width + 2;
                  ++height;
                });
              },
              onTap: () {

                  if (Kelid.getter("sms")!=null &&  Kelid.getter("sms")==verifycode) {
                    Navigator.pushNamed(context,"/verifypage" );
                  }

                  else if(Kelid.getter("sms")==null || Kelid.getter("sms")=="")
                    {
                      ShowSnackbar(_scaffoldkey, "لطفا کد تایید را وارد کنید");
                    }
                  else
                    {
                      ShowSnackbar(_scaffoldkey, "کد وارد شده نادرست است");
                    }

              },
              child: Text(
                "تایید",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,
                    fontWeight: FontWeight.normal ,
                    fontSize: 16),
              ),
            ),
          )
        ],
      ));


  Widget getRow() => Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Text('ارسال مجددکدفعالسازی',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      decoration: TextDecoration.underline)),
              onTap: () {
                sender();
              },
            ),
            GestureDetector(
              child: Text('اصلاح شماره همراه',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      decoration: TextDecoration.underline)),
              onTap: () {},
            )
          ],
        ),
      );
}
