import 'package:art_man/components/Networking/FetchSportPlansOfTeacher.dart';
import 'package:art_man/components/Utility/Function.dart';
import 'package:art_man/page/lists/LisviewGenerator.dart';
import 'package:art_man/page/lists/PlanListGenerator.dart';
import 'package:flutter/material.dart';

class ListPlanOfTeacher extends StatefulWidget {
  @override
  _ListPlanOfTeacherState createState() => _ListPlanOfTeacherState();
}

class _ListPlanOfTeacherState extends State<ListPlanOfTeacher> {
  bool complete=false;
  List<String> namesOfPlan=new List();
  getPlans()async{
    TeacherPlansList plans=await plansOfTeacher();
    setState(() {
      for(int i=0;i<plans.sessions.length;i++){
        namesOfPlan.add(plans.sessions[i].name);
      }
      complete=true;
    });
  }
  @override
  void initState() {
    super.initState();
    getPlans();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: complete? namesOfPlan.length==0?Center(
        child: Container(child: Text("شما تا به حال هیچ برنامه ای ننوشته اید"),),
      ):Container(
        height: MediaQuery.of(context).size.height,
        child: PlanListViewGenerator(namesOfPlan),
      ):Center(child: CircularProgressIndicator(),),
    );
  }
}
