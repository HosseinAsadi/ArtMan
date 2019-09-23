import 'package:art_man/components/Animation/RightSlidePage.dart';
import 'package:art_man/components/Animation/ScaleRoutePage.dart';
import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Networking/SendFoodPlan.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Toast/WhatUser.dart';
import 'package:art_man/components/Utility/Classroom.dart';

import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:art_man/components/Lists/MakeList.dart';
import 'package:art_man/components/Widgets/OneDropdown.dart';
import 'package:art_man/page/lists/PaternList.dart';
import 'package:flutter/material.dart';

import 'PlanePageTeacher.dart';

class PlanSport extends StatefulWidget {
  String typeplan;

  PlanSport({Key key, @required this.typeplan}) : super(key: key);

  @override
  _PlanSportState createState() => _PlanSportState(typeplan);
}

class _PlanSportState extends State<PlanSport> {
  String typeplan;

  _PlanSportState(this.typeplan);

  List<String> weeks = new List();


  gotoPatternscallback(){
    Kelid.setter("select", "ok");
    Navigator.push(context, MaterialPageRoute(builder: (contex)=>Patternlist(planType: typeplan,)));
  }

  @override
  void initState() {
    for (int i = 0; i < 31; i++) weeks.add("${i + 1}");
    super.initState();
  }

  gettoken() async {
    String token = await gettoken();
    print(token);
  }

  Future<Null> onWillPop() {
    Navigator.push(context, SlideRightRoute(
        page: PlaneSportTeacher()));

    print("back pressed runned");
  }

  void savefinalPlan() {
  if(typeplan=="غذایی"){
    Plan plan = new Plan();
    plan.des = Kelid.getter("food_plan_des");
    plan.days = days;
    plan.name = Kelid.getter("classname");
    plan.Meals = plans[plans.length - 1].Meals;
    plans[plans.length - 1] = plan;

    showDialog(
        context: context,
        builder: (_) => new AlertDialog(
          contentPadding: EdgeInsets.all(0.0),
          content: WhatUser("غذایی",Kelid.getter("typesendplan")),
        ));
  }

  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xFF7FC81D),
            title: Text(
              typeplan == "ورزشی" ? "برنامه ورزشی" : "برنامه غذایی",
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
                          typeplan == "ورزشی"
                              ? OneDropDown("week_program", weeks,
                                  "برنامه چند هفته اجرا شود؟")
                              : OneDropDown(
                                  "fordays",
                                  weeks,
                                  "برنامه چند روز اجرا شود؟",
                                  value: Kelid.getter("fordays") == ""
                                      ? null
                                      : Kelid.getter("fordays"),
                                  fontsize: 19,
                                ),
                          MakeList(typeplan),
                        typeplan=="ورزشی" ? Button(
                            //send programm
                            ["o"],
                          PlanSport(),
                            "ذخیره موقت",
                            30.0,
                            80.0,
                            startcolor: Color(0xFF6CBF02),
                            endcolor: Color(0xFF139101),
                            width: 110.0,
                            functioncode: "tempsave",

                          ):Container(width: 0,height: 0,),
                          new Button(
                            ["o"],
                            PlanSport(),
                            "ارسال برنامه",
                            30.0,
                            10.0,
                            startcolor: Color(0xFF6CBF02),
                            endcolor: Color(0xFF139101),
                            width: 110.0,
                            functioncode: typeplan == "ورزشی"
                                ? "sendSportplan"
                                : "sendFoodPlan",
                            callback: this.savefinalPlan,
                          ),
                          new Button(
                            ["o"],
                            PlanSport(),
                            "انتخاب از الگوی ذخیره شده",
                            30.0,
                            40.0,
                            startcolor: Color(0xFF6CBF02),
                            endcolor: Color(0xFF139101),
                            width: 200.0,
                            functioncode: "selectPattern",
                            callback: this.gotoPatternscallback,
                          ),
                          Button(
                            ["o"],
                            PlanSport(),
                            "ذخیره به عنوان الگو",
                            30.0,
                            10.0,
                            startcolor: Color(0xFF6CBF02),
                            endcolor: Color(0xFF139101),
                            width: 200.0,
                            functioncode: typeplan=="غذایی"?"savefoodAsPattern":"saveAsPattern",
                            callback: this.savefinalPlan,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
