import 'package:flutter/material.dart';
import 'package:art_man/components/text.dart';
import 'package:art_man/components/text-field-enter.dart';
import 'package:art_man/components/button.dart';

class SMSVerify extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SMSV();
  }
}

class SMSV extends State<SMSVerify> {
  CustomText ct = new CustomText("کد‌تایید‌ثبت‌نام:");
  var _formKey = GlobalKey<FormState>();

  CustomTextField _ctf =
      new CustomTextField("کد تاییدیه را وارد نمایید..", Colors.grey, TextInputType.text);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: setBackground(),
    );
  }

  Widget setBackground() => Container(
        alignment: Alignment(1, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: body(),
      );

  Widget body() =>Form(key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[ct, _ctf, getRow(), CustomButton("ارسال و تایید", _formKey, '/monthly-payment')],
      )
  );

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
                        decoration: TextDecoration.underline)
                ),
              onTap: () {},
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
