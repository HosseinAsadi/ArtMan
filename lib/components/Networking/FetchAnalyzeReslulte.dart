import 'dart:convert';
import 'package:art_man/components/Networking/AnayzeResult.dart';
import 'package:http/http.dart' as http;


Future<AnalyzeAnswers> fetchAnalyzeReslult(url) async {
  AnalyzeAnswers userData;
  final response = await http.get(url);
  if (response.statusCode == 200) {
    print("----------------------------------connection to get analyze result is ok");
    var list = (json.decode(response.body));
    userData = AnalyzeAnswers.fromJson(list);
    return userData;
  }
}