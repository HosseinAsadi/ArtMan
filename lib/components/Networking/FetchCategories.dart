import 'dart:convert';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:http/http.dart' as http;

class Categories{
   final List<Equipment> equipment;
   final List<Exercise> exercise;
   final List<Muscles> muscles;
   Categories._({ this.equipment,this.exercise,this.muscles});
   factory Categories.fromJson(Map jsonMap) {
     return new Categories._(
         exercise : (jsonMap['exercise'] as List).map((i) => Exercise.fromJson(i)).toList(),
         equipment : (jsonMap['equipment'] as List).map((i) => Equipment.fromJson(i)).toList(),
         muscles : (jsonMap['muscles'] as List).map((i) => Muscles.fromJson(i)).toList(),
     );
   }
}

class Equipment{
String en;
String fa;
int id;
Equipment._({ this.en,this.fa,this.id});
factory Equipment.fromJson(Map jsonMap) {
  return new Equipment._(
    en : jsonMap['en'] ,
    fa : jsonMap['fa'] ,
    id : jsonMap['id'] ,

  );
}

}
class Exercise{
String en;
String fa;
int id;

Exercise._({ this.en,this.fa,this.id});
factory Exercise.fromJson(Map jsonMap) {
  return new Exercise._(
    en : jsonMap['en'] ,
    fa : jsonMap['fa'] ,
    id : jsonMap['id'] ,

  );
}
}
class Muscles{
String en;
String fa;
int id;

Muscles._({ this.en,this.fa,this.id});
factory Muscles.fromJson(Map jsonMap) {
  return new Muscles._(
    en : jsonMap['en'] ,
    fa : jsonMap['fa'] ,
    id : jsonMap['id'] ,

  );
}
}

Future<Categories> fetchCategories(url) async {
  Categories information;
  String token=await getToken();
  final response = await http.get(url,headers: {"token":token});
  if (response.statusCode == 200) {
    print("connection to fetch categories is ok");
    var list = (json.decode(response.body));
    information = Categories.fromJson(list);
    return information;
  } else {
    throw Exception('Failed to load countreis');
  }
}