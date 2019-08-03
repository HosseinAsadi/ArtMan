import 'package:art_man/components/Lists/middle-food-plan.dart';
import 'package:art_man/componethosein/appbar.dart';
import 'package:art_man/componethosein/list-food-plan.dart';
import 'package:art_man/componethosein/top-food-plan.dart';
import 'package:flutter/material.dart';


class FoodPlan extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FP();
  }
}

class FP extends State<FoodPlan> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            child: CustomAppbar('برنامه غذایی بدنسازی', null),
            preferredSize: Size.fromHeight(55)),
        body: setBackground());
  }

  Widget setBackground() => Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: body(),
      );

  Widget body() => Center(
        child: Column(
          children: <Widget>[
            TopFoodPlan(),
            MiddleFoodPlan(),
            ListFoodPlan()
          ],
        ),
      );
}
