import 'dart:convert';

import 'package:art_man/components/Networking/FetchFoodPlan.dart';
import 'package:art_man/components/Networking/FetchSportPlansOfTeacher.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/Analyzes/Branch.dart';
import 'package:art_man/page/Analyzes/SummaryAnswer.dart';
import 'package:art_man/page/SportPlan/PlanSport.dart';
import 'package:art_man/page/profile/TeacherProfileReadOnly.dart';
import 'package:flutter/material.dart';
import 'package:jalali_date/jalali_date.dart';

class PatternListGenerator extends StatefulWidget {
  List<ResultSport> sportplan;
  List<FoodResult> foodPlan;
  String typeplan;

  PatternListGenerator(this.typeplan, {this.sportplan,this.foodPlan});
  @override
  _PatternListGeneratorState createState() => _PatternListGeneratorState(typeplan,sportplan: sportplan,foodPlan: foodPlan);
}

class _PatternListGeneratorState extends State<PatternListGenerator> {
  Strings strings=new Strings();
  String typeplan;
  List<ResultSport> sportplan;
  List<FoodResult> foodPlan;
  _PatternListGeneratorState(this.typeplan ,{this.sportplan,this.foodPlan});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      child:typeplan=="غذایی"?foodPlan.length==0?Center(
        child: Container(child: Text("شما تا به حال هیچ برنامه غذایی را به عنوان الگو ذخیره نکرده اید"),),
      ) :new ListView.builder(
        reverse: false,
        itemBuilder: _buildProductItem,
        itemCount: foodPlan.length,
      ):sportplan.length==0?Center(
        child: Container(child: Text("شما تا به حال هیچ برنامه ورزشی را به عنوان الگو ذخیره نکرده اید"),),
      ) :new ListView.builder(
        reverse: false,
        itemBuilder: _buildProductItem,
        itemCount: sportplan.length,
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
        child: ListTile(
          onTap: () {
            if(typeplan=="غذایی"){
              plans.clear();
              for(int i=0;i<foodPlan[index].plans.length;i++){
                Plan plan=new Plan();
                for(int j=0;j<foodPlan[index].plans[i].meals.length;j++){
                  Meale meale=new Meale();
                  for(int k=0;k<foodPlan[index].plans[i].meals[j].khoraks.length;k++){
                    Foode foode=new Foode();
                    foode.name=foodPlan[index].plans[i].meals[j].khoraks[k].eat;
                    foode.unit=foodPlan[index].plans[i].meals[j].khoraks[k].unit;
                    foode.namber=foodPlan[index].plans[i].meals[j].khoraks[k].number;
                    meale.Foods.add(foode);
                  }
                  meale.name=foodPlan[index].plans[i].meals[j].name;
                  plan.Meals.add(meale);

                }
                plan.name=foodPlan[index].plans[i].name;
                plan.des=foodPlan[index].plans[i].desc;
                plan.days=foodPlan[index].plans[i].days;
                plans.add(plan);
              }
            }
            if(typeplan=="ورزشی"){
              classes.clear();


                for(int j=0;j<sportplan[index].sessions.length;j++){
                  Classroom classroom=new Classroom();
                  for(int k=0;k<sportplan[index].sessions[j].moves.length;k++){
                    Moveslist moveslist=new Moveslist();
                    moveslist.done=sportplan[index].sessions[j].moves[k].done;
                   moveslist.videourl= sportplan[index].sessions[j].moves[k].moves_id;

                    Optionss optionss=new Optionss();
                    optionss.repeat=sportplan[index].sessions[j].moves[k].options.repeat;
                    optionss.rest=sportplan[index].sessions[j].moves[k].options.rest;
                    optionss.des=sportplan[index].sessions[j].moves[k].options.des;
                    optionss.exersiceSystem=sportplan[index].sessions[j].moves[k].options.exersiceSystem;
                    optionss.colory=sportplan[index].sessions[j].moves[k].options.colory;
                    optionss.meter=sportplan[index].sessions[j].moves[k].options.meter;
                    optionss.tempo=sportplan[index].sessions[j].moves[k].options.tempo;
                    optionss.rm_one=sportplan[index].sessions[j].moves[k].options.rm_one;
                    optionss.second=sportplan[index].sessions[j].moves[k].options.second;
                    optionss.set=sportplan[index].sessions[j].moves[k].options.set;
                    moveslist.options=optionss;
                    classroom.moves.add(moveslist);
                  }
                  classroom.nameclass=sportplan[index].sessions[j].name;
                  classes.add(classroom);

                }

            }
            Navigator.push(
                context,
               MaterialPageRoute(
                  builder: (context) => PlanSport(typeplan: typeplan,),
                )
            );
          },
          leading: Container(
            width: 40,
            height: 40,
            child: ClipRRect(
              child: Image.asset(typeplan=="غذایی"?"assets/images/foodplan.jpg":"assets/images/sportplan.jpg",fit: BoxFit.cover,),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
          title: Text(
            typeplan=="غذایی"?
            "${foodPlan[index].template_name}":"${sportplan[index].template_name}",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(typeplan=="غذایی"?
          PersianDate.fromDateTime(DateTime.parse(foodPlan[index].create_date))
              .toString(showTime: false) :PersianDate.fromDateTime(DateTime.parse(sportplan[index].create_date))
              .toString(showTime: false),
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal)),
        ));
  }

}
