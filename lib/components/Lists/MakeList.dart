import 'package:art_man/components/InputTexts/InputText.dart';
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
                id: "remove classroom",
              )),
        );
        setState(() {
          listItemcolor = Colors.white;
        });
      },

      onTap: () {
        _getindex(number);
       if(planType == "ورزشی") {
         classes[number].nameclass=Kelid.getter("classname");
         Kelid.setter("classname", "");
         Navigator.push(
             context,
             MaterialPageRoute(
               builder: (context) =>
                   MySelection(
                     numberclass: "${number}",
                   ),
             ));
       }
       else {
         Navigator.push(
             context,
             MaterialPageRoute(
               builder: (context) =>
                   MealsPage(
                     numberplan: number.toString(),
                   ),
             ));
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
        child: Column(
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
                child: InputText(
                  planType == "ورزشی"
                      ? "نام جلسه را وارد نمایید ..."
                      : "نام برنامه ...",
                  "classname",
                  margintop: 8.0,
                  height: 30.0,
                  hintsize: 16,
                  fontWeight: FontWeight.w500,
                  brdercolor: Colors.white.withOpacity(0.0),
                  value: planType=="غذایی"?plans[number].name:classes[number].nameclass,
                ),
              ),
              SizedBox(
                height: 17,
              )
            ]),
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
                Plan plan = new Plan();
                plan.Meals = plans[plans.length - 1].Meals;
                plan.name= Kelid.getter("classname");
                plan.des = Kelid.getter("food_plan_des");
                plan.days = days;
                plans[plans.length - 1] = plan; /////????????

                Plan newplan = new Plan();
                plans.add(newplan);
                Kelid.setter("classname", "");
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
