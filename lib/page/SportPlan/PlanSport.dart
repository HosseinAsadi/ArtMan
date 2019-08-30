import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:art_man/components/Lists/MakeList.dart';
import 'package:flutter/material.dart';

class PlanSport extends StatefulWidget {
  @override
  _PlanSportState createState() => _PlanSportState();
}

class _PlanSportState extends State<PlanSport> {
 static List<String> weeks=new List();
  DropDown dropDown = new DropDown("week program",weeks,"برنامه چند هفته اجرا شود؟");
  Button save = new Button(
    [],
    "/",
    "ذخیره موقت",
    30.0,
    80.0,
    startcolor: Color(0xFF6CBF02),
    endcolor: Color(0xFF139101),
    width: 110.0,
  );
  Button sendplan = new Button(
    [],
    "/",
    "ارسال برنامه",
    30.0,
    10.0,
    startcolor: Color(0xFF6CBF02),
    endcolor: Color(0xFF139101),
    width: 110.0,
  );
  Button selectpattern = new Button(
    [],
    "/",
    "انتخاب از الگوی ذخیره شده",
    30.0,
    40.0,
    startcolor: Color(0xFF6CBF02),
    endcolor: Color(0xFF139101),
    width: 200.0,
  );
  Button pattern = new Button(
    [],
    "/",
    "ذخیره به عنوان الگو",
    30.0,
    10.0,
    startcolor: Color(0xFF6CBF02),
    endcolor: Color(0xFF139101),
    width: 200.0,
  );
@override
  void initState() {
    for(int i=0;i<31;i++)
      weeks.add("${i+1}");
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
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
          title: Text(
            "برنامه ورزشی",
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

                      child: Column(
                        children: <Widget>[
                          dropDown,
                          MakeList(),
                          save,
                          sendplan,
                          selectpattern,
                          pattern
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
}
