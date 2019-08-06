import 'dart:async';
import 'dart:convert';
import 'dart:io';


class Sender{

 // String url = 'http://192.168.20.231:3000/users/addUser';

  Future<void> apiRequest(url,json) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(
      json/*{
      "username": "محمد",
      "sex": "مرد",
      "family": "شبانی"
    }*/)));
    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    print(reply) ;
  }

}