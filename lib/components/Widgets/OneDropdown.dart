import 'package:art_man/components/Utility/CityOfCountrys.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:flutter/material.dart';

class OneDropDown extends StatefulWidget {
  String _hint, id;
  String value;
  int foodPlanIndex;
  int mealIndex;
  int foodIndex;
  String numberfood;
  String unitfood;
  List<String> list;
  double fontsize;
  Color backgroundColor, fontcolor, arrowcolor;
  Function callback;

  OneDropDown(this.id, this.list, this._hint,
      {this.backgroundColor,
        this.fontcolor,
        this.arrowcolor,
        this.fontsize,
        this.callback,
        this.unitfood,
        this.numberfood,
        this.foodIndex,
        this.mealIndex,
        this.foodPlanIndex,
      this.value});

  @override
  myOneDropDown createState() {
    return myOneDropDown(id, list, _hint,
        backgroundColor: backgroundColor,
        fontcolor: fontcolor,
        foodIndex: foodIndex,
        foodPlanIndex: foodPlanIndex,
        mealIndex: mealIndex,
        arrowcolor: arrowcolor,
        numberfood: numberfood,
        unitfood: unitfood,
        fontsize: fontsize,
    value: value);
  }
}

class myOneDropDown extends State<OneDropDown> {
  String cityvalue = null;
  String _hint, id;
  String value;
  int foodPlanIndex;
  int mealIndex;
  int foodIndex;
  List<String> list;
  double fontsize;
  String numberfood;
  String unitfood;
  Color backgroundColor, fontcolor, arrowcolor;

  myOneDropDown(this.id, this.list, this._hint,
      {this.numberfood,this.unitfood,
        this.backgroundColor,
        this.foodIndex,
        this.mealIndex,
        this.foodPlanIndex,
        this.fontcolor, this.arrowcolor,
        this.fontsize,this.value});

  @override
  void initState() {
    super.initState();
  }




  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Container(
            alignment: Alignment.centerRight,
            margin: EdgeInsets.only(top: 4, bottom: 7),
            padding: EdgeInsets.only(right: 15, left: 15),
            height: 40.0,
            decoration: BoxDecoration(
                color: backgroundColor == null ? Colors.white : backgroundColor,
                borderRadius: BorderRadius.circular(20)),
            child: DropdownButton<String>(
              items: list.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(fontSize: fontsize == null ? 14 : fontsize),
                  ),

                );
              }).toList(),
              onChanged: (String newValue) {
                setState(() {
                  if (id == "country") {
                    this.widget.callback(newValue);
                  }
                  if (id == "sport tools") {
                    this.widget.callback(newValue, id);
                  }
                  if (id == "muscle group") {
                    this.widget.callback(newValue, id);
                  }
                  if(foodPlanIndex!=null && mealIndex!=null && foodIndex!=null && numberfood!=null){
                    plans[foodPlanIndex].Meals[mealIndex].Foods[foodIndex].namber=newValue;
                  }
                  if(foodPlanIndex!=null && mealIndex!=null && foodIndex!=null && unitfood!=null){
                    plans[foodPlanIndex].Meals[mealIndex].Foods[foodIndex].unit=newValue;
                  }

                  this.cityvalue = newValue;
                  Kelid.setter(id, cityvalue);
                });
              },
              value: cityvalue,

              isExpanded: false,
              elevation: 120,
              style: TextStyle(
                  color: Colors.blue
              ),
              underline: Text(""),

              hint: Text(
                value==null||value==""?_hint:value,
                style: TextStyle(
                    color: value == null ||value==""? Colors.grey : Colors.black,
                    fontSize: 13),
              ),
              icon: Icon(
                IconData(0xe900, fontFamily: "icone"),
                color: arrowcolor == null ? Colors.white : arrowcolor,
                size: 18,
              ),
            )),
        Positioned(
          left: 10,
          top: 6,
          bottom: 6,
          child:Icon(
            IconData(0xe900, fontFamily: "icone",),
            color: arrowcolor == null ? Colors.green : arrowcolor,
            size: 18,
          ) ,
        )
      ],

    );
  }
}
