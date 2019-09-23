import 'package:art_man/components/Animation/RightSlidePage.dart';
import 'package:flutter/services.dart';
import 'package:art_man/components/Lists/BuildGrid.dart';
import 'package:art_man/components/Utility/Categorylist.dart';
import 'package:flutter/material.dart';

import 'SportField.dart';

class MuscleGroupList extends StatefulWidget {

  @override
  _StateMuscleGroupList createState() => _StateMuscleGroupList();
}

class _StateMuscleGroupList extends State<MuscleGroupList> {
  double width=30,height=30;
  static final showGrid = true; // Set to false to show ListView


  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
  Future<Null> onWillPop() {
    switch(state){
      case "tools":{
        setState(() {
          state="muscle";
        });
        Navigator.push(context, SlideRightRoute(page: MuscleGroupList()));
        break;
      }
      case "muscle":{
        setState(() {
          state="fields";
        });
        Navigator.push(context, SlideRightRoute(page: SportField()));

        break;
      }

    }

  }
  @override
  Widget build(BuildContext context) {


    return  new WillPopScope(
        onWillPop: onWillPop,
        child:Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.green,
        ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child:new BuildGrid(200.0,2.0,2.0,250.0,13,8,state=="muscle"?muscles:tools,
          Color(0xFFF71C105),Colors.white,)),
      ),

        ) );
  }
}








