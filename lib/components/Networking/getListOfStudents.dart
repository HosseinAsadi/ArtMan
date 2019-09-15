import 'dart:convert';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:http/http.dart' as http;

import 'package:art_man/components/Utility/SharedPreferences.dart';

Future<UsersList> fetchUsersList() async {
  UsersList information;
  Strings strings=new Strings();
  String token=await getToken();

  final response = await http.get("${strings.baseurl}/admin/getUsers",headers: {"token":token});
  if (response.statusCode == 200) {
    print("connection to fetch teacherslist is ok");
    var list = (json.decode(response.body));
    information = UsersList.fromJson(list);
    return information;
  } else {
    throw Exception('Failed to load countreis');
  }
}

class UsersList{
  List<Result> result;
  UsersList._({this.result});
  factory UsersList.fromJson(Map jsonMap) {
    return new UsersList._(
      result : (jsonMap['result'] as List).map((i) => Result.fromJson(i)).toList()


    );
}

}
class Result {
  String username;
  int sex;
  String first_name;
  String country;
  String city;
  String profile_photo;

  Result._(
      {this.username, this.country, this.sex, this.city, this.first_name, this.profile_photo,});

  factory Result.fromJson(Map jsonMap) {
    return new Result._(
      username: jsonMap['username'],
      sex: jsonMap['sex'],
      city: (jsonMap['city']),
      first_name: (jsonMap['first_name']),
      country: (jsonMap['country']),
      profile_photo: (jsonMap['profile_photo']),


    );
  }
}