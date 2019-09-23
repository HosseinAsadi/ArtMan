import 'package:art_man/components/Networking/FetchFoodPlan.dart';
import 'package:art_man/components/Networking/FetchSportPlansOfTeacher.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/page/SportPlan/PlanSport.dart';
import 'package:art_man/page/lists/PatternListGenerator.dart';
import 'package:flutter/material.dart';

class Patternlist extends StatefulWidget {
  String planType;
  Patternlist({Key key,@required this.planType}):super(key:key);
  @override
  _PatternlistState createState() => _PatternlistState(planType);
}

class _PatternlistState extends State<Patternlist> {
  bool complete=false;
  String planType;
  List<ResultSport> sportplan=new List();
  List<FoodResult> foodPlan=new List();
  _PatternlistState(this.planType);
  getplan()async{
    String username= await getusername();
    if(planType=="ورزشی"){
      TeacherPlansList plan =await fetchSportPlan(username,"getFromTeacher/t");
      for(int i=0;i<plan.result.length;i++){
        if(plan.result[i].template_name!=""){
          sportplan.add(plan.result[i]);
        }
      }
    }
    if(planType=="غذایی"){
      MyPlan plan = await FetchFoodPlan(username,"getFromTeacher/t");
      for(int i=0;i<plan.result.length;i++){
        if(plan.result[i].template_name!=""){
          foodPlan.add(plan.result[i]);
        }
      }
    }
    setState(() {
      complete=true;});
  }
  Future<Null> onWillPop() {
   Navigator.push(context, MaterialPageRoute(builder: (contex)=>PlanSport(typeplan: planType,)));
  }
  @override
  void initState() {
    super.initState();
    getplan();
  }
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
          appBar:new  AppBar(

              backgroundColor: Colors.green,
              title: Text("الگوها",style: TextStyle(color: Colors.white),),

          ),
          body: complete? Container(
            margin: EdgeInsets.only(top: 10,bottom: 0),
            height: MediaQuery.of(context).size.height,
            child: planType=="غذایی"?PatternListGenerator(planType,foodPlan:foodPlan):
             PatternListGenerator(planType,sportplan:sportplan ),
          ):CircularProgressIndicator(),

        ));
  }


}
//image send to list safe

