import 'dart:convert';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:http/http.dart' as http;
import 'package:art_man/components/Utility/SharedPreferences.dart';
Future<TeacherPlansList> FetchPlansOfTeacher()async{

  TeacherPlansList myprograms;
  String usename=await getusername();
  Strings stings=new Strings();
  String token=await getToken();
  print(token);

  final response = await http.get("${stings.baseurl}/sportPlan/getFromTeacher/$usename",headers: {"token":token});
  if (response.statusCode == 200) {
    print("my sports plane fetched");
    var list = (json.decode(response.body));
    myprograms = TeacherPlansList.fromJson(list);
    return myprograms;
  } else {
    throw Exception('Failed to load countreis');
  }
}
class TeacherPlansList {
  final List<Session> sessions;
  final String repeate;
  TeacherPlansList._({ this.sessions,this.repeate});
  factory TeacherPlansList.fromJson(Map jsonMap) {
    return new TeacherPlansList._(
        sessions : (jsonMap['sessions'] as List).map((i) => Session.fromJson(i)).toList(),
      repeate : (jsonMap['repeate']),
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

