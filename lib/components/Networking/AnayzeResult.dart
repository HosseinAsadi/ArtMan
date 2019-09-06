

import 'dart:convert';

class AnalyzeAnswers {
  final List<Result> result;
  AnalyzeAnswers._({ this.result});
  factory AnalyzeAnswers.fromJson(Map jsonMap) {
    return new AnalyzeAnswers._(
        result : (jsonMap['result'] as List).map((i) => Result.fromJson(i)).toList()
    );
  }
}
class Result{
  final String create_date;
  final String modify_date;
  final String user;
  final String teacher;
  final List<String> anatomyPicture;
  final Awnser awnsers;
  final Outcome outcomes;

  Result._({this.create_date,this.modify_date,this.user,
  this.teacher,this.anatomyPicture,this.awnsers,this.outcomes});
  factory Result.fromJson(Map jsonMap) {
    return new Result._(
        create_date: jsonMap['create_date'],
        modify_date: jsonMap['modify_date'],
        user: jsonMap['user'],
        teacher: jsonMap['teacher'],
        anatomyPicture:  (jsonMap['anatomy'].cast<String>()),
        awnsers : Awnser.fromJson( jsonMap['awnsers']),
        outcomes : Outcome.fromJson( jsonMap['result']),

    );
  }
}
class Awnser{
  final String hip;
  final String neck;
  final String arm_close;
  final String fore;
  final String chest;
  final String thigh;
  final String delt;
  final String height;
  final String weight;
  final String pal;
  final String wrist;
  final String waist;
  final String desGoal;
  final String blodd_Group;
  final String around_arm_free;
  final String calf;
  final String age;
  final String sex;

  final String business;
  final String number_day_work;
  final String total_time_work;
  final String from_times_eat;
  final String to_times_eat;
  final String from_times_exit;
  final String to_times_exit;
  final String hours_sleap;
  final String hours_aweak;
  final String alergy;
  final String alrzydes;
  final String digestiondes;
  final String abnormalydes;
  final String fieldstd;
  final String extractafter;
  final String extractbefor;
  final String extractin;
  final String extractday;
  final String extracttime;
  final String extracthours;
  final String fieldstddes;
  final String checkupdes;
  final String sicksdescriptiontotal;
  final String goal_description;

  final String sicks;
  final String tools;
  final String goals;

  final String digestion;
  final String abnormalcy;

  Awnser._({ this.hip,this.neck,this.arm_close,this.fore,
  this.chest,this.thigh,this.delt,this.height,
  this.weight,this.pal,this.waist,this.wrist,
  this.desGoal,this.blodd_Group,this.around_arm_free,
  this.calf,this.sex,this.age,this.tools,this.goals,this.sicks,this.abnormalydes,
  this.alergy,this.alrzydes,this.business,this.checkupdes,
  this.digestiondes,this.extractafter,this.extractbefor,this.extractday,
  this.extracthours,this.extractin,this.extracttime,this.fieldstd,
  this.fieldstddes,this.from_times_eat,this.from_times_exit,this.abnormalcy,
  this.digestion,this.goal_description,this.hours_aweak,
  this.hours_sleap,this.number_day_work,this.sicksdescriptiontotal,
  this.to_times_eat,this.to_times_exit,this.total_time_work});
  factory Awnser.fromJson(Map jsonMap) {
    return new Awnser._(
      hip: jsonMap['hip'],
      neck: jsonMap['neck'],
      arm_close: jsonMap['arm_close'],
      around_arm_free: jsonMap['around_arm_free'],
      fore: jsonMap['fore'],
      calf: jsonMap['calf'],
      chest: jsonMap['chest'],
      thigh: jsonMap['thigh'],
      desGoal: jsonMap['desGoal'],
      delt: jsonMap['delt'],
      height: jsonMap['height'],
      weight: jsonMap['weight'],
      pal: jsonMap['pal'],
      wrist: jsonMap['wrist'],
      waist: jsonMap['waist'],
      blodd_Group: jsonMap['blood_Group'],
      age: jsonMap['age'],
      sex: jsonMap['sex'],
      alrzydes : jsonMap['alrzydes'],
      sicksdescriptiontotal: jsonMap['sicksdescriptiontotal'],
     sicks :jsonMap['sicks'],
      extracthours : jsonMap['extracthours'],
     from_times_exit : jsonMap['from_times_exit'],
      from_times_eat: jsonMap['from_times_eat'],
      fieldstddes: jsonMap['fieldstddes'],
     fieldstd : jsonMap['fieldstd'],
     extractbefor : jsonMap['extractbefor'],
     extractafter : jsonMap['extractafter'],
     digestiondes : jsonMap['digestiondes'],
     number_day_work : jsonMap['number_day_work'],
     goal_description : jsonMap['goal_description'],
     extractday : jsonMap['extractday'],
     checkupdes : jsonMap['checkupdes'],
     abnormalydes : jsonMap['abnormalydes'],
     hours_sleap : jsonMap['hours_sleap'],
     hours_aweak : jsonMap['hours_aweak'],
     total_time_work : jsonMap['total_time_work'],
     extracttime : jsonMap['extracttime'],
     extractin : jsonMap['extractin'],
     alergy : jsonMap['alergy'],
     to_times_exit : jsonMap['to_times_exit'],
     to_times_eat : jsonMap['to_times_eat'],
      business: jsonMap['business'],
     goals : jsonMap['goals'],
     tools : jsonMap['tools'],
      abnormalcy : jsonMap['abnormalcy'],
      digestion : jsonMap['digestion']

    );
  }
}

