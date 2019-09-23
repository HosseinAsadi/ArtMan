import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/Function.dart';
import 'package:art_man/page/VideoAbout/VideoPlayer.dart';
import 'package:art_man/page/lists/MySelection.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'SportField.dart';

class ExtractSportName extends StatefulWidget {
  String currentmove;
  String currentclass;

  ExtractSportName({Key key, @required this.currentclass, this.currentmove})
      : super(key: key);

  @override
  _ExtractSportNameState createState() =>
      _ExtractSportNameState(currentclass, currentmove);
}

class _ExtractSportNameState extends State<ExtractSportName> {
  String currentmove;
  String currentclass;

  _ExtractSportNameState(this.currentclass, this.currentmove);
   save(){
     saveOptions(currentclass,currentmove);
     return currentclass;
   }



   Future<Null> OnWillPop(){
     Navigator.push(context, MaterialPageRoute(builder: (context)=>
     MySelection(numberclass: currentclass,)));
   }



  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: OnWillPop,child:
      Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF118C47),
          iconTheme: IconThemeData(color: Colors.white),
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
                      child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(
                            left: 15, right: 15, top: 10, bottom: 10),
                        child: Column(
                          children: <Widget>[
                            /*SizedBox(
                  height: 120,
                  child:  VideoPlayerApp(),
                ),*/

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
                                shape(
                                    120.0,
                                    70.0,
                                    "استراحت",
                                    "(اختیاری)",
                                    new InputText("", "rest",
                                        height: 30,
                                        value: classes[int.parse(currentclass)]
                                            .moves[int.parse(currentmove)]
                                            .options
                                            .rest),
                                    Colors.green),
                                GestureDetector(
                                  onTap: (){
                                    Strings strings=new Strings();
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=>
                                    VideoPlayerApp(videoUrl: "${strings.baseurl}/videos/${classes[int.parse(currentclass)].moves[int.parse(currentmove)].videourl}",)));
                                  },
                                child:Container(
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.all(Radius.circular(30)),
                                  ),
                                  child: Icon(Icons.play_arrow,size: 60,color: Colors.greenAccent[100],),
                                ) ),
                                shape(
                                    120.0,
                                    72.0,
                                    "ست",
                                    "(اختیاری)",
                                    new InputText("", "set",
                                        height: 30,
                                        keyboardtype: TextInputType.number,
                                        value: classes[int.parse(currentclass)]
                                            .moves[int.parse(currentmove)]
                                            .options
                                            .set),
                                    Colors.green),
                              ],
                            ),
                            Container(
                              width: 110,
                              child: Column(
                                children: <Widget>[
                                  new InputText(
                                    "تکرار",
                                    "repeat",
                                    height: 30,
                                    textAlign: TextAlign.center,
                                    hintconlor: Colors.green,
                                    hintsize: 14,
                                    margintop: 5.0,
                                    keyboardtype: TextInputType.number,
                                    value: classes[int.parse(currentclass)]
                                        .moves[int.parse(currentmove)]
                                        .options
                                        .repeat,
                                  ),
                                  new InputText(
                                    "ثانیه",
                                    "second",
                                    height: 30,
                                    textAlign: TextAlign.center,
                                    hintconlor: Colors.green,
                                    hintsize: 14,
                                    margintop: 5.0,
                                    keyboardtype: TextInputType.number,
                                    value: classes[int.parse(currentclass)]
                                        .moves[int.parse(currentmove)]
                                        .options
                                        .second,
                                  ),
                                  new InputText("کالری", "calary",
                                      height: 30,
                                      textAlign: TextAlign.center,
                                      hintconlor: Colors.green,
                                      hintsize: 14,
                                      margintop: 5.0,
                                      keyboardtype: TextInputType.number,
                                      value: classes[int.parse(currentclass)]
                                          .moves[int.parse(currentmove)]
                                          .options
                                          .colory),
                                  new InputText("متر", "metr",
                                      height: 30,
                                      textAlign: TextAlign.center,
                                      hintconlor: Colors.green,
                                      hintsize: 14,
                                      margintop: 5.0,
                                      keyboardtype: TextInputType.number,
                                      value: classes[int.parse(currentclass)]
                                          .moves[int.parse(currentmove)]
                                          .options
                                          .meter),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                shape(
                                    108.0,
                                    72.0,
                                    "سیستم تمرین",
                                    "(اختیاری)",
                                    new InputText("", "practicSystem",
                                        value: classes[int.parse(currentclass)]
                                            .moves[int.parse(currentmove)]
                                            .options
                                            .exersiceSystem),
                                    Colors.green,
                                    fontsize: 11.0),
                                shape(
                                    100.0,
                                    72.0,
                                    "تمپو",
                                    "(اختیاری)",
                                    new InputText("", "tempo",
                                        value: classes[int.parse(currentclass)]
                                            .moves[int.parse(currentmove)]
                                            .options
                                            .tempo),
                                    Colors.green),
                                shape(
                                    100.0,
                                    72.0,
                                    "RM1",
                                    "(اختیاری)",
                                    new InputText("", "RM1",
                                        value: classes[int.parse(currentclass)]
                                            .moves[int.parse(currentmove)]
                                            .options
                                            .rm_one),
                                    Colors.green),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            shape(
                                300.0,
                                100.0,
                                "توضیحات ویژه شما مربی عزیز",
                                "",
                                new InputText("", "desmorabi",
                                    maxlines: 4,
                                    height: 66,
                                    margintop: 0.0,
                                    value: classes[int.parse(currentclass)]
                                        .moves[int.parse(currentmove)]
                                        .options
                                        .des),
                                Colors.grey),
                            new Button(
                              ["metr", "calary", "second", "repeat"],
                              SportField(),
                              "تایید تمرین",
                              35.0,
                              20.0,
                              width: 100.0,
                              functioncode: "add_option_to_one_move",
                              callback: this.save,
                            )
                          ],
                        ),
                      )
                    ],
                  )),
                ),
              ],
            ),
          ),
        ) ));
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
