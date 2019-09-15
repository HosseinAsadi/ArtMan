import 'package:art_man/components/Lists/middle-food-plan.dart';
import 'package:art_man/components/Networking/FetchFoodPlan.dart';
import 'package:art_man/components/Networking/FetchSportPlansOfTeacher.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/componethosein/appbar.dart';
import 'package:art_man/componethosein/list-food-plan.dart';
import 'package:art_man/componethosein/top-food-plan.dart';
import 'package:art_man/page/SportPlan/sport-plan.dart';
import 'package:flutter/material.dart';
import 'package:jalali_date/jalali_date.dart';


class MySportPlansList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return MSP();
  }
}

class MSP extends State<MySportPlansList> {

  TeacherPlansList myplans;
  String planType;
  bool complete = false;

  getPlanList() async {
    String type = await gettype();

    String usernamee = await getusername();
    print(planType);
    TeacherPlansList sportplans = await fetchSportPlan(
        usernamee, type == "teachers" ? "getFromTeacher" : "getFromUser");
    setState(() {
      myplans = sportplans;
      complete = true;
    });




  }

  getlength(){
    if(level==1){
      return myplans.result.length;
    }
   else if(level==2){
      return myplans.result[resulteindex].sessions.length;
    }

  }
  @override
  void initState() {
    super.initState();
    getPlanList();
  }

  Future<Null> onWillPop() async {
    if(level==2){
      setState(() {
        level=1;
      });
    }else{
      setState(() {
        Navigator.pushNamed(context, "/MySportPlansList");
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
            appBar: PreferredSize(
                child: CustomAppbar('برنامه های ورزشی بدنسازی', null),
                preferredSize: Size.fromHeight(55)),
            body: setBackground()));
  }

  Widget setBackground() =>
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: complete ? ListView.builder(
            itemCount: getlength(), itemBuilder: _product) : Center(
          child: CircularProgressIndicator(),),
      );


  Widget _product(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if(level==1){
            setState(() {
              level=2;
              resulteindex=index;
            });

          }
          else{
            Navigator.push(context,
                MaterialPageRoute(builder: (contex) =>
                    Sport_Plan(result: myplans.result[index],)));
          }

        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 30, right: 30, top: 16),
        padding: EdgeInsets.only(left: 5, right: 5),
        height: 60,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(15)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Row(
                    children: <Widget>[
                      Text(
                        '${index + 1}', style: TextStyle(color: Colors.grey),),
                      Text(level==1?' لیست برنامه های ':"برنامه ",
                        style: TextStyle(fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                Text(level==1?
                  "${PersianDate.fromDateTime(
                    DateTime.parse(myplans.result[index].create_date))
                    .toString(showTime: false)}":myplans.result[resulteindex].sessions[index].name,
                  style: TextStyle(fontSize: 10),),
              ],
            ),

            Icon(Icons.arrow_forward_ios, color: Colors.grey,)
          ],
        ),
      ),
    );
  }
}
