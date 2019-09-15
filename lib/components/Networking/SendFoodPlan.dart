import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';

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
List<Plane> plansforsend=new List();

fillFoodPlan()async{

 int mealTempIndex=0;
 int foodTempindex=0;



  List<Meal> tempMeals=new List();
  List<Food> tempFoods=new List();


  for(int i=0;i<plans.length;i++){//fill every plan

    for(int j=0;j<plans[i].Meals.length;j++){//fill meals of a plan

      for(int k=0;k<plans[i].Meals[j].Foods.length;k++) {//fill food of a meal
        Food foodd = new Food(
          plans[i].Meals[j].Foods[k].name,
          plans[i].Meals[j].Foods[k].namber,
          plans[i].Meals[j].Foods[k].unit,
        );
        tempFoods.add(foodd);
      }


      Meal meall=new Meal(plans[i].Meals[j].name,tempFoods.sublist(foodTempindex, tempFoods.length));
      foodTempindex+=  plans[i].Meals[j].Foods.length;
      tempMeals.add(meall);
    }
   Plane planee=new Plane(plans[i].name, plans[i].days, tempMeals.sublist(mealTempIndex, tempMeals.length), plans[i].des);
    mealTempIndex+=plans[i].Meals.length;
    plansforsend.add(planee);
  }
  print(jsonEncode({"fordays":"${Kelid.getter("fordays")}","plans":plansforsend}));
  return plansforsend;
}


Future<String> SendPlanFood(url) async {
  Strings strings=new Strings();
  String username= await getusername();
  fillFoodPlan();
  String token=await getToken();
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.headers.set('token', token);
  request.add(utf8.encode(jsonEncode({"fordays":Kelid.getter("fordays"),"plans":plansforsend})));
  HttpClientResponse response = await request.close();
  var reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  print(reply);
  print(response.statusCode.toString());
  plansforsend.clear();
  return response.statusCode.toString();
}


