

import 'dart:convert';

import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Networking/SendAnalyzeResult.dart';
import 'package:art_man/components/Networking/SendData.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Toast/ShowSnackbar.dart';
import 'package:art_man/components/Toast/ShowToast.dart';
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

  Future<Null> signInWork(_scaffoldKey,context)async{
   String type= await gettype();
   Strings strings=new Strings();

   var rslt = await GetLocation.fetchuser("${strings.baseurl}/$type/login/${Kelid.getter("username")}/${Hasher.GenerateMd5(Kelid.getter("password"))}");

   if (rslt.result.toString() == "0" ) {
    ShowToast("نام کاربری یا رمز عبور اشتباه است",Colors.red,Colors.white);
   }
   if (rslt.result.toString() == "1") {
     await setsign();
     await setusername();
    // await setToken(token);
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
   print(result);
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
    print(result);
    return result;
  }
}