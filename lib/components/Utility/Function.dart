

import 'dart:convert';

import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Networking/FetchSportPlansOfTeacher.dart';
import 'package:art_man/components/Networking/GetToken.dart';
import 'package:art_man/components/Networking/SendAnalyzeResult.dart';
import 'package:art_man/components/Networking/SendData.dart';
import 'package:art_man/components/Networking/SendPlanSport.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Toast/ShowSnackbar.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/MD5Generator.dart';
import 'package:art_man/components/Utility/SetSex.dart';
import 'package:flutter/material.dart';

import 'GetTeachersList.dart';
import 'Keys.dart';
import 'SharedPreferences.dart';

class Fucntionman{


 Future<int> uploadAnalyze(teacher)async{
    AnalyzeData upload=new AnalyzeData();
    var rslt= await upload.uploader(teacher);
    return rslt;
  }

  Future<Null> signInWork(context)async{
   String type= await gettype();
   Strings strings=new Strings();

   var rslt = await GetLocation.login("${strings.baseurl}/$type/login/${Kelid.getter("username")}/${Hasher.GenerateMd5(Kelid.getter("password"))}");

   if (rslt == "0" ) {
    ShowToast("نام کاربری یا رمز عبور اشتباه است",Colors.red,Colors.white);
   }
   if (rslt == "1") {
     await setsign();
     await setusername();

     await setDate(DateTime.now().toString());
     Navigator.pushNamed(
       context,
       type == "teachers"
           ? '/TeacherProfilePage'
           : "/Profile",
     );
   }

  }

   senderTeacherData()async{
   print("${strings.baseurl}/teachers/addTeacher");
   String result=await Post.apiRequest("${strings.baseurl}/teachers/addTeacher",json.encode(
        { "username" : Kelid.getter("username"),
          "password" : Hasher.GenerateMd5(Kelid.getter("password").toString()),
          "first_name" : Kelid.getter("first_name"),
          "last_name" : " ",
          "country" : Kelid.getter("country"),
          "city" : Kelid.getter("city"),
          "phone" : Kelid.getter("phone"),
        }));
   return result;
  }

  Future<String> senderStudentData()async{
    String result=await Post.apiRequest("${strings.baseurl}/users/addUser",json.encode(
        { "username" : Kelid.getter("username"),
          "password" : Hasher.GenerateMd5(Kelid.getter("password").toString()),
          "first_name" :  Kelid.getter("first_name"),
          "last_name" : " ",
          "country" : Kelid.getter("country"),
          "city" : Kelid.getter("city"),
          "phone" :  Kelid.getter("phone"),
          "sex" : SetSex.sex(Kelid.getter("sex").toString())
        }));
    return result;
  }

}
Future<TeacherPlansList>  plansOfTeacher()async{
  return await FetchPlansOfTeacher();

}

saveOptions(){

  Optionss option=new Optionss();
  print("156");
  option.des=Kelid.getter("desmorabi");
  option.rm_one=Kelid.getter("RM1");
  option.tempo=Kelid.getter("tempo");
  option.exersiceSystem=Kelid.getter("practicSystem");
  option.meter=Kelid.getter("metr");
  option.colory=Kelid.getter("calary");
  option.second=Kelid.getter("second");
  option.repeat=Kelid.getter("repeat");
  option.rest=Kelid.getter("rest");
  option.set=Kelid.getter("set");
  print("options filled and second is  "+ option.second.toString());
  classes[getclassroom()-1].moves[getmoveindex()].options=option;
  classes[getclassroom()-1].moves[getmoveindex()].optionfilled=true;
}

checkEveryThingForPlanIsOk(){
  for(int i=0;i<classes.length;i++){
    for(int j=0;j<classes[i].moves.length;j++){
      if(classes[i].moves[j].optionfilled==false){
        return false;
      }
    }
  }
  return true;
}

SaveAsPattern()async{
  Strings strings=new Strings();
 String username=await getusername();
 var resp= await SendPlanSport("${strings.baseurl}/sportPlan/addSportPlanT/tmpname/$username");
 print(resp);
}