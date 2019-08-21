import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
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
    maxlenght: 40,

  );
  InputText after = new InputText(
    "",
    "extractafter",
    height: 30.0,

    maxlenght: 12,
  );
  InputText befor = new InputText(
    "",
    "extractbefor",
    height: 30.0,
    maxlenght: 12,

  );
  InputText init = new InputText(
    "",
    "extractin",
    maxlenght: 12,

    height: 30.0,
  );
  InputText day = new InputText(
    "چند روز در هفته تمرین می کنید...",
    "extractday",
    height: 40.0,

  );
  InputText time = new InputText(
    "چند جلسه در روز تمرین می کنید ... ",
    "extracttime",
    height: 40.0,

  );
  InputText hours = new InputText(
    "چه ساعاتی در روز تمرین می کنید ...",
    "extracthours",
    height: 40.0,

  );
  InputText fielddes = new InputText(
    "توضیحات خود را وارد نمایید...",
    "fieldstddes",
    maxlines: 8,
    height: 160.0,
    maxlenght: 1200,
    radius: 10,
  );
  Button saveanalyze = new Button(
    [],
    "/SaveAnalyze3",
    "ذخیره آنالیز",
    40.0,
    30.0,
    startcolor: Color(0xFF5AE400),
    endcolor: Color(0xFF0F8F00),
    width: 100.0,
  );
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
        child:Center(
          child: ListView(
          shrinkWrap: false,
          children: <Widget>[
            Center(
              child: Container(

                margin: EdgeInsets.only(left: 25, right: 25, top: 30),

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
                    SizedBox(height: 5,),
                    fielddes,
                    SizedBox(height: 5,),

                    Extracurricular("تمرینات خارج از فصل مسابقه ",after),
                    SizedBox(height: 5,),

                    Extracurricular("تمرینات پیش از فصل مسابقه ",befor),
                    SizedBox(height: 5,),

                    Extracurricular("تمرینات فصل مسابقه             ",init),
                    SizedBox(height: 10,),

                    day,
                    SizedBox(height: 5,),

                    time,
                    SizedBox(height: 5,),

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
