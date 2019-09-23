import 'package:art_man/components/Lists/middle-food-plan.dart';
import 'package:art_man/components/Networking/FetchFoodPlan.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/componethosein/appbar.dart';
import 'package:art_man/componethosein/list-food-plan.dart';
import 'package:art_man/componethosein/top-food-plan.dart';
import 'package:flutter/material.dart';


class FoodPlan extends StatefulWidget {
  String typeplan;
  FoodPlan({Key key, @required this.typeplan}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return FP(typeplan);
  }
}

class FP extends State<FoodPlan> {
  String typeplan;
  String type;
  MyPlan myplans;
  FP(this.typeplan);
  String planType;
  bool complete=false;

  getPlanList()async{

    String type= await gettype();

    String usernamee= await getusername();
    print(planType);

    MyPlan foodplans=  await FetchFoodPlan(usernamee,type=="teachers"?"getFromTeacher":"getFromUser");
    setState(() {

      myplans=foodplans;
      complete=true;
      print ("get food plans of student");
      print (myplans.result.length);

    });



  }
gettypee()async{
    String t=await gettype();
    setState(() {
      type=t;
    });
}
  @override
  void initState() {

    super.initState();
    gettypee();
    getPlanList();
  }

 Future<Null>  onWillPop() async{
    setState(() {
      if(typeplan=="غذایی")
        {
          if(list==1){
            Navigator.pushNamed(context,type=="teachers"? "/PlaneSportTeacher":"/PlanePage");
          }
          if(list==2){
            length=myplans.result.length;
            list=1;
          }
          if(list==3){
            length=myplans.result[resultindex].plans.length;
            list=2;
          }
          if(list==4){
            length=myplans.result[resultindex].plans[planindex].meals.length;
            list=3;
          }
        }

    });

  }
  @override
  Widget build(BuildContext context) {
    return
      new WillPopScope(
        onWillPop: onWillPop,
        child:Scaffold(

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
            TopFoodPlan("غذایی"),
            list==2? MiddleFoodPlan(myplans.result[resultindex].plans[planindex].desc):Container(width: 0,height: 0,),
            ListFoodPlan("غذایی",plan: myplans,)
          ],
        ),
      );
}
