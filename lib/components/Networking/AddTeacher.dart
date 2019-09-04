
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:art_man/components/Texts/Strings.dart';
import 'package:dio/dio.dart';

Future<String> AddTeacher(teacherUsername,username)async{



    Strings strings=new Strings();
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse("${strings.baseurl}/users/addTeacherToProfile/$username/$teacherUsername"));

        HttpClientResponse response = await request.close();
    print(response.statusCode.toString());
    return response.statusCode.toString();

  }


Future<void> deleteTeacher(teacherUsername,username)async{

    Response response;
    Dio dio = new Dio();
    Strings strings=new Strings();
    response = await dio.put("${strings.baseurl}/users/delTeacherFromProfile/$username/$teacherUsername");
    print("----------> response is  :"+response.toString());
}

