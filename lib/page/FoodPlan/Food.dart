import 'dart:convert';

import 'package:art_man/components/Animation/RightSlidePage.dart';
import 'package:art_man/components/Animation/ScaleRoutePage.dart';
import 'package:art_man/components/Buttons/Button.dart';

import 'package:art_man/components/Lists/MakeFoodList.dart';

import 'package:art_man/components/Utility/Keys.dart';

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
    Navigator.push(
        context,
        SlideRightRoute (
            page:  MealsPage(
              numberplan: numberplan,
            )));
    });
  }

  Future<Null> onWillPop() {
    Navigator.push(
        context,
        SlideRightRoute(
            page:  MealsPage(
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
                            MealsPage(),
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
