import 'dart:convert';

import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Lists/MakeFoodList.dart';
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
import 'package:flutter/material.dart';

import 'Meal.dart';

class FoodsPage extends StatefulWidget {
  String numberplan, numbermeal;

  FoodsPage({Key key, @required this.numberplan, this.numbermeal})
      : super(key: key);

  @override
  _FoodsPageState createState() => _FoodsPageState(numberplan, this.numbermeal);
}

class _FoodsPageState extends State<FoodsPage> {
  String numberplan, numbermeal;

  _FoodsPageState(this.numberplan, this.numbermeal);

  callbacksaveEdits() {
    setState(() {
    Kelid.setter("saveeditonfood", "ok");

    Validator validator = new Validator();
      if (validator
          .isvalid(["number_Of_khorak", "unit_Of_khorak", "khorak_name"]) ) {
        Foode food = new Foode();
        food.name = Kelid.getter("khorak_name");
        food.namber = Kelid.getter("number_Of_khorak");
        food.unit = Kelid.getter("unit_Of_khorak");
        plans[int.parse(numberplan)].Meals[int.parse(numbermeal)].Foods[
        plans[int.parse(numberplan)].Meals[int.parse(numbermeal)].Foods.length-1
        ]=food;
        Kelid.setter("khorak_name", "");
        Kelid.setter("number_Of_khorak", "");
        Kelid.setter("unit_Of_khorak", "");

      }
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (contex) => MealsPage(
              numberplan: numberplan,
            )));
    });
  }

  Future<Null> onWillPop() {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (contex) => MealsPage(
                  numberplan: numberplan,
                )));
   // ShowToast("لیست غذا های این وعده ثبت نشد", Colors.red, Colors.white);

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
              "تنظیم غذاها وعده ${int.parse(numbermeal) + 1} برنامه ${int.parse(numberplan) + 1}",
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
                      margin: EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),
                      child: Column(
                        children: <Widget>[
                          MakeFoodList(numberplan, numbermeal),
                          new Button(
                            ["saveeditonfood"],
                            "/MealsPage",
                            "ثبت",
                            30.0,
                            15.0,
                            startcolor: Color(0xFF6CBF02),
                            endcolor: Color(0xFF139101),
                            width: 110.0,
                            callback: this.callbacksaveEdits,
                            functioncode: "saveeditonfood",
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
