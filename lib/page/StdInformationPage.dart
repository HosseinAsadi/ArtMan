import 'package:art_man/components/Button.dart';
import 'package:art_man/components/InputText.dart';
import 'package:flutter/material.dart';

class StdInformationPage extends StatefulWidget {
  @override
  _StdInformationPageState createState() => _StdInformationPageState();
}

class _StdInformationPageState extends State<StdInformationPage> {
  InputText field = new InputText(
    "رشته خود را وارد نمایید...",
    "fieldstd",
    height: 45.0,

  );
  InputText after = new InputText(
    "",
    "extractafter",
    height: 30.0,
  );
  InputText befor = new InputText(
    "",
    "extractbefor",
    height: 30.0,
  );
  InputText init = new InputText(
    "",
    "extractin",
    height: 30.0,
  );
  InputText day = new InputText(
    "",
    "extractday",
    height: 40.0,

  );
  InputText time = new InputText(
    "",
    "extracttime",
    height: 40.0,

  );
  InputText hours = new InputText(
    "",
    "extracthours",
    height: 40.0,

  );
  InputText fielddes = new InputText(
    "توضیحات خود را وارد نمایید...",
    "fieldstddes",
    maxlines: 7,
    height: 160.0,
    radius: 10,
  );
  Button saveanalyze = new Button(
    [""],
    "/PlanePage",
    "ذخیره آنالیز",
    40.0,
    30.0,
    startcolor: Color(0xFF5AE400),
    endcolor: Color(0xFF0F8F00),
    width: 100.0,
  );
  @override
  Widget build(BuildContext context) {
    var _key = GlobalKey<FormState>();
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child:Center(
          child: ListView(
          shrinkWrap: false,
          children: <Widget>[
            Center(
              child: Container(

                margin: EdgeInsets.only(left: 25, right: 25, top: 30),
                //color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "رشته خود را وارد نمایید:",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    field,
                    fielddes,

                    Extracurricular("تمرینات خارج از فصل مسابقه ",after),
                    Extracurricular("تمرینات پیش از فصل مسابقه ",befor),
                    Extracurricular("تمرینات فصل مسابقه             ",init),
                    day,
                    time,
                    hours,
                    saveanalyze
                  ],
                ),

              ),
            ),
          ],
        ),
        ),

      ),
    );
  }

  Extracurricular(text, textfield) => Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 2),
            width: 15,
            height: 15,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Expanded(
            flex: 1,
            child: textfield,
          )

        ],
      );
}
