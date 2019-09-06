
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:dio/dio.dart';

Future<String> AddTeacher(teacherUsername,username)async{



    Strings strings=new Strings();
    String token=await getToken();
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse("${strings.baseurl}/users/addTeacherToProfile/$username/$teacherUsername"));
    print("${strings.baseurl}/users/addTeacherToProfile/$username/$teacherUsername");
    request.headers.set("token", token);

        HttpClientResponse response = await request.close();
    var reply = await response.transform(utf8.decoder).join();
        print(reply);
        print(token);
    print(response.statusCode.toString());
    return response.statusCode.toString();

  }


Future<String> deleteTeacher(teacherUsername,username)async{
    Strings strings=new Strings();
    String token=await getToken();
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.putUrl(Uri.parse("${strings.baseurl}/users/delTeacherFromProfile/$username/$teacherUsername"));
    request.headers.set("token", token);

    HttpClientResponse response = await request.close();
    print(response.statusCode.toString());
    return response.statusCode.toString();


}