class Outcome{
  final double bai;
  final double bf;
  final double bmi;
  final int hr;
  final int ibw;
  final int tee;
  final double whr;
  final Ideal ideals;
  Outcome._({ this.bai,this.bf,this.bmi,this.hr,
  this.ibw,this.tee,this.whr,this.ideals});
  factory Outcome.fromJson(Map jsonMap) {
    return new Outcome._(
      bmi: jsonMap['bmi'],
      bf: jsonMap['bf'],
      bai: jsonMap['bai'],
      ibw: (jsonMap['ibw'].toInt()),
      tee: jsonMap['tee'].toInt(),
      whr: jsonMap['whr'].toDouble(),
      hr: jsonMap['hr'].toInt(),
      ideals : Ideal.fromJson( jsonMap['ideal']),


    );
  }

}
class Ideal{
  final int weight;
  final double neck;

  final int fore;
  final int waist;
  final double chest;
  final int hip;
  final double thigh;
  final double calf;
  final double delt;
  Ideal._({ this.waist,this.weight,this.delt,
  this.thigh,this.chest,this.calf,
  this.fore,this.neck,this.hip});
  factory Ideal.fromJson(Map jsonMap) {
    return new Ideal._(
      weight: jsonMap['weight'].toInt(),
      neck: jsonMap['neck'].toDouble(),
      //arm: jsonMap['arm'].toDouble(),
      fore: jsonMap['fore'].toInt(),
      calf: jsonMap['calf'].toDouble(),
      waist: jsonMap['waist'].toInt(),
      chest: jsonMap['chest'].toDouble(),
      hip: jsonMap['hip'].toInt(),
      thigh: jsonMap['thigh'].toDouble(),
      delt: jsonMap['delt'].toDouble(),
    );
  }

}

StringJsonToObject(data){
  if(data==null){
     data="[{\"name\":\"ندارد\",\"selection\":true,\"description\":\"\"}]" ;
  }
  var json = jsonDecode(data);
  return (json as List);

}
StringgoalToObject(data){
  if(data==null){
    data="[{\"name\":\"ندارد\",\"selection\":true,\"description\":\"\"}]" ;
  }
  var json = jsonDecode(data);
  return (json as List);

}
StringtoolToObject(data){
  if(data==null){
    data="[{\"name\":\"ندارد\",\"selection\":true,\"description\":\"\"}]" ;
  }
  var json = jsonDecode(data);
  return (json as List);

}
class Sick {
  final String name;
  final String description;
  Sick._({ this.name, this.description});

  factory Sick.fromJson(Map jsonMap) {
    return new Sick._(
      name: jsonMap['name'],
      description: jsonMap['description'],
    );
  }
}

class Goal {
  final String name;
  final String description;
  Goal._({ this.name, this.description});

  factory Goal.fromJson(Map jsonMap) {
    return new Goal._(
      name: jsonMap['name'],
      description: jsonMap['description'],
    );
  }
}

class Tool {
  final String name;

  Tool._({ this.name});

  factory Tool.fromJson(Map jsonMap) {
    return new Tool._(
      name: jsonMap['persianName'],

    );
  }
}




