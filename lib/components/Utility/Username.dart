
import 'package:art_man/components/Utility/SharedPreferences.dart';

Future<String> Username()async{
  SharedPrefrences sharedPrefrences=new SharedPrefrences();

 return await sharedPrefrences.getusername();
}