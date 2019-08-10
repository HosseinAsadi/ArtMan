import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/DropDown.dart';
import 'package:art_man/components/InputTexts/MaterialText.dart';
import 'package:art_man/components/InputTexts/SearchBox.dart';
import 'package:flutter/material.dart';

class SelectSportExtract extends StatefulWidget {
  @override
  _SelectSportExtractState createState() => _SelectSportExtractState();
}

class _SelectSportExtractState extends State<SelectSportExtract> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF7FC81D),
        actions: <Widget>[
          Center(
            child: InkWell(
              onTap: null,
              child: Text(
                "تنظیم مجدد         ",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
        title: Text(
          "انتخاب برنامه ورزشی",
          style: TextStyle(color: Colors.white, fontSize: 17),
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
                  margin:
                      EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  child: Form(
                    // key: _key,
                    child: Column(
                      children: <Widget>[
                        SearchBox(),
                        SizedBox(height: 15,),
                        DropDown("muscle group",[],
                          "گروه عضلانی",
                          backgroundColor: Color(0xFFF1C60D),
                          fontcolor: Colors.black,
                          arrowcolor: Colors.black,
                        ),
                        SizedBox(height: 10,),
                        DropDown("sport tools",[],
                          "تجهیزات ورزشی",
                          backgroundColor: Color(0xFFF1C60D),
                          fontcolor: Colors.black,
                          arrowcolor: Colors.black,
                        ),
                        Container(
                          height: 365,
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20))
                          ),
                          child: Column(
                            children: <Widget>[
                              MaterialText(40,"بدنسازی",Colors.white,backgroundColor: Color(0xFF088B00),fontWeight: FontWeight.w500,align: Alignment.centerRight,),
                              MaterialText(40,"کراس فیت",Colors.white,backgroundColor: Color(0xFF088B00),fontWeight: FontWeight.w500,align: Alignment.centerRight,top: 10,),
                              MaterialText(40,"تک مفصلی",Colors.white,backgroundColor: Color(0xFF088B00),fontWeight: FontWeight.w500,align: Alignment.centerRight,top: 10),
                              MaterialText(40,"قسمت تهتانی بدن",Colors.white,backgroundColor: Color(0xFF088B00),fontWeight: FontWeight.w500,align: Alignment.centerRight,top: 10),
                              MaterialText(40,"چهار سر ران",Colors.white,backgroundColor: Color(0xFF088B00),fontWeight: FontWeight.w500,align: Alignment.centerRight,top: 10),
                              MaterialText(40,"مورد دیگر...",Colors.white,backgroundColor: Color(0xFF088B00),fontWeight: FontWeight.w500,align: Alignment.centerRight,top: 10),
                              MaterialText(40,"مورد دیگر...",Colors.white,backgroundColor: Color(0xFF088B00),fontWeight: FontWeight.w500,align: Alignment.centerRight,top: 10),
                            ],
                          ),
                        ),
                        Button([""],"/ExtractSportName","تایید موقت",30.0,10.0,width: 100.0,)
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
