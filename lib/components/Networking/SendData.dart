import 'dart:async';
import 'dart:convert';
import 'dart:io';

class Post{
  static Future<String> apiRequest(url,json) async {

    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json));
    HttpClientResponse response = await request.close();
    var reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    print(response);
    return response.statusCode.toString();
  }
}
class Put{
  static Future<void> apiRequest(url,json) async {
    HttpClient httpClient = new HttpClient();

    HttpClientRequest request = await httpClient.putUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json));

    HttpClientResponse response = await request.close();
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    print(reply) ;
  }
}
