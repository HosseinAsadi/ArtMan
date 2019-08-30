
import 'package:art_man/components/Networking/FetchStudentProfileInfo.dart';
import 'package:art_man/components/Networking/FetchTeachersList.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';

import 'GetTeachersList.dart';
import 'StdInfo.dart';
import 'TeacherInfoForSearch.dart';

Future<List<TeacherInfo>> getStdInfo()async{
  print("getStdInfo  runnned");
  String usernamee=await getusername();
  print("getStdInfo  runnned");

  StdProfile info=await StdInfo(usernamee);
  TeachersList teachers=await GetTeachersList();
  List<TeacherInfo> myTeachers=new List();
    print(teachers.result.length);
    for(int i=0;i<info.result.length;i++){
      if(info.result[i].username==usernamee)
        for(int j=0;j<info.result[i].MyTeachers.length;j++)
          if(info.result[i].MyTeachers[j].access){
            for(int k=0;k<teachers.result.length;k++){
              if(teachers.result[k].username==info.result[i].MyTeachers[j].username){
                TeacherInfo teacher=new TeacherInfo();
                teacher.username=info.result[i].MyTeachers[j].username;
                print("................."+teacher.username);
                teacher.name=teachers.result[k].firstname;
                teacher.imageprofile=teachers.result[k].profilephoto ;
                myTeachers.add(teacher);
              }
            }
          }
    }
    return myTeachers;

}