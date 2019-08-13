
import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ExtractSportName extends StatefulWidget {
  @override
  _ExtractSportNameState createState() => _ExtractSportNameState();
}

class _ExtractSportNameState extends State<ExtractSportName> {
  InputText rest = new InputText(
    "",
    "rest",
    height: 30,
  );
  InputText seet = new InputText(
    "",
    "seet",
    height: 30,
  );
  InputText practicSystem = new InputText("", "practicSystem");
  InputText tempo = new InputText("", "tempo");
  InputText RM1 = new InputText("", "RM1");
  InputText desmorabi =
      new InputText("", "desmorabi", maxlines: 4, height: 66, margintop: 0.0);
  InputText repeat = new InputText(
    "تکرار",
    "repeat",
    height: 30,
    textAlign: TextAlign.center,
    hintconlor: Colors.green,
    hintsize: 14,
    margintop: 5.0,
  );
  InputText second = new InputText(
    "ثانیه",
    "second",
    height: 30,
    textAlign: TextAlign.center,
    hintconlor: Colors.green,
    hintsize: 14,
    margintop: 5.0,
  );
  InputText calary = new InputText(
    "کالری",
    "calary",
    height: 30,
    textAlign: TextAlign.center,
    hintconlor: Colors.green,
    hintsize: 14,
    margintop: 5.0,
  );
  InputText metr = new InputText(
    "متر",
    "metr",
    height: 30,
    textAlign: TextAlign.center,
    hintconlor: Colors.green,
    hintsize: 14,
    margintop: 5.0,
  );
  Button ok = new Button(
    [],
    "/SelectSportExtract",
    "تایید تمرین",
    35.0,
    20.0,
    width: 100.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF118C47),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
            )
          ],
          title: Text(
            "نام تمرین ورزشی",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Container(
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
                    margin: EdgeInsets.only(
                        left: 15, right: 15, top: 10, bottom: 10),
                    child: Form(
                      // key: _key,
                      child: Column(
                        children: <Widget>[
                          Text(
                            "نام تمرین ورزشی",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          Text("حداقل باید یک ست داشته باشد.",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500)),
                          SizedBox(
                            height: 50,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              shape(120.0, 70.0, "استراحت", "(اختیاری)", rest,
                                  Colors.green),
                              shape(120.0, 70.0, "ست", "(اختیاری)", rest,
                                  Colors.green),
                            ],
                          ),
                          Container(
                            width: 110,
                            child: Column(
                              children: <Widget>[
                                repeat,
                                second,
                                calary,
                                metr,
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              shape(100.0, 70.0, "سیستم تمرین", "(اختیاری)",
                                  rest, Colors.green,
                                  fontsize: 11.0),
                              shape(100.0, 70.0, "تمپو", "(اختیاری)", rest,
                                  Colors.green),
                              shape(100.0, 70.0, "RM1", "(اختیاری)", rest,
                                  Colors.green),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          shape(300.0, 100.0, "توضیحات ویژه شما مربی عزیز", "",
                              desmorabi, Colors.grey),
                          ok
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }

  shape(width, height, text, text2, widget, textcolor, {fontsize}) => Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        margin: EdgeInsets.all(2),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: <Widget>[
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    text,
                    style: TextStyle(
                        color: textcolor,
                        fontSize: fontsize == null ? 16 : fontsize),
                  ),
                  Text(
                    text2,
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  )
                ],
              ),
            ),
            widget
          ],
        ),
      );
}
