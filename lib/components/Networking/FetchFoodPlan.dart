import 'dart:convert';

import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:http/http.dart' as http;

Future<MyPlan> FetchFoodPlan(username,userType) async {
  MyPlan myplan;
  Strings stings = new Strings();
  String token = await getToken();
  print(token);
print("${stings.baseurl}/foodPlan/$userType/$username");
  final response = await http.get(
      "${stings.baseurl}/foodPlan/$userType/$username",
      headers: {"token": token});
  if (response.statusCode == 200) {
    print("my Food plane fetched");
    var list = (json.decode(response.body));
    myplan = MyPlan.fromJson(list);
    return myplan;
  } else {
    throw Exception('Failed to load countreis');
  }
}

class MyPlan {
  List<FoodResult> result;

  MyPlan._({this.result});

  factory MyPlan.fromJson(Map jsonMap) {
    return new MyPlan._(
      result:
          (jsonMap['result'] as List).map((i) => FoodResult.fromJson(i)).toList(),
    );
  }
}

class FoodResult {
  String forday;
  String template_name;
  String modify_date;
  String create_date;
  String user;
  String teacher;
  List<Plane> plans;

  FoodResult._(
      {this.forday,
      this.plans,
      this.user,
      this.create_date,
      this.teacher,
      this.modify_date,
      this.template_name});

  factory FoodResult.fromJson(Map jsonMap) {
    return new FoodResult._(
      forday: jsonMap['forday'],
      user: jsonMap['user'],
      template_name: jsonMap['template_name'],
      create_date: jsonMap['create_date'],
      modify_date: jsonMap['modify_date'],
      teacher: jsonMap['teacher'],
      plans: (jsonMap['plans'] as List).map((i) => Plane.fromJson(i)).toList(),
    );
  }
}

class Plane {
  String name;
  String desc;
  List<String> days;
  List<Meal> meals;

  Plane._({this.name, this.desc, this.meals, this.days});

  factory Plane.fromJson(Map jsonMap) {
    return new Plane._(
      name: jsonMap['name'],
      desc: jsonMap['desc'],
      days: (jsonMap['days'].cast<String>()),
      meals: (jsonMap['meals'] as List).map((i) => Meal.fromJson(i)).toList(),
    );
  }
}

class Meal {
  String name;
  List<Khorak> khoraks;

  Meal._({this.name, this.khoraks});

  factory Meal.fromJson(Map jsonMap) {
    return new Meal._(
      name: jsonMap['name'],
      khoraks:
          (jsonMap['foods'] as List).map((i) => Khorak.fromJson(i)).toList(),
    );
  }
}

class Khorak {
  String eat;
  String number;
  String unit;

  Khorak._({this.eat, this.number, this.unit});

  factory Khorak.fromJson(Map jsonMap) {
    return new Khorak._(
      eat: jsonMap['eat'],
      number: jsonMap['number'],
      unit: jsonMap['unit'],
    );
  }
}
int list=1;
int resultindex=0,planindex=0,mealindex=0,length;