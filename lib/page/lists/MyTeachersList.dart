import 'package:art_man/components/Networking/FetchStudentProfileInfo.dart';
import 'package:art_man/components/Networking/FetchTeachersList.dart';
import 'package:art_man/components/Networking/getListOfStudents.dart';
import 'package:art_man/components/Utility/GetTeachersList.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Utility/StdInfo.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/lists/LisviewGenerator.dart';
import 'package:flutter/material.dart';

class MyTeachers extends StatefulWidget {
  @override
  _StateMyTeachers createState() => _StateMyTeachers();
}

class _StateMyTeachers extends State<MyTeachers> {
  String username;
  List<TeacherInfo> myTeachers=new List();
  bool complete=false;

  getStdInfo()async{
    String usernamee=await getusername();
    StdProfile info=await StdInfo(usernamee);
    TeachersList teachers=await GetTeachersList();
    setState(()  {
      username=usernamee;

      for(int i=0;i<info.result.length;i++){
        if(info.result[i].username==usernamee)
        for(int j=0;j<info.result[i].MyTeachers.length;j++) {
          print(info.result[i].MyTeachers.length);

          if (info.result[i].MyTeachers[j].access) {
            for (int k = 0; k < teachers.result.length; k++) {
              if (teachers.result[k].username ==
                  info.result[i].MyTeachers[j].username) {
                TeacherInfo teacher = new TeacherInfo();
                teacher.username = info.result[i].MyTeachers[j].username;
                teacher.name = teachers.result[k].firstname;
                teacher.imageprofile = teachers.result[k].profilephoto;
                myTeachers.add(teacher);
              }
            }
          }
        }
      }
      complete = true;
    });
  }
  getUsersList()async{
    String username=await getusername();


  }

@override
  void initState() {
    super.initState();
    getStdInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: complete? myTeachers.length==0?Center(
        child: Container(child: Text("هیچ مربی برای شما یافت نشد"),),
      ):Container(
        height: MediaQuery.of(context).size.height,
        child: ListViewGenerator(myTeachers),
      ):CircularProgressIndicator(),
    );
  }
}



