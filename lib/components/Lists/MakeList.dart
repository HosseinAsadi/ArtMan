import 'package:art_man/components/Animation/RightSlidePage.dart';
import 'package:art_man/components/Animation/ScaleRoutePage.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/InputTexts/PlanInputText.dart';
import 'package:art_man/components/Toast/VeryfiyDialog.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/page/FoodPlan/Meal.dart';
import 'package:art_man/page/lists/MySelection.dart';
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

  Color listItemcolor = Colors.white, backcolor = Colors.yellow[700];
  String planType;
  int selectedIndex;

  _getindex(index){
    setState(() {
      selectedIndex=index;
    });
  }
  removeplan(index){
    setState(() {
      if(planType=="غذایی"){
        plans.removeAt(index);
      }
      else{
        classes.removeAt(index);
      }

    });
  }
  _MakeListState(this.planType);

  getcontoroler() {
    TextEditingController controller = new TextEditingController();
    return controller;
  }

  Widget _buildProductItem(BuildContext context, int number) {
    return InkWell(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (_) => new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.all(0.0),
              content: VerifyDialog(
                planType == "ورزشی"
                    ? "آیا از حذف کردن این جلسه مطمئن هستید؟"
                    : "آیا از حذف کردن این هفته مطمئن هستید؟",
                id: "remove_classroom",
                callback: this.removeplan,
                index: number,
              )),
        );
        setState(() {
          listItemcolor = Colors.white;
        });
      },

      onTap: () {
        _getindex(number);
       if(planType == "ورزشی")
         {

         Navigator.push(
             context,
             SlideRightRoute(
               page:
                   MySelection(
                     numberclass: "${number}",
                   ),
             ));
       }
       else {


         Navigator.push(
             context,
           SlideRightRoute(
             page:
                   MealsPage(
                     numberplan: number.toString(),
                   ),
             ),
         );
       }
      },
      child: Container(
        height:planType=="ورزشی"? 120:110.0,
        margin: EdgeInsets.only(right: 15, left: 15, bottom: 3),
        decoration: BoxDecoration(
            color: selectedIndex != null && selectedIndex == number
                ? Colors.white.withOpacity(0.3)
                : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child:Row(
          children: <Widget>[
            Flexible(flex: 5,child:  Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 15, top: 10),
                    child: Text(
                      planType == "ورزشی"
                          ? "جلسه ${1 + number}"
                          : " برنامه ${1 + number}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w900),
                    ),
                  ),
                  planType == "ورزشی"
                      ? Container(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "   حداقل یک حرکت به جلسه مورد نظر اضافه کنید",
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.w400
                        ),
                      ))
                      : Container(
                    width: 0,
                    height: 0,
                  ),
                  Container(
                    padding: EdgeInsets.only(right: 10),
                    alignment: Alignment.bottomRight,
                    child: PlanInputText(
                      planType == "ورزشی"
                          ? "نام جلسه را وارد نمایید ..."
                          : "نام برنامه ...",
                      "classname",
                      planType
                      ,
                      margintop: 8.0,
                      height: 30.0,
                      hintsize: 16,
                      fontWeight: FontWeight.w500,
                      sportPlanIndex: number,
                      foodPlanIndex: number,
                      brdercolor: Colors.white.withOpacity(0.0),
                      value: planType=="غذایی"?plans[number].name:classes[number].nameclass,
                    ),
                  ),
                  SizedBox(
                    height: 17,
                  )
                ]),),
        Flexible(flex: 1,
            child:Container(alignment: Alignment.center,
              width: 30,
              height: 30,margin: EdgeInsets.all(5),
            child: Icon(Icons.arrow_forward_ios,color: Colors.grey,),))
          ],
        ),
       
      ),
    );
  } //element of make list

  @override
  void initState() {
    super.initState();
    planType == "ورزشی" ? costumclass() : costumweek();
  }

  costumclass() {
    if (classes.length == 0) {
      Classroom classroom = new Classroom();
      classes.add(classroom);
    }
  }

  costumweek() {
    if (plans.length == 0) {
      Plan plan = new Plan();
      plans.add(plan);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Container(
        margin: EdgeInsets.only(top: 20, left: 12, right: 12),
        height:
            planType == "ورزشی" ? classes.length * height : plans.length * height,
        child: new ListView.builder(
          reverse: false,
          itemBuilder: _buildProductItem,
          itemCount: planType == "ورزشی" ? classes.length : plans.length,
        ),
      ),
      GestureDetector(
        onTap: () {
          setState(() {
            setState(() {
              if (planType == "ورزشی") {
                Classroom classroom = new Classroom();
                classroom.nameclass = classes[classes.length-1].nameclass;
                classroom..moves = classes[classes.length-1].moves;
                classes[classes.length-1]=classroom;
                Classroom newclassroom = new Classroom();
                classes.add(newclassroom);
              } else {
                Plan newplan = new Plan();
                plans.add(newplan);
              }
            });

          });
        },


        child: Container(
          alignment: Alignment(0, 0),
          padding: EdgeInsets.all(5),
          width: 60,
          height: 60,
          margin: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [backcolor, backcolor])),
          child: Text(
            "+",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w900, fontSize: 29),
          ),
        ),
      ),
    ]);
  }
}
