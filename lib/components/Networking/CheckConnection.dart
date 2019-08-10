import 'dart:io';

class CheckConnection{
 static Future<bool> checkConnection() async {
   bool connection=false;
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connection=true;
        return connection;
      }
      else{
        connection=false;
        return connection;
      }
  }
}