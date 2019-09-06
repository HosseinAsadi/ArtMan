import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:art_man/components/Networking/GetToken.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';

class Post{
  static Future<String> apiRequest(url,json) async {//sign up

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json));
    HttpClientResponse response = await request.close();
    var reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    print(reply);
    if(response.statusCode==200|| response.statusCode==201){
      Resulte resulte=await fetchToken(reply);
      print("sign up is okkkkkkkkkkkkkkkkkkkkkkkkkkk");
      await setToken(resulte.toke.token);
      print(resulte.toke.token);
    }
    return response.statusCode.toString();
  }

  static Future<String> SendSmS(url,json) async {

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json));
    HttpClientResponse response = await request.close();
    var reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    print(reply);
    return response.statusCode.toString();
  }
}

class Put{
  static Future<void> apiRequest(url,json) async {
    HttpClient httpClient = new HttpClient();
    String token=await getToken();
    HttpClientRequest request = await httpClient.putUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.headers.set('token', token);
    request.add(utf8.encode(json));

    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    print(reply) ;
  }
}
