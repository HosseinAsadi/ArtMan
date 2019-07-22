import 'package:art_man/page/SportPlanePage.dart';
import 'package:flutter/material.dart';

class PlanePage extends StatefulWidget {
  @override
  _PlanePageState createState() => _PlanePageState();
}

class _PlanePageState extends State<PlanePage> {
  int _selectedIndex = 0;
  SportPlanPage sportPlanPage = new SportPlanPage();


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

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
            style: TextStyle(color: Colors.white),
          ),
        ),
        drawer: Drawer(
          child: Text("dfdf"),
        ),
        body: TabBarView(
          children: [
            sportPlanPage,
            Icon(Icons.directions_transit),
          ],
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
          currentIndex: _selectedIndex,
          selectedItemColor: Color(0xFF00C0B6),
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
