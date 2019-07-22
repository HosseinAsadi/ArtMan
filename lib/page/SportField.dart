import 'package:flutter/material.dart';

class SportField extends StatefulWidget {
  @override
  _SportFieldState createState() => _SportFieldState();
}

class _SportFieldState extends State<SportField> {
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
          BottomNavigationBarItem(icon: Icon(Icons.alarm_on), title: Text("")),
          BottomNavigationBarItem(
              icon: Icon(Icons.play_circle_filled), title: Text("")),
          BottomNavigationBarItem(icon: Icon(Icons.settings), title: Text("")),
        ],
        selectedItemColor: Color(0xFF00C0B6),
      ),
    );
  }

  Widget _buildGrid() => Center(
        child: Container(
          width: 200,
          child: GridView.extent(
            maxCrossAxisExtent: 200,
            padding: const EdgeInsets.all(8),
            mainAxisSpacing: 1,
            crossAxisSpacing: 3,
            children: _buildGridTileList(7),
          ),
        ),
      );

  List<Container> _buildGridTileList(int count) => List.generate(
        count,
        (i) => Container(
              margin: EdgeInsets.all(8),
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
                      height: 40,
                      decoration: BoxDecoration(
                          color: Color(0xFFF1C60D),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(40))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "گروه عضلانی",
                            style: TextStyle(
                                color: Colors.green,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                          Text("dfjdkjf dfjdkjf",
                              style: TextStyle(
                                  color: Colors.green,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 10))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      );
}
