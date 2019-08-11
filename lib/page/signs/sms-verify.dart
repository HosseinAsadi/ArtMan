import 'dart:convert';

import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Buttons/virtualButton.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Networking/SendData.dart';
import 'package:art_man/components/Texts/Strings.dart';
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

  Widget ct = new Text(
    "کد‌تایید‌ثبت‌نام:",
    style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
  );
  String inputcode;
  var _formKey = GlobalKey<FormState>();
  static String verifycode;

  InputText _ctf = new InputText("کد تاییدیه را وارد نمایید..", "sms");
  Button send = new Button(
    "/verifypage",
    "تایید",
    40.0,
    10.0,
    width: 120.0,
  );

  sender() {
    setState(() {
      verifycode = RandromGenerator.Generate().toString();
    });
    Sender.apiRequest(
        "${Strings.baseurl}/admin/sendSMS",
        json.encode({
          "code": verifycode,
          "phone": Kelid.getter("phone"),
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
    send.setkey(_formKey);

    return Scaffold(
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
          GestureDetector(
            onTap: (){
              _formKey.currentState.save();
              setState(() {
                inputcode=Kelid.getter("sms");
                print(inputcode);
                print(verifycode);
              });
            },

            child: inputcode==verifycode?send:
            VirtualBotton("تایید",40.0,10.0,width: 120.0,),
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
