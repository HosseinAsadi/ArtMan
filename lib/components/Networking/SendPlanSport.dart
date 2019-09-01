import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:art_man/components/Utility/SharedPreferences.dart';







/*
 addElement(){
  Options options=new Options("repeat","second");
  Moves movess=new Moves("done", "moveid", options.TojsonData());
  moves.add(movess.TojsonData());

  PlanSporT planSporT=new PlanSporT("name", moves,SuperSets);
  Sessins.add(planSporT.TojsonData());
 }
Future<String> SendPlanSport(url,json) async {
  addElement();
HttpClient httpClient = new HttpClient();
HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
request.headers.set('content-type', 'application/json');
request.add(utf8.encode(json));
HttpClientResponse response = await request.close();
var reply = await response.transform(utf8.decoder).join();
httpClient.close();
print(reply);
print(response.statusCode.toString());
return response.statusCode.toString();
}


class PlanSporT {
 String name;
 List<Map> moves;
 List<Map> superSets;
 PlanSporT(this.name,this.moves,this.superSets);
 Map<String, dynamic> TojsonData() {
  var map = new Map<String, dynamic>();
  map["moves"] = moves;
  map["name"] = name;
  map["superSets"] = superSets;
  return map;
 }
}

class Moves {
 String move_id;
 String done;
 Options options;
 Moves(this.done,this.move_id,this.options);
 Map<String, dynamic> TojsonData() {
  var map = new Map<String, dynamic>();
  map["done"] = done;
  map["move_id"] = move_id;
  map["options"] = options;
  return map;
 }
}

class Options {
 String repeat;
 String second;
 Options(this.repeat,this.second);
 Map<String, dynamic> TojsonData() {
  var map = new Map<String, dynamic>();
  map["repeat"] = repeat;
  map["seconds"] = second;
  return map;
 }
}

class SuperSetss {
 String repeat;
 String second;
 SuperSetss(this.repeat,this.second);
 Map<String, dynamic> TojsonData() {
  var map = new Map<String, dynamic>();
  map["repeat"] = repeat;
  map["seconds"] = second;
  return map;
 }
}
*/

/*
class PlanSporT {
  String name;
  List<Map> moves;
  List<Map> superSets;

  Map<String, dynamic> toJson() {
    return {
      "moves": moves,
      "name" : name,
      "superSets" : superSets,
    };
  }
}

class Moves {
  String move_id;
  String done;
  Options options;
  Map<String, dynamic> toJson() {
    return {
    "done" : done,
    "move_id" : move_id,
    "options" : options
  };
  }
}

class Options {
  String repeat;
  String second;

  Map<String, dynamic> toJson() {
    return {
      "repeat": repeat,
      "seconds": second
    };
  }
}

class SuperSetss {
  String repeat;
  String second;
  Map<String, dynamic> toJson() {
    return {
      "repeat": repeat,
      "seconds": second,
    };
  }
}*/

/*List<Tools> toolsFromJson(String str) => new List<Tools>.from(json.decode(str).map((x) => Tools.fromJson(x)));

String toolsToJson(List<Tools> data) => json.encode(new List<dynamic>.from(data.map((x) => x.toJson())));*/
List<SuperSets> SuperSetss=new List();//[[],[]]
Options options=new Options();
List<Moves> movess=new List();
Moves _moves=new Moves();
Session session=new Session();
List<Session> sessions=new List();



class SuperSets{
  List<String> supersetmoves;//[]
}
class Moves{
 String move_id;
 int done;
 Options options;
}
class Options{
  String set;
  String repeat;
  String seconds;
}

class Session{
  String name;
  List<Moves> moves;
  List<SuperSets> supersets;
}

getOptions(){

 options.seconds="23";
 options.set="5";
 options.repeat="10";
 _moves.done=1;
 _moves.move_id="15212154";
 _moves.options=options;
 movess.add(_moves);
 session.name="حرکت ورزشی نام";
 session.moves=movess;
 session.supersets=SuperSetss;
 sessions.add(session);

}


getjson(){
  getOptions();
  OptionTojson();
  Movestojson();
 print(Movestojson()) ;
 print(SessionToJson()) ;
}


 String OptionTojson() {
Map<String, dynamic> map() =>
{
'repeat': options.repeat,
'set': options.set,
'seconds': options.seconds,

};
String result = jsonEncode(map());
return result;
}

String Movestojson() {
  List<Map<String, dynamic>> x = movess
      .map((f) =>
  {'move_id': f.move_id, 'done': f.done,'options':json.decode(OptionTojson())})
      .toList();

  String result = jsonEncode(x);
  return result;
}

String SessionToJson() {
  List<Map<String, dynamic>> x = sessions
      .map((f) =>
  {'name': f.name, 'moves':json.decode(Movestojson()),'superSets':json.decode(jsonEncode(SuperSetss))})
      .toList();
  Map<String, dynamic> map() => {'sessions': x};
  String result = jsonEncode(map());
  return result;
}

Future<String> SendPlanSport(url,json) async {
  getjson();
  SessionToJson();
  String token=await getToken();
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.headers.set('token', token);
  request.add(utf8.encode(jsonEncode(SessionToJson())));
  HttpClientResponse response = await request.close();
  var reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  print(reply);
  print(response.statusCode.toString());
  return response.statusCode.toString();
}


