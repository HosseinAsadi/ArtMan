import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Texts/Strings.dart';

import 'package:flutter/material.dart';

class CoachExplan extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CE();
  }
}

class CE extends State<CoachExplan>{
  Button _cb = new Button([""],"/",'صفحه ورود/ثبت نام', 40.0, 10.0);

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
    child: ListView(
      shrinkWrap: true,
      children: <Widget>[
        Text(
          Strings.TITLECOACHEXPLAN,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18
          ),
          textAlign: TextAlign.center,
        ),

        Column(
          children: <Widget>[
            Container(
              height: 2,
              width: 230,
              color: Colors.lightGreen,
              margin: EdgeInsets.only(bottom: 20),
            ),
          ],
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

  Widget button() => GestureDetector(
    child: _cb,
    onTap: () {
        Navigator.pushNamed(context, '/register');
    },
  );

}