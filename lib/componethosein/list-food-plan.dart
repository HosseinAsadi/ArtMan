import 'package:art_man/components/Lists/middle-food-plan.dart';
import 'package:art_man/components/Networking/FetchFoodPlan.dart';
import 'package:art_man/components/Networking/FetchSportPlansOfTeacher.dart';
import 'package:art_man/page/SportPlan/list-session.dart';

import 'package:flutter/material.dart';
import 'package:jalali_date/jalali_date.dart';


class ListFoodPlan extends StatefulWidget {
  MyPlan plan;
  ResultSport plansport;
  String typeplan;
  ListFoodPlan(this.typeplan,{this.plan,this.plansport});
  @override
  State<StatefulWidget> createState() {
    return LFP(typeplan,plan: plan,plansport: plansport);
  }
}

class LFP extends State<ListFoodPlan> {
  MyPlan plan;
  ResultSport plansport;
  String typeplan;
  LFP(this.typeplan,{this.plan,this.plansport});


  @override
  void initState() {
    super.initState();
    setlength();
  }
  setlength(){
    if(typeplan=="غذایی"){
      setState(() {
        length=plan.result.length;

      });


    }
    if(typeplan=="ورزشی"){
      sportlength=sportlength=plansport.repeate;
      print("ورزشی");
    }

  }

  @override
  Widget build(BuildContext context) {
//
    return Expanded(
        child: ListView.builder(
            itemCount:typeplan=="غذایی"? length:sportlength, itemBuilder: _product)
    );
  }

  Widget _product(BuildContext context, int index) {
  if(typeplan=="غذایی"){
    if(list==1){
      length=plan.result.length;
      return result(index);
    }
    if(list==2){
      length=plan.result[resultindex].plans.length;
      return plans(index);
    }
    if(list==3){
      length=plan.result[resultindex].plans[planindex].meals.length;
      return meals(index);
    }
    if(list==4){
      length=plan.result[resultindex].plans[planindex].meals[mealindex].khoraks.length;
      return foods(index);
    }
  }
  if(typeplan=="ورزشی"){
    if(levele2==1){
      return weeks(index);
    }
   else if(levele2==2){
      return classroom(index);
    }

  }

  }
  result(index){
   return GestureDetector(
        onTap: (){
          setState(() {
            length=plan.result[resultindex].plans.length;
            resultindex=index;
            list=2;
          });
        },
        child:length==0?Center(child:Container(margin: EdgeInsets.all(10),child: Text("لیست برنامه های شما خالی است",
        style: TextStyle(color: Colors.white),),),):Container(
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
                        Text('0${index+1}', style: TextStyle(color: Colors.grey),),
                        Text('  برنامه های', style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Text("${PersianDate.fromDateTime(DateTime.parse(plan.result[index].create_date))
                      .toString(showTime: false)}", style: TextStyle(fontSize: 10),),
                ],
              ),

              Icon(Icons.arrow_forward_ios, color: Colors.grey,)
            ],
          ),
        ) );
  }
  weeks(index){
    return GestureDetector(
        onTap: (){
          setState(() {
            levele2=2;
            sportlength=plansport.sessions.length;
            weekindex=index;

          });
        },
        child:Container(
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
                        Text('0${index+1}', style: TextStyle(color: Colors.grey),),
                        Text('  هفته', style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),

                ],
              ),

              Icon(Icons.arrow_forward_ios, color: Colors.grey,)
            ],
          ),
        ) );
  }
  classroom(index){
    return GestureDetector(
        onTap: (){
           setState(() {
             classroomindex=index;
           });
           Navigator.push(context, MaterialPageRoute(builder: (contex)=>
           ListSession(mymoves: plansport.sessions[index].moves,movename: plansport.sessions[index].name)));

        },
        child:Container(
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
                        Text('0${index+1}', style: TextStyle(color: Colors.grey),),
                        Text('  جلسه', style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Text(plansport.sessions[index].name, style: TextStyle(fontSize: 10),),
                ],
              ),

              Icon(Icons.arrow_forward_ios, color: Colors.grey,)
            ],
          ),
        ) );
  }
  plans(index){


    return GestureDetector(
        onTap: (){
          setState(() {
            length=plan.result[resultindex].plans[planindex].meals.length;
            planindex=index;
            list=3;
          });
        },
        child:Container(
          margin: EdgeInsets.only(left: 30, right: 30, top: 16),
          padding: EdgeInsets.only(left: 5, right: 5),
          height: 60,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)
          ),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Row(
                      children: <Widget>[
                        Text('0${index+1}', style: TextStyle(color: Colors.grey),),
                        Text(typeplan=="غذایی"?'  برنامه':"هفته", style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  typeplan=="غذایی"? Text("${plan.result[resultindex].plans[index].name}", style: TextStyle(fontSize: 10),):Text(""),
                ],
              ),

              Icon(Icons.arrow_forward_ios, color: Colors.grey,)
            ],
          ),


        ) );
  }
  meals(index){
   return GestureDetector(
        onTap: (){
          setState(() {
            length=plan.result[resultindex].plans[planindex].meals[mealindex].khoraks.length;
            mealindex=index;
            list=4;
          });
        },
        child:Container(
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
                        Text('0${index+1}', style: TextStyle(color: Colors.grey),),
                        Text(' وعده', style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Text("${plan.result[resultindex].plans[planindex].meals[index].name}", style: TextStyle(fontSize: 10),),
                ],
              ),

              Icon(Icons.arrow_forward_ios, color: Colors.grey,)
            ],
          ),
        ) );
  }
  foods(index){


        return Container(
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

                        Text("${plan.result[resultindex].plans[planindex].meals[mealindex].khoraks[index].eat}", style: TextStyle(fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                  Text("${plan.result[resultindex].plans[planindex].meals[mealindex].khoraks[index].number}    "
                      "${plan.result[resultindex].plans[planindex].meals[mealindex].khoraks[index].unit}", style: TextStyle(fontSize: 10),),
                ],
              ),

              Icon(Icons.arrow_forward_ios, color: Colors.grey,)
            ],
          ),
         );
  }
}
