import 'dart:async';
import 'package:art_man/components/Networking/CheckConnection.dart';
import 'package:art_man/components/Networking/FetchData.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  MySplashScreen createState() => MySplashScreen();
}

class MySplashScreen extends State<SplashScreenPage> {
  bool connection=false;
  Timer _timer;
  int _start = 3;
  bool signstate;

  _getsignstate()async{

   var sign=await SharedPrefrences.signState();
   setState(() {
     if(sign==null)
       signstate=false;
     else
     signstate=sign;
   });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
          (Timer timer) => setState(
            () {
          if (_start < 1) {
            timer.cancel();
            if(connection)
              if(signstate){
                Navigator.pushNamed(context, "/Profile");

              }

              else{
                Navigator.pushNamed(context, "/FirstLogin");
              }



          } else {
            if(connection)
            _start = _start - 1;
            else{
              _myFunction();
            }
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  apiRequest() async {
    var x=await GetLocation.fetchuser();
    print(x.toString());
  }
  void _myFunction() async {
    bool result = await CheckConnection.checkConnection();
    setState(() {
      connection=result;
      print (connection);
    });
  }

  @override
  void initState() {
    super.initState();
    apiRequest();
    _getsignstate();
    _myFunction();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:(connection && !_timer.isActive)?Container() : Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/images/demo.gif")
              ],
            ),
          )),
    );
  }
}
