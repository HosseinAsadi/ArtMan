import 'dart:convert';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:http/http.dart' as http;

class Moves{
  final List<Result> result;

  Moves._({ this.result});
  factory Moves.fromJson(Map jsonMap) {
    return new Moves._(
      result : (jsonMap['result'] as List).map((i) => Result.fromJson(i)).toList(),

    );
  }
}

class Result{
  final String fa;
  final String en;
  final String description;
  final String videoURL;
  final String id;
  final int exercise;
  final int muscles;
  final int equipment;

  Result._({this.id, this.fa,this.equipment,this.muscles,this.exercise,this.en,this.description,this.videoURL});
  factory Result.fromJson(Map jsonMap) {
    return new Result._(
       fa: jsonMap['fa'] ,
       en: jsonMap['en'] ,
       description: jsonMap['description'] ,
       videoURL: jsonMap['videoURL'] ,
       exercise: jsonMap['exercise'] ,
      muscles : jsonMap['muscles'] ,
       equipment: jsonMap['equipment'] ,
      id: jsonMap['_id'] ,

    );
  }
}

Future<Moves> fetchMoves(url) async {
  Moves information;
  String token=await getToken();
  final response = await http.get(url,headers: {"token":token});
  if (response.statusCode == 200) {
    print("connection to fetch categories is ok");
    var list = (json.decode(response.body));
    information = Moves.fromJson(list);
    return information;
  } else {
    throw Exception('Failed to load countreis');
  }
}