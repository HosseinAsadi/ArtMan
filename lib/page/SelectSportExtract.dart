import 'package:flutter/material.dart';

class SelectSportExtract extends StatefulWidget {
  @override
  _SelectSportExtractState createState() => _SelectSportExtractState();
}

class _SelectSportExtractState extends State<SelectSportExtract> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Color(0xFF7FC81D),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ],
        title: Text(
          "برنامه ورزشی",
          style: TextStyle(color: Colors.white),
        ),
      ),
      drawer: Drawer(
        child: Text("dff"),
      ),
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView(
            shrinkWrap: false,
            children: <Widget>[
              Center(
                child: Container(
                  margin:
                  EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
                  child: Form(
                    // key: _key,
                    child: Column(
                      children: <Widget>[
                        container()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  container() =>
      Container(
        margin: EdgeInsets.only(top: 15),
        height: 90,
        decoration: BoxDecoration(
            color: Color(0xFFF0F0F3),
            borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 15, right: 15),
              child: IconButton(icon: Icon(
                Icons.search, color: Colors.yellow, size: 40,),
                  onPressed: null),
            ),
            Container(
              width: 250,
              child: TextField(
              decoration: InputDecoration(
                  hintText: hint(),
                hintStyle: TextStyle(
                  decoration: TextDecoration.none
                )
              ),
            ),)

          ],
        ),
      );
  hint()=>Text("جست و جو بر اساس نام تمرینات ...",style: TextStyle(color: Colors.green,fontWeight: FontWeight.w500,fontSize: 18),).toString();
}
