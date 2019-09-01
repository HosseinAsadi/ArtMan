import 'dart:convert';

import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Networking/SendPlanSport.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:art_man/components/Lists/MakeList.dart';
import 'package:flutter/material.dart';

class PlanSport extends StatefulWidget {
  String typeplan;
  PlanSport({Key key, @required this.typeplan}) : super(key: key);

  @override
  _PlanSportState createState() => _PlanSportState(typeplan);
}

class _PlanSportState extends State<PlanSport> {
  String typeplan;
  _PlanSportState(this.typeplan);
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
 sender() async{


Strings strings=new Strings();
String username=await getusername();
  await SendPlanSport(
       "${strings.baseurl}/sportPlan/addSportPlan/uuu/$username",
       json.encode({
         "sessions": 1,
       }));
 }
@override
  void initState() {
    for(int i=0;i<31;i++)
      weeks.add("${i+1}");
    super.initState();
    sender();
   // getjson();
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
            typeplan=="ورزشی"? "برنامه ورزشی":"برنامه غذایی",
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
                         typeplan=="ورزشی" ?dropDown:Container(width: 0,height: 0,),
                          MakeList(typeplan),
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
