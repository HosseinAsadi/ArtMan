import 'package:art_man/components/Lists/BuildGrid.dart';
import 'package:flutter/material.dart';

class MuscleGroupList extends StatelessWidget {
  static final showGrid = true; // Set to false to show ListView
  BuildGrid _buildGrid =new BuildGrid(200.0,2.0,2.0,250.0,6,8,
      ["2هفته","هفته25","30هفته","15هفته","2هفته","هفته25","30هفته"],
      Color(0xFFF71C105),Colors.white);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: Color(0xFF088B00),
        title: Text(
          'لیست گروه عضلانی',
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
      drawer: Drawer(
        child: Text(""),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(child:_buildGrid),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.alarm_on), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_filled), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), title: Text("")),
        ],
        selectedItemColor: Color(0xFF00C0B6),
      ),
    );
  }
}






