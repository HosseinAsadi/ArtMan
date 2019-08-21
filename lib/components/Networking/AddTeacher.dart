

import 'package:art_man/components/Texts/Strings.dart';
import 'package:dio/dio.dart';

Future<void> AddTeacher(teacherUsername,username)async{

    Response response;
    Dio dio = new Dio();
    Strings strings=new Strings();
    response = await dio.post("${strings.baseurl}/users/addTeacherToProfile/$username/$teacherUsername");
    print("----------> response is  :"+response.toString());
  }

