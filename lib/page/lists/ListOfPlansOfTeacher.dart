
import 'package:art_man/components/Networking/FetchFoodPlan.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/page/lists/PlanListGenerator.dart';
import 'package:flutter/material.dart';
import 'package:jalali_date/jalali_date.dart';
/*
class ListPlanOfTeacher extends StatefulWidget {
  String typeplan;
  ListPlanOfTeacher({Key key, @required this.typeplan}) : super(key: key);
  @override
  _ListPlanOfTeacherState createState() => _ListPlanOfTeacherState(typeplan);
}

class _ListPlanOfTeacherState extends State<ListPlanOfTeacher> {
  String typeplan;
  MyPlan myplans;
  _ListPlanOfTeacherState(this.typeplan);
  String planType;
  bool complete=false;

  getPlanList()async{
   
    String type= await gettype();

    String usernamee= await getusername();
    print(planType);
   // if(planType=="غذایی"){
      MyPlan foodplans=  await FetchFoodPlan(usernamee,type=="teachers"?"getFromTeacher":"getFromUser");
      setState(() {

     myplans=foodplans;
      complete=true;
      print(complete);

      });

   // }


  }

  @override
  void initState() {

    super.initState();
    getPlanList();
  }

  @override
  Widget build(BuildContext context) {
    print("ListPlanOfTeacher");
    return Scaffold(
      body:complete?myplans.result==0?Center(
        child: Container(child: Text("شما تا به حال هیچ برنامه ای ننوشته اید"),),
      ):Container(
        height: MediaQuery.of(context).size.height,
        child: PlanListViewGenerator(typeplan,myplans),
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}
*/
