//FoodsPlansOfTeacher

import 'dart:convert';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:http/http.dart' as http;
import 'package:art_man/components/Utility/SharedPreferences.dart';
Future<FoodsPlansOfTeacher> FetchPlansOfTeacher()async{

  FoodsPlansOfTeacher myprograms;
  String usename=await getusername();
  Strings stings=new Strings();
  String token=await getToken();
  print(token);

  final response = await http.get("${stings.baseurl}/foodPlan/getFromTeacher/$usename",headers: {"token":token});
  if (response.statusCode == 200) {
    print("my food planes fetched");
    var list = (json.decode(response.body));
    myprograms = FoodsPlansOfTeacher.fromJson(list);
    return myprograms;
  } else {
    throw Exception('Failed to load countreis');
  }
}

class FoodsPlansOfTeacher{

  final List<Plans> plans;
  final int fordays;
  FoodsPlansOfTeacher._({ this.fordays,this.plans});
  factory FoodsPlansOfTeacher.fromJson(Map jsonMap) {
    return new FoodsPlansOfTeacher._(
      plans : (jsonMap['plans'] as List).map((i) => Plans.fromJson(i)).toList(),
      fordays : (jsonMap['fordays']),
    );
  }
}

class Plans{

  final List<String> days;
  final List<Meals> meals;
  final String name;
  final String desc;

  Plans._({ this.name,this.meals,this.days,this.desc});
  factory Plans.fromJson(Map jsonMap) {
    return new Plans._(
      meals : (jsonMap['meals'] as List).map((i) => Meals.fromJson(i)).toList(),
      name : (jsonMap['name']),
      desc : (jsonMap['desc']),
       days : (jsonMap['days'].cast<String>())
    );
  }
}

class Meals{


  final String title;
  final String subtitle;

  Meals._({ this.title,this.subtitle});
  factory Meals.fromJson(Map jsonMap) {
    return new Meals._(
        title : (jsonMap['title']),
        subtitle : (jsonMap['subtitle']),
    );
  }
}