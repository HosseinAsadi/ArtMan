
import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Buttons/ImageSaver.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Widgets/BackgroandwithListview.dart';
import 'package:flutter/material.dart';

import 'AnalyzeTools.dart';


class StdAnalyzePage6 extends StatefulWidget {
  @override
  _StdAnalyzePage6State createState() => _StdAnalyzePage6State();
}

class _StdAnalyzePage6State extends State<StdAnalyzePage6> {
  InputText checkupdes = new InputText(
    "توضیحات خود را وارد نمایید...",
    "checkupdes",
    height: 200.0,
    margintop: 0.0,
    radius: 8,
    maxlines: 9,

  );

  Button continuebtn = new Button(
    ["ارسال تصویر"],
    SaveAnalyzee(),
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

      body:Background(Center(
        child: Container(
          margin:
          EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(15))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text("چکاپ کامل بدن\n(تست هورمون،آنزیم،غلظت خون)",
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.green, fontSize: 17,fontWeight: FontWeight.w700
                        ),),
                      ImageSender("ارسال تصویر"),
                      Text("در صورتی که مربی تشخیص دهد شاگرد نیاز به آزمایشات دارد باید از او بخواهد تا آزمایشات و آنالیز کامل بدن را انجام دهد و جواب آزمایش را برای او در قسمت های بالا آپلود کند",
                        style: TextStyle(color: Colors.grey,fontSize: 11,fontWeight: FontWeight.w200),)
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10,left: 10),
                  child: checkupdes,
                ),
                continuebtn

              ],
            ),
          ),
        ),
      ))
    );
  }
}
