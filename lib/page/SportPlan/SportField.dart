import 'package:art_man/components/Lists/BuildGrid.dart';
import 'package:flutter/material.dart';

class SportField extends StatefulWidget {
  @override
  _SportFieldState createState() => _SportFieldState();
}

class _SportFieldState extends State<SportField> {



  BuildGrid buildGrid=new BuildGrid(200.0,1.0,3.0,250.0,3,8,
      ["dsdfdf","fdfdfd","fdfdfs","fdfdffd","dfdfdf","fdfdffd","dfdfdf"],
      Color(0xFFF1C60D),Colors.green,[
        "assets/images/fields/آمادگی-جسمانی.jpg",
        "assets/images/fields/بدنسازی.jpg",
        "assets/images/fields/کراس-فیت.jpg",
      ]);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Color(0xFF088B00),
        title: Text(
          'رشته های ورزشی',
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w800, color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
        child:Center(
        child: Container(
    width: 200,
    child:  buildGrid),),
      ),),

    );
  }

}
