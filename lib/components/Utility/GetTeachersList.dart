
import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Networking/FetchTeachersList.dart';
import 'package:art_man/components/Texts/Strings.dart';
Strings strings=new Strings();
Future<TeachersList> GetTeachersList()async{
  return await GetLocation.fetchTeachersList(
      "${strings.baseurl}/admin/getTeachers");
}