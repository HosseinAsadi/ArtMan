import 'package:flutter/material.dart';

class TeacherProfilePage extends StatefulWidget {
  @override
  _TeacherProfilePageState createState() => _TeacherProfilePageState();
}

class _TeacherProfilePageState extends State<TeacherProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(R),
                            ),
                            child: Image.asset("assets/images/morabi.jpeg"),
                          ),
                          Column(
                            children: <Widget>[
                              Text(""),
                              Text(""),
                              Text(""),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
