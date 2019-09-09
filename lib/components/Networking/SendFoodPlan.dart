import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';






/*

class Plane{

  String name;
  String des;
  List<String> days;
  List<Meal> meals;

  Plane(this.name,this.days,this.meals,this.des);
  Plane.fromJson(Map<String, dynamic> json) :
        name = json["name"],
        des = json["desc"],
        days = json["days"].cast<String>(),
        meals = (json['meals'] as List).map((i) => Meal.fromJson(i)).toList();
  Map<String, dynamic> toJson() => {

    'name': name,
    'desc': des,
    'days': days,
    'meals': meals,
  };

}
class Meal{

  String name;
  List<Food> foods;

  Meal(this.name,this.foods);
  Meal.fromJson(Map<String, dynamic> json) :
        name = json["name"],
        foods = (json['foods'] as List).map((i) => Food.fromJson(i)).toList();

  Map<String, dynamic> toJson() => {
    'name': name,
    'foods': foods,
  };

}
class Food{

  final String name;
  final String number;
  final String unit;


  Food(this.name,this.number,this.unit);
  Food.fromJson(Map<String, dynamic> json) :
        name = json["name"],
        number = json["number"],
        unit = json["unit"];
  Map<String, dynamic> toJson() => {
    'name': name,
    'number': number,
    'unit': unit,

  };

}


fillFoodPlan(){
  print("ddddddddddddddddddddddddd  plans list is fill");

  for(int k=0;k<plans.length;k++) {
    for (int i = 0; i < plans[k].Meals.length; i++) {
      print(plans[0].Meals[i].name);
      for (int j = 0; j < plans[k].Meals[i].Foods.length; j++) {
        print(plans[0].Meals[i].Foods[j].unit);
        print(plans[0].Meals[i].Foods[j].namber);
        print(plans[0].Meals[i].Foods[j].name);
      }
    }
  }
  print("ddddddddddddddddddddddddd  plans list is fill");
  List<Plane> plansforsend=new List();
  List<Meal> mealsforsend=new List();
  List<Food> foodsforsend=new List();
  for(int i=0;i<plans.length;i++){

    for(int j=0;j<plans[i].Meals.length;j++){

      for(int k=0;k<plans[i].Meals[j].Foods.length;k++) {
        Food foodd = new Food(
          plans[i].Meals[j].Foods[k].name,
          plans[i].Meals[j].Foods[k].namber,
          plans[i].Meals[j].Foods[k].unit,
        );
        foodsforsend.add(foodd);
      }
        print(foodsforsend.length);
      Meal meall=new Meal(plans[i].Meals[j].name,foodsforsend);
      mealsforsend.add(meall);
      print(mealsforsend.length);
      print(mealsforsend[0].name);
    }
   Plane planee=new Plane(plans[i].name, plans[i].days, mealsforsend, plans[i].des);
    mealsforsend.clear();
    plansforsend.add(planee);
  }
  return plansforsend;
}


Future<String> SendPlanFood(url) async {

  print(jsonEncode({"fordays":"${Kelid.getter("fordays")}","plans":fillFoodPlan()}));
  String token=await getToken();
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.headers.set('token', token);
  request.add(utf8.encode(jsonEncode({"fordays":Kelid.getter("fordays"),"plans":fillFoodPlan()})));
  HttpClientResponse response = await request.close();
  var reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  print(reply);
  print(response.statusCode.toString());
  return response.statusCode.toString();
}


*/
