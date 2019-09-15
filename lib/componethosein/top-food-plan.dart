import 'package:art_man/components/Networking/FetchSportPlansOfTeacher.dart';
import 'package:flutter/material.dart';

class TopFoodPlan extends StatefulWidget {
  String typeplan;
  String description;
  int progress;
  TopFoodPlan(this.typeplan,{this.description,this.progress});
  @override
  _TopFoodPlanState createState() => _TopFoodPlanState(typeplan,description,progress: progress);
}

class _TopFoodPlanState extends State<TopFoodPlan> {
  String typeplan;
  String description;
  int progress;
  _TopFoodPlanState(this.typeplan,this.description,{this.progress});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset( typeplan=="ورزشی"?'assets/images/sportplan.jpg':'assets/images/foodplan.jpg', fit: BoxFit.cover,),
       typeplan=="ورزشی" ?Positioned(
            bottom: 0,
            right: 25,
            child: Container(
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    )
                ),
                child: Padding(padding: EdgeInsets.only(left: 16, right: 16, top: 2),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('وزن ایده آل\n 85 کیلوگرم', textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                      Text('مدت زمان برنامه\n 24 ساعت', textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                      Text('سطح کاربری \n متوسط', textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),),
                    ],
                  ),
                )
            )
        ):Container(width: 0,height: 0,),

      ],
    );
  }
}


