import 'dart:convert';

import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Lists/MakeMealsList.dart';
import 'package:art_man/components/Networking/SendPlanSport.dart';
import 'package:art_man/components/RadioButtons/RadioButton.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Utility/Validator.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:art_man/components/Lists/MakeList.dart';
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



callbackSaveEdits(){
  setState(() {

    if (Kelid.getter("meal_name")!=""&& Kelid.getter("days")!="" ) {
      Meale meal=new Meale();
      meal.name=Kelid.getter("meal_name");
      meal.fill=true;
      meal.Foods=foods;
      meals.add(meal);
      Kelid.setter("meal_name","" );
      Kelid.setter("save", "");
      Kelid.setter("days", "");
      foods.clear();
      Navigator.push(context, MaterialPageRoute(builder: (context)=>PlanSport(typeplan: "غذایی",)));

    }
    else
      ShowToast("لطفا همه ی فیلد ها را پر کنید",Colors.red,Colors.white);

  });
}




  @override
  void initState() {
    super.initState();

  }
  Future<Null> onWillPop() {
    Navigator.pushNamed(context, "/PlaneSportTeacher");

    print("back pressed runned");
    /*
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('Are you sure?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ?? false;*/
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
              "تنظیم وعده ها",
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
                            height: 50,
                            child:CustomRadio(["شنبه","یکشنبه","دوشنبه","سه شنبه","چهار شنبه","پنج شنبه","جمعه","خالی"],"days",false),
                          ),
                          MakeMeals(),
                          InputText("توضیحات برنامه ...","food_plan_des",height: 100.0,
                          textAlign: TextAlign.start,maxlenght: 2000.0,maxlines: 5,radius: 5.0,),
            new Button(
              ["save"],
              "/",
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
