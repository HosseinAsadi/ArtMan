import 'package:shared_preferences/shared_preferences.dart';
class ShPre{
  SharedPreferences prefs;
  addStringToSF(usertype) async {
     prefs = await SharedPreferences.getInstance();
    prefs.setString('type', usertype);
  }
  getValuesSF() async {
    prefs = await SharedPreferences.getInstance();
  }
  removeValues() async {
    prefs.remove("type");
  }
}