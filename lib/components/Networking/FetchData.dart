import 'dart:convert';
import 'package:art_man/components/Location.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/MD5Generator.dart';
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

 static Future<int> fetchuser() async {

   final response = await http.get("${Strings.baseurl}/teachers/login/taghi/${Hasher.GenerateMd5("12345")}");
   print(response.body.toString());

   if (response.statusCode == 200) {
     return 1;

   }
 }
}