import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:art_man/components/Keys.dart';
import 'package:art_man/components/Utility/MD5Generator.dart';
import 'package:art_man/components/Utility/SetSex.dart';


class Sender{

 static String url = 'http://192.168.20.227:3000/users/addUser';

  static Future<void> apiRequest() async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(
      { "username" : Kelid.getter("username"),
        "password" : Hasher.GenerateMd5(),
        "first_name" :  Kelid.getter("first_name"),
        "last_name" : " ",
        "country" : Kelid.getter("country"),
        "city" : Kelid.getter("city"),
        "phone" :  Kelid.getter("phone"),
        "sex" : SetSex.sex(Kelid.getter("sex").toString()) ,
      })));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    print(reply) ;
  }

}