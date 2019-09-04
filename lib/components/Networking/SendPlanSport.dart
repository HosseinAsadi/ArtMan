import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';

List<SuperSets> SuperSetss=new List();//[[],[]]






class Session{

  String name;
  List<Moves> moves;
  List<SuperSets> supersets;

  Session(this.name,this.moves,this.supersets);
  Session.fromJson(Map<String, dynamic> json) :
        name = json["name"],
        moves = (json['moves'] as List).map((i) => Moves.fromJson(i)).toList(),
        supersets = (json['supersets'] as List).map((i) => SuperSets.fromJson(i)).toList();
  Map<String, dynamic> toJson() => {

    'name': name,
    'moves': moves,
    'supersets': supersets
  };

}
class SuperSets{
  List<String> supersetmoves;//[]

  SuperSets(this.supersetmoves);
  SuperSets.fromJson(Map<String, dynamic> json) :
        supersetmoves = json["supersetmoves"].cast<String>();
  Map<String, dynamic> toJson() => {

    'supersetmoves': supersetmoves,
  };

}
class Moves{

  String move_id;
  int done;
  Options options;

  Moves(this.move_id,this.done,this.options);
  Moves.fromJson(Map<String, dynamic> json) :
        move_id = json["move_id"],
        done = json["done"],
        options = Options.fromJson(json["options"]);

    Map<String, dynamic> toJson() => {
    'move_id': move_id,
    'done': done,
    'options': options
  };

}
class Options{

 final String rest;
 final String set;
 final String repeat;
 final String second;
 final String colory;
 final String meter;
 final String exersiceSystem;
 final String tempo;
 final String rm_one;
 final String des;

  Options(this.rest,this.des,this.rm_one,this.tempo,
      this.exersiceSystem,this.meter,this.colory,
      this.second,this.repeat,this.set);
  Options.fromJson(Map<String, dynamic> json) :
        rest = json["rest"],
        des = json["des"],
        rm_one = json["rm_one"],
        tempo = json["tempo"],
        exersiceSystem = json["exersiceSystem"],
        meter = json["meter"],
        colory = json["colory"],
        second = json["second"],
        repeat = json["repeat"],
        set = json["set"];
  Map<String, dynamic> toJson() => {
    'repeat': repeat,
    'set': set,
    'second': second,
    'colory': colory,
    'meter': meter,
    'exersiceSystem': exersiceSystem,
    'tempo': tempo,
    'rm_one': rm_one,
    'des': des,
    'rest': rest,
  };

}


fillPlan(){
  List<Session> sessions=new List();
  List<Moves> movess=new List();
  for(int i=0;i<classes.length;i++){
    for(int j=0;j<classes[i].moves.length;j++){

      Options options=new Options(
          classes[i].moves[j].options.rest,
          classes[i].moves[j].options.des,
          classes[i].moves[j].options.rm_one,
          classes[i].moves[j].options.tempo,
          classes[i].moves[j].options.exersiceSystem,
          classes[i].moves[j].options.meter,
          classes[i].moves[j].options.colory,
          classes[i].moves[j].options.second,
          classes[i].moves[j].options.repeat,
          classes[i].moves[j].options.set,
      );

      Moves moves=new Moves("5d53a43a123f1b2c74d82e30",
          12,
          options
      );
      movess.add(moves);
    }
    Session session=new Session("name",movess,SuperSetss);
   sessions.add(session);
  }
  return sessions;
}


Future<String> SendPlanSport(url) async {

  print(jsonEncode({"repeate":"10","sessions":fillPlan()}));
  String token=await getToken();
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
  request.headers.set('content-type', 'application/json');
  request.headers.set('token', token);
  request.add(utf8.encode(jsonEncode({"repeate":Kelid.getter("week_program"),"sessions":fillPlan()})));
  HttpClientResponse response = await request.close();
  var reply = await response.transform(utf8.decoder).join();
  httpClient.close();
  print(reply);
  print(response.statusCode.toString());
  return response.statusCode.toString();
}


