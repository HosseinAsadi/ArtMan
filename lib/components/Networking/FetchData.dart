import 'dart:convert';
import 'package:art_man/components/Location.dart';
import 'package:art_man/components/Networking/fetchProfileInfo.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:http/http.dart' as http;

class GetLocation {
  static Future<Country> fetchData() async {
    Country country;
    final response = await http.get("${Strings.baseurl}/country/getCountry");
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
    if (response.statusCode == 200) {
      print("----------------------------------connection to users is ok");
      var list = (json.decode(response.body));
      userData = UserData.fromJson(list);
      return userData;
    }
  }


  static Future<profilInfo> fetchProfileInfo(url) async {
    profilInfo information;
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print("connection is ok");
      var list = (json.decode(response.body));
      information = profilInfo.fromJson(list);
      return information;
    } else {
      throw Exception('Failed to load countreis');
    }
  }
}