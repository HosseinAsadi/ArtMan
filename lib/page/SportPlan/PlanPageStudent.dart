import 'package:art_man/page/SportPlan/Tabb.dart';
import 'package:flutter/material.dart';

class PlanePage extends StatefulWidget {
  @override
  _PlanePageState createState() => _PlanePageState();
}

class _PlanePageState extends State<PlanePage> {
  int _selectedIndex = 0;



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

          bottom: TabBar(
            labelColor: Colors.white,
            tabs: [

              Tab(
                text: "برنامه های ورزشی",
              ),
              Tab(
                text: "برنامه های غذایی",
              ),
            ],
          ),
          title: Text(
            'برنامه های ورزشی و غذایی',
            style: TextStyle(color: Colors.white),
          ),
        ),

        body: TabBarView(
          children: [
            new Tabb("برنامه های من","درخواست برنامه ورزشی","ورزشی",""),
        new Tabb("برنامه های من","درخواست برنامه غذایی","غذایی","")
          ],
        ),

      ),
    );
  }
}
