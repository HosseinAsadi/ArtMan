import 'package:art_man/components/Lists/BuildGrid.dart';
import 'package:art_man/components/Utility/Categorylist.dart';
import 'package:flutter/material.dart';

class SportField extends StatefulWidget {
  @override
  _SportFieldState createState() => _SportFieldState();
}

class _SportFieldState extends State<SportField> {




  @override
  void initState() {
    super.initState();
    getCategories();
  }
  Future<Null> onWillPop() {
    Navigator.pushNamed(context, "/TeacherProfilePage");
  }
  @override
  Widget build(BuildContext context) {

    print(muscles.length);
    return new WillPopScope(
        onWillPop: onWillPop,
        child: Scaffold(
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
      ),

      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child:complateloadcategory? Center(
        child:Center(
        child: Container(
    width: 200,
    child:  BuildGrid(200.0,1.0,3.0,250.0,3,8,feilds,
      Color(0xFFF1C60D),Colors.green,)),),
      ):Center(child: CircularProgressIndicator(),),),

        ));
  }
}
