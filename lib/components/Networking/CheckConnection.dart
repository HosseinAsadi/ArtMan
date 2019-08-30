
import 'package:connectivity/connectivity.dart';

  Future<bool> checkConnection() async {
      print("check connectionnnnnnnnnnnnnnnnnnn");
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile || connectivityResult == ConnectivityResult.wifi) {
        return true;
      } else  {
        return false;
      }

  }
