import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/RadioButtons/RadioButton.dart';
import 'package:flutter/material.dart';

class StdAnalyzePage4 extends StatefulWidget {
  @override
  _StdAnalyzePage4State createState() => _StdAnalyzePage4State();
}

class _StdAnalyzePage4State extends State<StdAnalyzePage4> {
  CustomRadio _alerzy = new CustomRadio([
    "حساسیت دارم.",
    "حساسیت ندارم.",
  ]);
  CustomRadio _digestion = new CustomRadio([
    "دستگاه گوارش",
    "هضم غذا",
    "رفلکس معده",
    "بالا بودن اسید معده",
  ]);
  CustomRadio _abnormaly = new CustomRadio(
    ["آسیب های جسمانی عضله", "استخوان", "تاندون", "هیچکدام"],
  );
  InputText alrzydes = new InputText(
    "توضیحات خود را وارد نمایید...",
    "alrzydes",
  );
  InputText _digestiondes = new InputText(
    "توضیحات خود را وارد نمایید...",
    "digestiondes",
    height: 130.0,
    margintop: 0.0,
    radius: 10,
  );
  InputText _abnormalydes = new InputText(
    "توضیحات خود را وارد نمایید...",
    "abnormalydes",
    margintop: 0.0,
    radius: 10,
    height: 130.0,
    maxlines: 5,
  );
  Button continuebtn = new Button(
    [""],
    "/",
    "ادامه آنالیز",
    40.0,
    30.0,
    startcolor: Color(0xFF5AE400),
    endcolor: Color(0xFF0F8F00),
    width: 100.0,
  );

  @override
  Widget build(BuildContext context) {
   var _key=GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF7FC81D),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        title: Text("آنالیز هنرجو"),
      ),
      drawer: Drawer(
        child: Text("dff"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          shrinkWrap: false,
          children: <Widget>[
            Center(
              child: Container(
                margin:
                    EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                child: Form(
                  key: _key,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      stack(
                          Container(
                            height: 60,
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              " حساسیت به ماده غذایی ، دارویی یا ویتامین ها:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                          ),
                          100.0,
                          30.0),
                      Container(
                        height: 50,
                        child: _alerzy,
                      ),
                      alrzydes,
                      stack(
                          Container(
                            margin: EdgeInsets.only(top: 60),
                            child: Text(
                              "مشکل در سیستم گوارش ، هضم غذا ، رفلکس \nبالا بودن اسید معده :",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16,
                                  color: Colors.white),
                            ),
                          ),
                          90.0,
                          80.0),
                      Container(
                        alignment: Alignment(0, 0),
                        height: 50,
                        child: _digestion,
                      ),
                      _digestiondes,
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "ناهنجاری فیزیکی :",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            ),
                            Text(
                              "(اجباری)",
                              style: TextStyle(color: Colors.red),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: 50,
                        child: _abnormaly,
                      ),
                      _abnormalydes,
                      continuebtn
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  stack(container, left, top) => Stack(
        children: <Widget>[
          container,
          Positioned(
            top: top,
            left: left,
            child: Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                "(اجباری)",
                style: TextStyle(color: Colors.red),
              ),
            ),
          )
        ],
      );
}
