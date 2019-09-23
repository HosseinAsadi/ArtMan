import 'package:art_man/components/Animation/RightSlidePage.dart';
import 'package:art_man/components/Animation/ScaleRoutePage.dart';
import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/InputTexts/PlanInputText.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:art_man/components/Toast/VeryfiyDialog.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/Validator.dart';
import 'package:art_man/page/FoodPlan/Food.dart';
import 'package:flutter/material.dart';

class MakeMeals extends StatefulWidget {
 String numberplan;
 MakeMeals(this.numberplan);

  @override
  _MakeMealsState createState() {
    return _MakeMealsState(numberplan);
  }
}

class _MakeMealsState extends State<MakeMeals> {
  String numberplan;
  _MakeMealsState(this.numberplan);
  double height = 110.0;
  int selectedIndex;
  setIndex(index){
    setState(() {
      selectedIndex=index;
    });
  }

  removemeal(index){
    setState(() {
      plans[int.parse(numberplan)].Meals.removeAt(index);
    });
  }

  Widget _buildProductItem(BuildContext context, int number) {

    return  InkWell(

      onLongPress: () {
        showDialog(
          context: context,
          builder: (_) =>
          new AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0))),
              contentPadding: EdgeInsets.all(0.0),
              content: VerifyDialog(
                "آیا از حذف کردن این وعده مطمئن هستید؟",id: "remove_meal",
              callback: this.removemeal,index: number,)
          ),

        );

      },


      onTap: (){
        setIndex(number);
        Navigator.push(context, SlideRightRoute (page: FoodsPage(numberplan: numberplan,numbermeal: number.toString(),)));
      },
      child: Stack(
      children: <Widget>[
        Container(
          height: 110,
          margin: EdgeInsets.only(right: 15, left: 15, bottom: 3),
          decoration: BoxDecoration(
              color: selectedIndex!=null && selectedIndex==number?
              Colors.white.withOpacity(0.3):
              Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(15))),



            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 15,top: 7),
                    child: Text(
                      "وعده ${number+1}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.w700,fontSize: 16),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(7),
                    alignment: Alignment.bottomRight,
                    child: PlanInputText(
                      "نام وعده ...",
                      "meal_name",
                      "غذایی",
                      margintop: 8.0,
                      height: 30.0,
                      hintsize: 16,
                      foodPlanIndex: int.parse(numberplan),
                      mealIndex: number,
                      brdercolor: Colors.white.withOpacity(0.0),
                      value: plans[int.parse(numberplan)].Meals[number].name,

                    ),
                  ),
                  // checkbox


                ]),
          ),
  ] ),


    ) ;

  } //element of make list




@override
  void initState() {
    super.initState();
    createnewMeal();
  }
  createnewMeal(){
    if(plans[int.parse(numberplan)].Meals.length==0){
      Meale meale=new Meale();
      plans[int.parse(numberplan)].Meals.add(meale);
    }
  }



  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20,left: 12,right: 12),
          height: height*(plans[int.parse(numberplan)].Meals.length),
          child: new  ListView.builder(
            reverse: false,
            itemBuilder: _buildProductItem,
            itemCount: plans[int.parse(numberplan)].Meals.length,
          ),
        ),
     Adder("+")

      ],
    );
  }
Adder(text){
    return  InkWell(
      onTap: () async{
          setState(() {
              Meale newMeale=new Meale();
              plans[int.parse(numberplan)].Meals.add(newMeale);
          });
      },
      child:Container(
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