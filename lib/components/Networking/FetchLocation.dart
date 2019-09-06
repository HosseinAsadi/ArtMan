import 'dart:io';
import 'dart:convert';
import 'package:art_man/components/Location.dart';
import 'package:art_man/components/Networking/FetchStudentProfileInfo.dart';
import 'package:art_man/components/Networking/FetchTeachersList.dart';
import 'package:art_man/components/Networking/GetToken.dart';
import 'package:art_man/components/Networking/fetchTeacherProfileInfo.dart';
import 'package:art_man/components/Networking/getTokenInLogin.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:http/http.dart' as http;

class GetLocation {
  static Future<Country> fetchData() async {
    Strings strings=new Strings();

    Country country;
    final response = await http.get("${strings.baseurl}/country/getCountry");
    print(response.statusCode);
    if (response.statusCode == 200) {
      print("get location is ok");
      var list = (json.decode(response.body));
      country = Country.fromJson(list);
      return country;
    } else {
      throw Exception('Failed to load countreis');
    }
  }
  static Future<String> login(url,) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.getUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    HttpClientResponse response = await request.close();
    var reply = await response.transform(utf8.decoder).join();
    httpClient.close();
   // print(reply);
    if(response.statusCode==200|| response.statusCode==201){
      LoginResulte resulte=await fetchTokenInLogin(reply);
      await setToken(resulte.toke.token);
      return resulte.result.toString();
    }

  }

  static Future<UserData> fetchuser(url,{task}) async {


    UserData userData;
    var response = await http.get(url);
    if (response.statusCode == 200) {
      if(task=="signin"){

        Resulte resulte=await fetchToken(response);
      await setToken(resulte.toke.token);
      print("tokken setted and result is"+resulte.toke.token);
      }
      var list = (json.decode(response.body));
      userData = UserData.fromJson(list);
      return userData;
    }
  }

  static Future<TeacherProfile> fetchProfileTeacher(url) async {
    TeacherProfile information;
    String token=await getToken();
    print(token);
    final response = await http.get(url,headers: {"token":token});
    if (response.statusCode == 200) {
      print("connection is ok");
      var list = (json.decode(response.body));
      information = TeacherProfile.fromJson(list);
      return information;
    } else {
      throw Exception('Failed to load countreis');
    }
  }

  static Future<StdProfile> fetchProfilestudent(url) async {
    StdProfile information;
    String token=await getToken();
    final response = await http.get(url,headers: {"token":token});
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
    String token=await getToken();

    final response = await http.get(url,headers: {"token":token});
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