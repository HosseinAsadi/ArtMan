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
      coachSearch(),
      ProfileButton("قسمت مربیان", Icons.print, Colors.green[800], '/analyze1'),
      ProfileButton("برنامه های تمرینی/غذایی", Icons.print, Colors.lightGreen[700], '/analyze5'),
      ProfileButton("آنالیزها", Icons.print, Colors.green[800], ''),
      ProfileButton("تنظیمات کاربری", Icons.print, Colors.lightGreen[700], ''),
      ProfileButton("پشتیبانی", Icons.print, Colors.green[800], ''),
      ProfileButton("خروج از حساب کاربری", Icons.print, Colors.grey[800], ''),
    ],
  );

  Widget coachSearch() =>Container(
    margin: EdgeInsets.only(left: 16, right: 16, bottom: 20),
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(20)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: new Color(0xFFEDC40A), width: 2),
            borderRadius: BorderRadius.circular(30)
          ),
          child: Icon(Icons.search, color: new Color(0xFFEDC40A)),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 200,
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
              child: Text('جستجوی مربی', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Text('جستجو کردن مربی در صورت نیاز شما', style: TextStyle(color: Colors.black, fontSize: 13),),
            ),
          ],
        )
      ],
    ),
  );

}