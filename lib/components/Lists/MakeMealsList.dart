import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:art_man/components/Toast/VeryfiyDialog.dart';
import 'package:art_man/components/Utility/FoodClasses.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/Validator.dart';
import 'package:art_man/page/FoodPlan/Food.dart';
import 'package:flutter/material.dart';

class MakeMeals extends StatefulWidget {


  @override
  _MakeMealsState createState() {
    return _MakeMealsState();
  }
}

class _MakeMealsState extends State<MakeMeals> {

  double height = 120.0;
  Color listItemcolor=Colors.white;



  Widget _buildProductItem(BuildContext context, int number) {

    return Stack(
      children: <Widget>[
        Container(
          height: 110,
          margin: EdgeInsets.only(right: 15, left: 15, bottom: 3),
          decoration: BoxDecoration(
              color: listItemcolor,
              borderRadius: BorderRadius.all(Radius.circular(15))),

          child: InkWell(

            onLongPress: () {
              showDialog(
                context: context,
                builder: (_) =>
                new AlertDialog(
                    contentPadding: EdgeInsets.all(0.0),
                    content: VerifyDialog(
                      "آیا از حذف کردن این وعده مطمئن هستید؟",id: "remove_meal",)
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

            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FoodsPage()));
            },

            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 15),
                    child: Text(
                      "وعده ${number+1}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w500),
                    ),
                  ),

                  Container(
                    alignment: Alignment.bottomRight,
                    child: InputText(
                      "نام وعده ...",
                      "meal_name",
                      margintop: 8.0,
                      height: 30.0,
                      hintsize: 16,
                      brdercolor: Colors.white.withOpacity(0.0),

                    ),
                  ),
                  // checkbox


                ]),
          ),
        ),

      ],
    ) ;

  } //element of make list





  @override
  void initState() {
    super.initState();

  }


  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20,left: 12,right: 12),
          height:meals.length==0?height: height*meals.length,

          child: new  ListView.builder(
            reverse: false,
            itemBuilder: _buildProductItem,
            itemCount: meals.length+1,
          ),
        ),
Adder("+")

      ],
    );
  }
Adder(text){
    return  Container(
      alignment: Alignment(0, 0),
      padding: EdgeInsets.all(5),


      width: 60,
      height: 60,
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50),
          gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.yellow[700], Colors.yellow[700]])),
      child: GestureDetector(

        onTap: () {
          setState(() {

            setState(() {

              if (Kelid.getter("meal_name")!="" ) {
                Meale meal=new Meale();
                meal.name=Kelid.getter("meal_name");
                meal.fill=true;
                meal.Foods=foods;
                meals.add(meal);
                Kelid.setter("meal_name", "");
                foods.clear();
                height += 120.0;
              }

              else
                ShowToast("لطفا همه ی فیلد ها را پر کنید",Colors.red,Colors.white);

            });
          });
        },
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w900,
              fontSize: 29),
        ),
      ),
    );
}



}