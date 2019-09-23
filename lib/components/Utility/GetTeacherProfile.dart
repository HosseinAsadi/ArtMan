import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Networking/fetchTeacherProfileInfo.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
TeacherPro teacherPro;
Teacherformation() async  {
String  username = await getusername();
Strings strings=new Strings();


  TeacherProfile info = await GetLocation.fetchProfileTeacher(
      "${strings.baseurl}/teachers/getTeacher/$username");
   fill=true;
   teacherPro=new TeacherPro();

  teacherPro.name = info.result[0].firstname;
  teacherPro.country = info.result[0].country;
  teacherPro.city = info.result[0].city;
  teacherPro.about = info.result[0].about;
  teacherPro.imagename = info.result[0].profilephoto;
  teacherPro.bio = info.result[0].biografi;
  teacherPro.students = info.result[0].users_id;
teacherPro.fill=true;
print("teacher profile called  name == "+teacherPro.name);




}// call onece on every run
bool fill=false;
class TeacherPro{
  String name;
  String country;
  String city;
  String about;
  String imagename;
  String bio;
  List<String> students;
  bool fill=false;
}

bool teacherProfileIsFill=false;

getprofile(){
  return teacherPro;
}