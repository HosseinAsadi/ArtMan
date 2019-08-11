import 'package:art_man/components/ImageAbout/Backgroand.dart';
import 'package:art_man/components/UserInfo.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirstLogin extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return FL();
  }
}

class FL extends State<FirstLogin> {

  bool morabi=true,std=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Backgroand(body()));
  }

  body() => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 25),
              padding: EdgeInsets.only(left: 55, right: 55),
              child: Image.asset('assets/images/icon.png'),
            ),
            radioButton("مربی",morabi?Color(0xFF088B00):Color(0xFFC1C1C1)),
            SizedBox(height: 10,),
            radioButton("هنرجو",!morabi?Color(0xFF088B00):Color(0xFFC1C1C1)),
            Button(),

          ],
        ),
      );

  Widget radioButton(user,color) => Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.all(Radius.circular(20))),
        height: 40,
        width: 120,
        child: GestureDetector(
          onTap: (){
            setState(() {
              if(user=="مربی")
              {
                morabi=true;
                std=false;
              }
              else
              {
                morabi=false;
                std=true;
              }
            });

          },
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left:20,right: 15),
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                    color:color, borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              Text(user,style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)
            ],
          ),
        ),
      );
  Widget Button() => Container(
    margin: EdgeInsets.only(top: 15),
    alignment: Alignment(0, 0),

    decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Color(0xFF5AE100), Color(0xFF0F8F00)])
        , borderRadius: BorderRadius.all(Radius.circular(20))),
    height: 45,
    width: 180,
    child: GestureDetector(
      onTap: () async {

        SharedPreferences prefs = await SharedPreferences.getInstance();

        /*String counter = (prefs.getString('type') ?? 0);
        print('user is  $counter .');*/
        if(morabi)
          await prefs.setString('type', "teachers");
        else
          await prefs.setString('type', "users");
        setState(() {
          UserInfo.type=prefs.getString('type');

        });
        Navigator.pushNamed(context, morabi?"/CoachExplan":"/StdPropertyBody");
      },

         child: Text("ورود",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)
    ),
  );





}
