import 'package:art_man/components/Lists/middle-food-plan.dart';
import 'package:art_man/components/Networking/FetchSportPlansOfTeacher.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/componethosein/appbar.dart';
import 'package:art_man/componethosein/list-food-plan.dart';
import 'package:art_man/componethosein/top-food-plan.dart';
import 'package:flutter/material.dart';


class Sport_Plan extends StatefulWidget {
  ResultSport result;
 Sport_Plan({Key key,@required this.result}):super(key:key);
  @override
  State<StatefulWidget> createState() {
    return SP(result);
  }
}

class SP extends State<Sport_Plan> {
  SP(this.result);
  String typeplan;
  ResultSport result;
  String planType;
  bool complete=false;



  Future<Null>  onWillPop() async{
    setState(() {

        Navigator.pushNamed(context, "/MySportPlansList");

    });

  }
  @override
  Widget build(BuildContext context) {
    return
      new WillPopScope(
          onWillPop: onWillPop,
          child:Scaffold(
              appBar: PreferredSize(
                  child: CustomAppbar('برنامه ورزشی بدنسازی', null),
                  preferredSize: Size.fromHeight(55)),
              body: setBackground()));
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
        TopFoodPlan("ورزشی",progress: progress,),

        ListFoodPlan("ورزشی",plansport: result,)
      ],
    ),
  );
}
