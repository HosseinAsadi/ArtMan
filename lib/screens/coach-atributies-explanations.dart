import 'package:flutter/material.dart';
import 'package:art_man/utils/Strings.dart';

class CoachExplan extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CE();
  }
}

class CE extends State<CoachExplan>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(body: setBackground());
  }

  Widget setBackground() => Container(
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage("assets/images/background.png"),
        fit: BoxFit.cover,
      ),
    ),
    child: body(),
  );

  Widget body() => Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          Strings.TITLECOACHEXPLAN,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
        ),

        Container(
          height: 2,
          width: 230,
          color: Colors.lightGreen,
          margin: EdgeInsets.only(bottom: 20),
        ),

        Container(
          padding: EdgeInsets.only(
              left: 10,
              right: 10
          ),
          child: Text(
            Strings.COACHATRIBEXPLAN,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 12,
                height: 1.5
            ),
            textAlign: TextAlign.center,
          ),
        ),

        button()
      ],
    )
  );

  Widget button() => Container(
      width: 170,
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.only(top: 8, bottom: 8),
      alignment: Alignment(0, 0),
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [new Color(0xFF0F8F00), new Color(0xFF5AB403)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(25)
      ),
      child: GestureDetector(
        child: Text('صفحه ورود/ثبت نام',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 18)
        ),
        onTap: (){
          Navigator.pushNamed(context, "/register");
        },
      )
  );
}