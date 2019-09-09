/*
import 'package:art_man/components/Lists/MakeMealsList.dart';
import 'package:art_man/components/Widgets/DropDown.dart';
import 'package:art_man/page/SportPlan/PlanSport.dart';
import 'package:flutter/material.dart';

*/
/*class AddMeal extends StatefulWidget {

  @override
  _AddMealState createState() => _AddMealState();
}*//*


class _AddMealState extends State<AddMeal> {
  List<String> days=new List();




  @override
  void initState() {
    super.initState();
    for(int i=1;i<31;i++){
      days.add(i.toString());
    }


  }

  Future<Null> onWillPop() {
    Navigator.push(context, MaterialPageRoute(builder: (context)=>PlanSport(typeplan: "غذایی",)));
  }
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: onWillPop,
        child:
        Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor: Color(0xFF7FC81D),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {},
              ),
            ],
            title: Text(
              "افزودن وعده",
              style: TextStyle(color: Colors.white),
            ),
          ),

          body: Center(
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/background.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: ListView(
                shrinkWrap: false,
                children: <Widget>[
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                          left: 15, right: 15, top: 10, bottom: 10),

                      child: Column(

                        children: <Widget>[
                          DropDown("day_of_food_plan",days,"برنامه چند روز اجرا شود؟"),

                              MakeMeals(),

                        ],
                      ),

                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
*/
