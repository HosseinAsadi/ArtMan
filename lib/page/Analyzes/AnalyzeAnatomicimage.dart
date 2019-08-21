import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Buttons/ImageSaver.dart';
import 'package:art_man/components/DropDown.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:flutter/material.dart';

class StdAnalyzePage extends StatefulWidget {
  @override
  _StdAnalyzePageState createState() => _StdAnalyzePageState();
}

class _StdAnalyzePageState extends State<StdAnalyzePage> {
  InputText descriprion=new InputText("توضیحات .... ","desGoal",height: 150.0,maxlines: 7,radius: 10.0,);

  DropDown jens = new DropDown("sex",["زن","مرد"],"جنسیت خود را وارد نمایید.");
  Button countinue = new Button(
    ["عکس از پهلو","عکس از پشت","عکس از جلو","sex"],
    "/Analyze1",
    "ادامه آنالیز",
    40.0,
    10.0,
    startcolor: Color(0xFF5AE400),
    endcolor: Color(0xFF0F8F00),
    width: 100.0,
    marginbottom: 4.0,
  );

  @override
  Widget build(BuildContext context) {
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
                margin: EdgeInsets.only(left: 20, right: 20, top: 30),
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
                                width: 200,
                              ),
                              Column(
                                children: <Widget>[
                                  ImageSender("عکس از پهلو"),
                                  ImageSender("عکس از پشت"),
                                  ImageSender("عکس از جلو"),
                                ],
                              )

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
                          countinue,
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),
          ],
        ),
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