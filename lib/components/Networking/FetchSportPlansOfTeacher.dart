import 'dart:convert';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:http/http.dart' as http;
import 'package:art_man/components/Utility/SharedPreferences.dart';
Future<TeacherPlansList> fetchSportPlan(username,type)async{

  TeacherPlansList myprograms;

  Strings stings=new Strings();
  String token=await getToken(true);
  print(token);
print("${stings.baseurl}/sportPlan/$type/$username");
  final response = await http.get("${stings.baseurl}/sportPlan/$type/$username",headers: {"token":token});
  if (response.statusCode == 200) {
    print("my sports plane fetched");
    var list = (json.decode(response.body));
    myprograms = TeacherPlansList.fromJson(list);
    return myprograms;
  } else {
    throw Exception('Failed to load countreis');
  }
}
class TeacherPlansList{
  final List<ResultSport> result;
  TeacherPlansList._({ this.result});
  factory TeacherPlansList.fromJson(Map jsonMap) {
    return new TeacherPlansList._(
      result : (jsonMap['result'] as List).map((i) => ResultSport.fromJson(i)).toList(),

    );
  }
}
class ResultSport {

  final List<Session> sessions;
  final int repeate;
  final String create_date;
  final String teacher;
  final String user;
  final String template_name;

  ResultSport._({this.template_name, this.sessions,this.repeate,this.create_date,this.user,this.teacher});
  factory ResultSport.fromJson(Map jsonMap) {
    return new ResultSport._(
        sessions : (jsonMap['sessions'] as List).map((i) => Session.fromJson(i)).toList(),
        repeate : (jsonMap['repeate']),
      create_date : (jsonMap['create_date']),
      teacher : (jsonMap['teacher']),
      user : (jsonMap['user']),
      template_name : (jsonMap['template_name']),
    );
  }
}

class Session {
  final String name;

  final List<Moves> moves;
  Session._({ this.name,this.moves});
  factory Session.fromJson(Map jsonMap) {
    return new Session._(
        moves : (jsonMap['moves'] as List).map((i) => Moves.fromJson(i)).toList(),
        name : (jsonMap['name']),
    );
  }
}

class Moves {
  final String moves_id;
  final int done;
  final Options options;
  Moves._({ this.options,this.done,this.moves_id});
  factory Moves.fromJson(Map jsonMap) {
    return new Moves._(
        options: Options.fromJson(jsonMap['options'] ),
        done : (jsonMap['done']),
        moves_id : (jsonMap['move_id']),

    );
  }
}

class Options {
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

  Options._({ this.repeat,this.set,this.second,
  this.rest,this.colory,this.des,this.exersiceSystem,this.meter,this.rm_one,
  this.tempo});
  factory Options.fromJson(Map jsonMap) {
    return new Options._(
        rest : (jsonMap['rest']),
        set : (jsonMap['set']),
        repeat : (jsonMap['repeat']),
        second : (jsonMap['second']),
        colory : (jsonMap['colory']),
        meter : (jsonMap['meter']),
        exersiceSystem : (jsonMap['exersiceSystem']),
        tempo : (jsonMap['tempo']),
        rm_one : (jsonMap['rm_one']),
        des : (jsonMap['des']),

    );
  }
}
int level=1,levele2=1;
int resulteindex=0;
int planSportindex=0;
int weekindex=0;
int classroomindex=0;
int progress=0;

