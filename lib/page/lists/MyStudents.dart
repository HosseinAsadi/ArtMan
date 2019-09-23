
import 'package:art_man/components/Networking/getListOfStudents.dart';
import 'package:art_man/components/Utility/StudentInfo.dart';

import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/lists/LisviewGenerator.dart';
import 'package:flutter/material.dart';

class MyStudents extends StatefulWidget {


  @override
  _StateMyStudents createState() => _StateMyStudents();
}

class _StateMyStudents extends State<MyStudents> {
  List<TeacherInfo> stdInfo=studentsInfo;
  bool complete=true;

  String username;


  Future<Null> onWillPop() {
    Navigator.pushNamed(context, "/TeacherProfilePage");
  }
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
      body: complete? stdInfo.length==0?Center(
        child: Container(child: Text("هیچ هنرجویی شما را به عنوان مربی انتخاب نکرده است",style:
          TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),),
      ):Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        child: Container(
          margin: EdgeInsets.all(10),
          child: ListViewGenerator(stdInfo),
        )
      ):Center(
        child: CircularProgressIndicator(),
      )
      ,
        ));
  }
}


