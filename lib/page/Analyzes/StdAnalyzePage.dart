
import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/DropDown.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Location.dart';
import 'package:art_man/components/Networking/FetchData.dart';

import 'package:flutter/material.dart';

class StdAnalyzePage extends StatefulWidget {
  @override
  _StdAnalyzePageState createState() => _StdAnalyzePageState();
}

class _StdAnalyzePageState extends State<StdAnalyzePage> {

  InputText descriprion=new InputText("","descriprionState",height: 150,radius: 10,);
  var _keyForm=GlobalKey<FormState>();
  Button sendImage = new Button(

    '/',
    "ارسال تصویر",
    30.0,
    40.0,
    startcolor: Color(0xFF7FC81D),
    endcolor: Color(0xFF7FC81D),
    width: 90.0,
    marginbottom: 40.0,
  );
  DropDown jens = new DropDown("sex",["زن","مرد"],"جنسیت خود را وارد نمایید.");


  @override
  Widget build(BuildContext context) {
    return Container(

        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "تاریخ شروع عضویت :",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w600),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        container("۲۵", 40.0,10.0),
                        container("مرداد", 40.0,10.0),
                        container("۱۳۹۸", 40.0,10.0),
                      ],
                    ),
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              text("عکس های وضعیت آناتومیکی:", FontWeight.w600
                                  , 17.0, Colors.green)
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              Image.asset(
                                "assets/images/anatomic.png",
                                height: 150,
                                width: 140,
                              ),
                              sendImage
                            ],
                          ),
                        ],
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        text("جنسیت :", FontWeight.w500, 17.0, Colors.white),
                        text("(اجباری)", FontWeight.w100, 12.0, Colors.red),
                      ],
                    ),
                    Form(
                      key: _keyForm,
                      autovalidate: true,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: <Widget>[
                          jens,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              text("تشریح هدف و اندام ایده آل:", FontWeight.w100,
                                  17.0, Colors.white),
                            ],
                          ),
                          descriprion,

                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),

    );
  }

  text(text, fontwidth, fontsize, color) => Text(
        text,
        overflow: TextOverflow.ellipsis,
        style:
            TextStyle(color: color, fontWeight: fontwidth, fontSize: fontsize),
      );

  container(text, height,mrgtop) => Container(
        alignment: Alignment(0, 0),
        margin: EdgeInsets.only(top: mrgtop, bottom: 10),
        padding: EdgeInsets.only(left: 10, right: 10),
        height: height,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          text,
          style: TextStyle(
              fontWeight: FontWeight.w700, color: Colors.green, fontSize: 21),
        ),
      );
}
