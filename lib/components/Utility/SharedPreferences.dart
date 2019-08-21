import 'package:art_man/components/Utility/Keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefrences{
   setsign() async{
    SharedPreferences sign = await SharedPreferences.getInstance();
    await sign.setBool('sign', true);
  }
  Future<bool> signState() async{
    SharedPreferences sign = await SharedPreferences.getInstance();
   return await sign.getBool('sign');
  }
   Future<String> gettype()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('type');
  }

   setusername() async{
   SharedPreferences sign = await SharedPreferences.getInstance();
   await sign.setString('username', Kelid.getter("username"));
 }
  Future<String> getusername() async{
   SharedPreferences user = await SharedPreferences.getInstance();
   return await user.getString('username');
 }
}
