import 'package:art_man/components/Lists/middle-food-plan.dart';
import 'package:art_man/components/Networking/FetchFoodPlan.dart';
import 'package:art_man/components/Networking/FetchFoodsPlansOfTeacher.dart';
import 'package:art_man/components/Networking/FetchSportPlansOfTeacher.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/componethosein/appbar.dart';
import 'package:art_man/componethosein/list-food-plan.dart';
import 'package:art_man/componethosein/top-food-plan.dart';
import 'package:flutter/material.dart';


class ShowSportPlan extends StatefulWidget {


  @override
  State<StatefulWidget> createState() {
    return ShowSportPlanstate();
  }
}

class ShowSportPlanstate extends State<ShowSportPlan> {
  TeacherPlansList myplans;
  String planType;
  bool complete=false;

  getPlanList()async{

    String type= await gettype();

    String usernamee= await getusername();
    print(planType);

    TeacherPlansList foodplans=  await fetchSportPlan(usernamee,type=="teachers"?"getFromTeacher":"getFromUser");
    setState(() {

      myplans=foodplans;
      complete=true;
      print(complete);

    });




  }

  @override
  void initState() {

    super.initState();
    getPlanList();
  }

  Future<Null>  onWillPop() async{
    setState(() {
        Navigator.pushNamed(context, "/PlaneSportTeacher");
    });

  }
  @override
  Widget build(BuildContext context) {
    return
      new WillPopScope(
          onWillPop: onWillPop,
          child:Scaffold(
              appBar: PreferredSize(
                  child: CustomAppbar('برنامه غذایی بدنسازی', null),
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
    child:complete? body():Center(child: CircularProgressIndicator(),),
  );

  Widget body() => Center(
    child: Column(
      children: <Widget>[
        /*TopFoodPlan(),
       MiddleFoodPlan(myplans.result[resultindex].plans[planindex].desc),
        ListFoodPlan(myplans)*/
      ],
    ),
  );
}
