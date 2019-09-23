import 'dart:convert';

import 'package:art_man/components/Animation/RightSlidePage.dart';
import 'package:art_man/components/Animation/ScaleRoutePage.dart';
import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Lists/MakeMealsList.dart';
import 'package:art_man/components/RadioButtons/RadioDay.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/Keys.dart';

import 'package:art_man/page/SportPlan/PlanSport.dart';
import 'package:flutter/material.dart';

class MealsPage extends StatefulWidget {
  String numberplan;
  MealsPage({Key key, @required this.numberplan}) : super(key: key);

  @override
  _MealsPageState createState() => _MealsPageState(numberplan);
}

class _MealsPageState extends State<MealsPage> {
  String numberplan;
  _MealsPageState(this.numberplan);
List<RadioModel> radiodays=new List();


callbackSaveEdits(){
  setState(() {
    Kelid.setter("save", "");
    if ( days.length!=0 ) {
        plans[int.parse(numberplan)].des=Kelid.getter("food_plan_des");
        plans[int.parse(numberplan)].days=days;
        Kelid.setter("meal_name", "");
        Navigator.push(context, SlideRightRoute (page: PlanSport(typeplan: "غذایی",)));
    }

    else
      ShowToast("لطفا همه ی فیلد ها را پر کنید",Colors.red,Colors.white);
  });
}
List<String> daysofWeek=["شنبه","یکشنبه","دوشنبه","سه شنبه","چهار شنبه","پنج شنبه","جمعه","خالی"];

getradioModel(){
  setState(() {


  bool isit=false;
  for(int j=0;j<8;j++){
    RadioModel radioModel=RadioModel();
    for(int i=0;i<plans[int.parse(numberplan)].days.length;i++){


    if(plans[int.parse(numberplan)].days[i]==daysofWeek[j]){
      radioModel.text=daysofWeek[j];
      radioModel.isSelected=true;
      isit=true;
    }
  }
  if(!isit) {
    radioModel.text = daysofWeek[j];
    radioModel.isSelected = false;
  }
    isit=false;
    radiodays.add(radioModel);
}

  });
  print(radiodays.length);

}

  @override
  void initState() {
    super.initState();
    getradioModel();
  }
  Future<Null> onWillPop() {
    Navigator.push(context, SlideRightRoute (page:
    PlanSport(typeplan: "غذایی",)));
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
            title: Text(
              "برنامه شماره (${int.parse(numberplan)+1})",
              style: TextStyle(color: Colors.white,fontSize: 17),
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
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 30,
                            child:RadioDay(radiodays,"days"),
                          ),
                          MakeMeals(numberplan),
                          InputText("توضیحات برنامه ...","food_plan_des",height: 100.0,
                          textAlign: TextAlign.start,maxlenght: 2000.0,maxlines: 5,radius: 5.0,
                          value: plans[int.parse(numberplan)].des,),
            new Button(
              ["save"],
              MealsPage(),
              "ثبت",
              30.0,
              15.0,
              startcolor: Color(0xFF6CBF02),
              endcolor: Color(0xFF139101),
              width: 110.0,
              callback: this.callbackSaveEdits,
              functioncode: "saveeditonfood",
            ),

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
