import 'dart:async';
import 'package:art_man/components/Animation/ScaleRoutePage.dart';
import 'package:art_man/components/Networking/CheckConnection.dart';
import 'package:art_man/components/Networking/SendAnalyzeResult.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/GetPing.dart';
import 'package:art_man/components/Utility/GetTeacherProfile.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/page/NavigationPages/Teacher/Pages.dart';
import 'package:art_man/page/NavigationPages/Teacher/Profile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  MySplashScreen createState() => MySplashScreen();
}

class MySplashScreen extends State<SplashScreenPage> {
  Timer _timer;
  int _start = 3;
  bool showError = false;

  bool isconnect,state,complete=false;
  String type;
  Color color=Colors.white;

  @override
  void initState() {
    super.initState();
    getteacherprofileinfo();

    startTimer();
    connection();
    _getsignstate();

  }


  _getsignstate() async {
    var stat= await signState();
    setState(() {
      state=stat;
    });
  }

  getteacherprofileinfo()async
  {
    var typ = await gettype();
    setState(() {
      type=typ;
    });
    await Teacherformation();
    if(typ=="teachers"&& !teacherProfileIsFill ){
      await Teacherformation();
      setState(() {
        teacherProfileIsFill=true;
      });
    }


  }
  void startTimer() async{
    const oneSec = const Duration(seconds: 1);

    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) => setState(
            ()  {
              if (_start < 1) {
                timer.cancel();
                if (isconnect) {
                  if (state) {

                    Navigator.push(
                        context,
                        type == "teachers"
                            ?ScaleRoute(page: Pages())
                            : ScaleRoute(page: Profile()));
                  } else {
                    Navigator.pushNamed(context, "/FirstLogin");
                  }
                } else {
                  setState(() {
                    showError = true;
                    complete=true;
                  });
                }
              } else {
                _start = _start - 1;
              }

            },

          ),
    );
  }
  connection() async {
    bool connect= await checkConnection();
    setState(() {
      isconnect=connect;
    });
  }
  @override
  void dispose() {

    super.dispose();
    _timer.cancel();
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: (_timer.isActive || !complete)
            ? Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
              ),
            ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Image.asset("assets/images/demo.gif")],
                  ),
                ))
            : showError
                ? Container(

                    child: Center(

                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              setState(() {
                                _start=3;
                                complete=false;
                                connection();
                                startTimer();

                              });
                            },
                              onTapDown: (Details){
                                setState(() {
                                  color=Colors.white.withOpacity(0.2);
                                });
                              },
                              onTapUp: (Details){
                                setState(() {
                                  color=Colors.white.withOpacity(0.2);
                                });
                              },
                            child:Container(
                              padding: EdgeInsets.all(30),
                              margin: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.all(Radius.circular(100))
                              ),
                              child: Icon(
                                Icons.refresh,
                                color: Colors.black,
                                size: 50,
                              ),
                            )
                          ),
                          Container(
                            padding: EdgeInsets.all(7),
                            child: Text("شبکه در دسترس نیست لطفا دوباره تلاش کنید",style: TextStyle(
                            color: Colors.white,fontSize: 17
                          ),),)
                        ],
                      )
                    ),
                  )
                : Container(
                    child: Center(
                      child: Text(
                        "یک مشکل در روند اجرای برنامه است",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ));
  }
}
