

import 'package:art_man/components/Networking/FetchLocation.dart';
import 'package:art_man/components/Networking/FetchStudentProfileInfo.dart';
import 'package:art_man/components/Texts/Strings.dart';

Future<StdProfile> StdInfo(username)async{
  Strings strings=new Strings();
  return  await GetLocation.fetchProfilestudent(
      "${strings.baseurl}/users/getUser/$username");
}
