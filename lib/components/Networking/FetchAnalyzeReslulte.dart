import 'dart:convert';
import 'package:art_man/components/Networking/AnayzeResult.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:http/http.dart' as http;


Future<AnalyzeAnswers> fetchAnalyzeReslult(url) async {
  AnalyzeAnswers userData;
  String token=await getToken(true);
  final response = await http.get(url,headers : {"token":token});
  if (response.statusCode == 200) {
    print("----------------------------------connection to get analyze result is ok");
    var list = (json.decode(response.body));
    userData = AnalyzeAnswers.fromJson(list);
    return userData;
  }
}
