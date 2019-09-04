import 'package:art_man/components/Networking/FetchStudentProfileInfo.dart';
import 'package:art_man/components/Networking/FetchTeachersList.dart';
import 'package:art_man/components/Networking/getListOfStudents.dart';
import 'package:art_man/components/Utility/GetTeachersList.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Utility/StdInfo.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/lists/LisviewGenerator.dart';
import 'package:flutter/material.dart';

class MyStudents extends StatefulWidget {
  List<String> userslist;
  MyStudents({Key key, @required this.userslist}) : super(key: key);

  @override
  _StateMyStudents createState() => _StateMyStudents(userslist);
}

class _StateMyStudents extends State<MyStudents> {
  List<String> userslist;
  bool complete=false;
  _StateMyStudents(this.userslist);
  String username;
  List<TeacherInfo> studentsInfo=new List();

  getTeacherInfo()async{
    UsersList usersList=await fetchUsersList();
    setState(() {
      for(int i=0;i<usersList.result.length;i++){
        for(int j=0;j<userslist.length;j++){
          if(usersList.result[i].username==userslist[j])
          {
            TeacherInfo studentInfo=new TeacherInfo();
            studentInfo.username= usersList.result[i].username;
            studentInfo.name= usersList.result[i].first_name;
            studentInfo.imageprofile= usersList.result[i].profile_photo;
            studentsInfo.add(studentInfo);
          }
        }

      }

      complete=true;
    });

  }


  @override
  void initState() {
    super.initState();
    getTeacherInfo();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: complete? studentsInfo.length==0?Center(
        child: Container(child: Text("هیچ مربی برای شما یافت نشد"),),
      ):Container(
        height: MediaQuery.of(context).size.height,
        child: ListViewGenerator(studentsInfo),
      ):CircularProgressIndicator(),
    );
  }
}


