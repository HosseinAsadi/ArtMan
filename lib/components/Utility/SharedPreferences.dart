import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrences{
 static  setsign() async{
    SharedPreferences sign = await SharedPreferences.getInstance();
    await sign.setBool('sign', true);
  }
 static Future<bool> signState() async{
    SharedPreferences sign = await SharedPreferences.getInstance();
   return await sign.getBool('sign');
  }
  static Future<String> gettype()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString('type');
  }
}
