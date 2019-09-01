import 'package:art_man/components/Utility/Keys.dart';
import 'package:shared_preferences/shared_preferences.dart';


   setsign() async{
    SharedPreferences sign = await SharedPreferences.getInstance();
    await sign.setBool('sign', true);
  }
  Future<bool> signState() async{
    SharedPreferences sign = await SharedPreferences.getInstance();
   var state= await sign.getBool('sign');
   if(state==null)
     return false;
   else
     return true;
  }
   Future<String> gettype()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('type');
  }
setType(typee) async{
  SharedPreferences type = await SharedPreferences.getInstance();
  await type.setString('type', typee);
}

   setusername() async{
   SharedPreferences sign = await SharedPreferences.getInstance();
   await sign.setString('username', Kelid.getter("username"));
 }
  Future<String> getusername() async{
   SharedPreferences user = await SharedPreferences.getInstance();
   return await user.getString('username');
 }


   setDate(date) async{
     SharedPreferences sign = await SharedPreferences.getInstance();
     await sign.setString('date', date);
   }
   Future<String> getDate() async{
     SharedPreferences sign = await SharedPreferences.getInstance();
     return await sign.getString('date');
   }

   removeAccount()async{
     SharedPreferences sign = await SharedPreferences.getInstance();
     SharedPreferences user = await SharedPreferences.getInstance();
     SharedPreferences prefs = await SharedPreferences.getInstance();

     sign.clear();
     user.clear();
     prefs.clear();
   }

Future<String> getToken()async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('token');
}
setToken(token) async{
  SharedPreferences type = await SharedPreferences.getInstance();
  await type.setString('token', token);
}

