import 'dart:convert';

import 'package:art_man/components/Networking/SendPlanSport.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/page/SportPlan/SportPlanePage.dart';
import 'package:flutter/material.dart';

class PlaneSportTeacher extends StatefulWidget {
  @override
  _PlaneSportTeacherState createState() => _PlaneSportTeacherState();
}

class _PlaneSportTeacherState extends State<PlaneSportTeacher> {



  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF7FC81D),
          iconTheme: IconThemeData(
            color: Colors.white, //change your color here
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: null)
          ],
          bottom: TabBar(
            labelColor: Colors.white,
            tabs: [
              Tab(
                text: "برنامه های غذایی",
              ),
              Tab(
                text: "برنامه های ورزشی",
              ),
            ],
          ),
          title: Text(
            'برنامه های ورزشی و غذایی',
            style: TextStyle(color: Colors.white,fontSize: 14),
          ),
        ),

        body: TabBarView(
          children: [
            new SportPlanPage("برنامه های من","ساخت و ارسال برنامه غذایی","غذایی","/ListPlanOfTeacher"),
            new SportPlanPage("برنامه های من","ساخت و ارسال برنامه ورزشی","ورزشی","/ListPlanOfTeacher")
          ],
        ),

      ),
    );
  }
}
