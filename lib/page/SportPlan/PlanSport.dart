
import 'package:art_man/components/Buttons/Button.dart';

import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/Keys.dart';
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

  List<String> weeks = new List();


  Button save = new Button( //send programm
    [],
    "/",
    "ذخیره موقت",
    30.0,
    80.0,
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
    ["saveAsPattern"],
    "/",
    "ذخیره به عنوان الگو",
    30.0,
    10.0,
    startcolor: Color(0xFF6CBF02),
    endcolor: Color(0xFF139101),
    width: 200.0,
    functioncode: "saveAsPattern",
  );

  @override
  void initState() {
    for (int i = 0; i < 31; i++)
      weeks.add("${i + 1}");
    super.initState();
  }

  Future<Null> onWillPop() {
    Navigator.pushNamed(context, "/PlaneSportTeacher");

    print("back pressed runned");
  }
 void savefinalPlan(){
    print("callback called in food plan");
    print(plans.length);

    print("callback called in food plan");
    Plan plan=new Plan();
    plan.des=Kelid.getter("food_plan_des");
    plan.days=days;
    plan.name= Kelid.getter("classname");


    plans[plans.length-1]=plan;
    print(plans[0].Meals.length);
    print("lenth of meal in plan sport page"+plans[0].Meals.length.toString());
 }
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
      onWillPop: onWillPop,
      child:
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
              typeplan=="ورزشی" ?DropDown("week_program", weeks,
                  "برنامه چند هفته اجرا شود؟")
                  :DropDown("fordays", weeks, "برنامه چند روز اجرا شود؟"),
          MakeList(typeplan),
          save,
          new Button(
            ["week_program"],
            "/",
            "ارسال برنامه",
            30.0,
            10.0,
            startcolor: Color(0xFF6CBF02),
            endcolor: Color(0xFF139101),
            width: 110.0,
            functioncode: typeplan == "ورزشی" ? "sendplan" : "sendFoodPlan",
            callback: this.savefinalPlan,
          ),
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
    ));
  }
}
