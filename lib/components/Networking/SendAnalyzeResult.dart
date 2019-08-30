import 'dart:convert';
import 'dart:io';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/AbnormalcyProblems.dart';
import 'package:art_man/components/Utility/DigestionProblems.dart';
import 'package:art_man/components/Utility/Goals.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Utility/Sicks.dart';
import 'package:art_man/components/Utility/Tools.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
class AnalyzeData {
  String username;

 Future<File> getimageFile(text)async{
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/$text.png");
  }
 Future<String> getUserName()async{

      return await getusername();
  }
  gettype()async{

    return await gettype();
  }

  updateSicks(){
    for(int i=0;i<sickLength();i++){
      Sick sick=getSick(i);
      sick.name=sick.name;
      sick.description=Kelid.getter(sick.name);
      sick.selection=true;
      updateSick(i,sick);
    }
  }
  updategoals(){
   int size=goalLength();
   for(int i=0;i<size;i++){
     Goal goal=getGoal(i);
     goal.name=goal.name;
     goal.description=Kelid.getter(goal.name);
     goal.selection=true;
     updategoal(i,goal);
   }

  }

  getJsonList(Sicks){
   for(int i=0;i<10;i++){

   }
  }

  Future<int> uploader(teacher) async {
    Response response;
    String username=await getUserName();

    Dio dio = new Dio();
    updategoals();
    updateSicks();
    Strings strings=new Strings();

    FormData formData = new FormData.from({

      "hip":Kelid.getter("aroundLaver"),
      "neck": Kelid.getter("aroundNeck"),
      "arm_close":Kelid.getter("aroundArmClose"),
      "fore":Kelid.getter("aroundSaed"),
      "chest":Kelid.getter("aroundChest"),
      "thigh":Kelid.getter("aroundLeg"),
      "delt":Kelid.getter("widthComb"),
      "height":Kelid.getter("tall"),
      "weight":Kelid.getter("weight"),
      "pal": 1.2,//Kelid.getter(""),
      "wrist":Kelid.getter("aroundWrist"),
      "waist":Kelid.getter("waist"),
      "desGoal":Kelid.getter("desGoal"),
      "blood_Group":Kelid.getter("bloodGroup"),
      "around_arm_free":Kelid.getter("aroundArmFree"),
      "calf":Kelid.getter("leg"),
      "age": Kelid.getter("age"),
      "sex": Kelid.getter("sex")=="زن"?1:0,

      "business":Kelid.getter("business"),
      "number_day_work":Kelid.getter("number day work"),
      "total_time_work":Kelid.getter("total time work"),
      "from_times_eat":Kelid.getter("from times eat"),
      "to_times_eat":Kelid.getter("to times eat"),
      "from_times_exit":Kelid.getter("from times exit"),
      "to_times_exit":Kelid.getter("to times exit"),
      "hours_sleap":Kelid.getter("hours sleap"),
      "hours_aweak":Kelid.getter("hours aweak"),
      "alergy":Kelid.getter("alergy"),
      "alrzydes":Kelid.getter("alrzydes"),
      "digestiondes":Kelid.getter("digestiondes"),
      "abnormalydes":Kelid.getter("abnormalydes"),
      "fieldstd":Kelid.getter("fieldstd"),
      "extractafter":Kelid.getter("extractafter"),
      "extractbefor":Kelid.getter("extractbefor"),
      "extractin":Kelid.getter("extractin"),
      "extractday":Kelid.getter("extractday"),
      "extracttime":Kelid.getter("extracttime"),
      "extracthours":Kelid.getter("extracthours"),
      "fieldstddes":Kelid.getter("fieldstddes"),
      "checkupdes":Kelid.getter("checkupdes"),

      "digestion":getDigestions(),//list
      "abnormalcy":getAbnormalacys(),//list

      "tools": jsonEncode(getAllTools().map((e) => e.toJson()).toList()),//list

      "sicks":jsonEncode(getAllSicks().map((e) => e.toJson()).toList()),//list

      "goals" :jsonEncode(getAllGoals().map((e) => e.toJson()).toList()),//list

      "sicksdescriptiontotal": Kelid.getter("seak description"),
      "goal_description": Kelid.getter("goal description"),

      "front": new UploadFileInfo(await getimageFile("عکس از جلو"),"عکس از جلو.png" ,
          contentType: ContentType('image', 'png')),
      "back": new UploadFileInfo(await getimageFile("عکس از پشت"), "عکس از پشت.png",
          contentType: ContentType('image', 'png')),
      "beside": new UploadFileInfo(await getimageFile("عکس از پهلو"), "عکس از پهلو.png",
          contentType: ContentType('image', 'png')),
      "checkup": new UploadFileInfo(await getimageFile("ارسال تصویر"), "ارسال تصویر.png",
          contentType: ContentType('image', 'png')),

    });

    response = await dio.post("${strings.baseurl}/analyze/$username/${Kelid.getter("teacherid")}", data: formData);
    print(response.statusCode);
    return response.statusCode;
  }
}






/*
StringToolToObject(data){
  String myJSON = data;

  final List parsedList = json.decode(myJSON);

  tools = parsedList.map((val) =>  Tool.fromJson(val)).toList();

}

StringGoalToObject(data){
  String myJSON = data;

  final List parsedList = json.decode(myJSON);

  goals = parsedList.map((val) =>  Goal.fromJson(val)).toList();

}



getTools(){

  String sick="";
  for(int i=0;i<tools.length;i++){
    sick+=tools[i].name+ " , ";
  }
  return sick;
}
getGoals(){

  String sick="";
  for(int i=0;i<goals.length;i++){
    sick+=goals[i].name+ " , ";
  }
  return sick;
}*/
