import 'package:flutter/material.dart';
import 'package:art_man/components/text.dart';

class SMSVerify extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SMSV();
  }

}

class SMSV extends State<SMSVerify>{
  CustomText ct = new CustomText("کد‌تایید‌ثبت‌نام:");

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


  Widget body() =>  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ct,
        getTextFields("کد تاییدیه را وارد نمایید.."),
        getRow(),
        button()
      ],
  );

  Widget getTextFields(String hint) => Container(
      height: 50,
      alignment: Alignment(0, 0),
      margin: EdgeInsets.only(left: 30, right: 30),
      padding: EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),

      child: TextFormField(
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        validator: (String value){
          if(value.isEmpty) {
            Scaffold.of(context).showSnackBar(SnackBar(content: Text('لطفا همه فیلد ها را پر کنید!')));
            return null;
          }
        },
        decoration: InputDecoration.collapsed(
            hintText: hint,
            fillColor: Colors.grey
        ),
      )

  );

  Widget getRow() => Container(
    margin: EdgeInsets.only(left: 30, right: 30, top: 15, bottom: 25),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[

        GestureDetector(
          child: Container(
            child: Text('ارسال مجددکدفعالسازی',
                style: TextStyle(color: Colors.white,
                    fontSize: 13,
                    decoration: TextDecoration.underline
                )
            ),
          ),
          onTap: (){

          },
        ),
        GestureDetector(
          child: Container(
            child: Text('اصلاح شماره همراه',
                style: TextStyle(color: Colors.white,
                    fontSize: 13,
                    decoration: TextDecoration.underline
                )
            ),
          ),
          onTap: (){

          },
        )
      ],
    ),
  );

  Widget button() => GestureDetector(
    child: Container(
        margin: EdgeInsets.only(
            left:  MediaQuery.of(context).size.width - 305,
            right:  MediaQuery.of(context).size.width - 305
        ),
        padding: EdgeInsets.only(top: 8, bottom: 8),
        alignment: Alignment(0, 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [new Color(0xFF0F8F00), new Color(0xFF5AB403)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(25),

        ),
        child: Text(' ارسال و تایید',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 22))),
    onTap: () {
//      if(_formKey.currentState.validate())
      Navigator.pushNamed(context, '/sms-verify');
    },
  );
}