import 'package:flutter/material.dart';

class MuscleGroupList extends StatelessWidget {
  static final showGrid = true; // Set to false to show ListView

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
        child: Center(child: _buildGrid()),
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

  // #docregion grid
  Widget _buildGrid() => GridView.extent(
      maxCrossAxisExtent: 200,
      padding: const EdgeInsets.all(4),
      mainAxisSpacing: 2,
      crossAxisSpacing: 2,
      children: _buildGridTileList(6));


  List<Container> _buildGridTileList(int count) => List.generate(
        count,
        (i) => Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    child: Image.asset('assets/images/pic${i + 1}.jpeg'),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    child: Container(
                      width: 130,
                      height: 52,
                      decoration: BoxDecoration(
                          color: Color(0xFF71C105),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(40))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Text(
                            "پاور لیفتینک",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                          Text("۲۵ هفته",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      );

// #enddocregion list
}






