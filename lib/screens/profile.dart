import 'package:flutter/material.dart';
import 'package:art_man/components/top-profile-info.dart';
import 'package:art_man/components/profile-button.dart';

class Profile extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return P();
  }

}

class P extends State<Profile>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: setBackground(),
    );
  }

  Widget setBackground() => Container(
    alignment: Alignment(1, 0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/background.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: body(),
  );

  Widget body() => ListView(
    shrinkWrap: true,
    children: <Widget>[
      TopProfile(),
      ProfileButton("قسمت مربیان", Icons.print, Colors.green[800], '/analyze1'),
      ProfileButton("برنامه های تمرینی/غذایی", Icons.print, Colors.lightGreen[700], ''),
      ProfileButton("آنالیزها", Icons.print, Colors.green[800], ''),
      ProfileButton("تنظیمات کاربری", Icons.print, Colors.lightGreen[700], ''),
      ProfileButton("پشتیبانی", Icons.print, Colors.green[800], ''),
      ProfileButton("خروج از حساب کاربری", Icons.print, Colors.grey[800], ''),
    ],
  );

}