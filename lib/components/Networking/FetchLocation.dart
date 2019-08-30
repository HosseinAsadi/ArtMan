import 'dart:convert';
import 'package:art_man/components/Location.dart';
import 'package:art_man/components/Networking/FetchStudentProfileInfo.dart';
import 'package:art_man/components/Networking/FetchTeachersList.dart';
import 'package:art_man/components/Networking/fetchTeacherProfileInfo.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:http/http.dart' as http;

class GetLocation {
  static Future<Country> fetchData() async {
    Strings strings=new Strings();

    Country country;
    final response = await http.get("${strings.baseurl}/country/getCountry");
    if (response.statusCode == 200) {
      print("connection is ok");
      var list = (json.decode(response.body));
      country = Country.fromJson(list);
      return country;
    } else {
      throw Exception('Failed to load countreis');
    }
  }

  static Future<UserData> fetchuser(url) async {
    UserData userData;
    final response = await http.get(url);
   // print (response);
    if (response.statusCode == 200) {

      var list = (json.decode(response.body));
      userData = UserData.fromJson(list);
      return userData;
    }
  }


  static Future<UserProfile> fetchProfileInfo(url) async {
    UserProfile information;
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("connection is ok");
      var list = (json.decode(response.body));
      information = UserProfile.fromJson(list);
      return information;
    } else {
      throw Exception('Failed to load countreis');
    }
  }


  static Future<StdProfile> fetchProfilestudent(url) async {
    StdProfile information;
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("connection is ok");
      var list = (json.decode(response.body));
      information = StdProfile.fromJson(list);
      return information;
    } else {
      throw Exception('Failed to load countreis');
    }
  }



  static Future<TeachersList> fetchTeachersList(url) async {
    TeachersList information;
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("connection to fetch teacherslist is ok");
      var list = (json.decode(response.body));
      information = TeachersList.fromJson(list);
      return information;
    } else {
      throw Exception('Failed to load countreis');
    }
  }
}