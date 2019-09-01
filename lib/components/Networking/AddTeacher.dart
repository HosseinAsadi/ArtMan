
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:dio/dio.dart';

Future<String> AddTeacher(teacherUsername,username)async{


   String token=await getToken();
    Strings strings=new Strings();
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse("${strings.baseurl}/users/addTeacherToProfile/$username/$teacherUsername"));
    request.headers.set('token', token);
        HttpClientResponse response = await request.close();
    print(response.statusCode.toString());
    return response.statusCode.toString();

  }


Future<void> deleteTeacher(teacherUsername,username)async{
  String token=await getToken();
  Strings strings=new Strings();
  HttpClient httpClient = new HttpClient();
  HttpClientRequest request = await httpClient.putUrl(Uri.parse("${strings.baseurl}/users/delTeacherFromProfile/$username/$teacherUsername"));
  request.headers.set('token', token);
  HttpClientResponse response = await request.close();
  print(response.statusCode.toString());
  return response.statusCode.toString();

}

