import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Toast/VeryfiyDialog.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/FoodClasses.dart';
import 'package:art_man/page/FoodPlan/Meal.dart';
import 'package:art_man/page/FoodPlan/addSportPlan.dart';
import 'package:art_man/page/lists/ListOfMovesInClassroom.dart';
import 'package:flutter/material.dart';

class MakeList extends StatefulWidget {
  String planType;

  MakeList(this.planType);

  @override
  _MakeListState createState() {
    return _MakeListState(planType);
  }
}

class _MakeListState extends State<MakeList> {

  double height = 120.0;
  Color listItemcolor=Colors.white;
  String planType;

  _MakeListState(this.planType);

  Widget _buildProductItem(BuildContext context, int number) {

   return Container(
          height: 110,
          margin: EdgeInsets.only(right: 15, left: 15, bottom: 3),
          decoration: BoxDecoration(
              color: listItemcolor,
              borderRadius: BorderRadius.all(Radius.circular(15))),

          child: GestureDetector(

            onLongPress: () {
              showDialog(
                context: context,
                builder: (_) =>
                new AlertDialog(
                    contentPadding: EdgeInsets.all(0.0),
                    content: VerifyDialog(
                     planType=="ورزشی"? "آیا از حذف کردن این جلسه مطمئن هستید؟":"آیا از حذف کردن این هفته مطمئن هستید؟",id: "remove classroom",)
                ),

              );
              setState(() {
                listItemcolor = Colors.white;
              });
            },
            onTapDown: (Detaial) {
              setState(() {
                if(number==0)
                listItemcolor = Colors.white.withOpacity(0.3);
              });
            },
            onTapUp: (Detaial) {
              setState(() {
                listItemcolor = Colors.white;
              });
            },
            onTap: () {
              planType=="ورزشی"? Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MovesInClassroom(numberclass: "${classes[number].numberclass}",),
                  )):Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MealsPage(numberplan: number.toString(),),
                  ));
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 15),
                    child: Text(
                      planType=="ورزشی"? "جلسه ${classes[number].numberclass}":" برنامه ${1+number}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),
                  planType=="ورزشی"?  Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "حداقل یک حرکت به جلسه مورد نظر اضافه کنید",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                      )):Container(width: 0,height: 0,),
                  Container(
                    alignment: Alignment.bottomRight,
                    child: InputText(
                      planType=="ورزشی"?"نام جلسه را وارد نمایید ...":"نام برنامه ...",
                      "classname",
                      margintop: 8.0,
                      height: 30.0,
                      hintsize: 16,
                      brdercolor: Colors.white.withOpacity(0.0),

                    ),
                  ),
                  SizedBox(height: 17,)
                ]),
          ),
        );
  } //element of make list
  @override
  void initState() {
    super.initState();
    planType=="ورزشی"?costumclass() :costumweek();
  }
  costumclass(){
    if(classes.length==0){
      Classroom classroom=new Classroom();
      classroom.numberclass="1";
      classroom.nameclass="";
      classes.add(classroom);
    }
  }
  costumweek(){

    if(plans.length==0){
      Plan plan=new Plan();
      plans.add(plan);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20,left: 12,right: 12),
          height: height,

          child: new  ListView.builder(
          reverse: false,
          itemBuilder: _buildProductItem,
          itemCount: planType=="ورزشی"?classes.length:plans.length,
          ),
          ),

        Container(
          alignment: Alignment(0, 0),
          width: 30,
          height: 30,
          margin: EdgeInsets.only(
            top: 10,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.yellow[700], Colors.yellow[700]])),
          child: GestureDetector(

            onTap: () {
              setState(() {

                setState(() {
                  if(planType=="ورزشی"){
                    Classroom classroom=new Classroom();
                    classroom.numberclass=(classes.length+1).toString();
                    classroom.nameclass="";
                    classes.add(classroom);
                  }
                  else{
                    Plan plan=new Plan();
                    plans.add(plan);
                  }

                });
                height += 120.0;
              });
            },
            child: Text(
              "+",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 23),
            ),
          ),
        )
      ],
    );
  }




}







