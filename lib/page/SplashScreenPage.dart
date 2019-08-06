import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreenPage extends StatefulWidget {
  @override
  MySplashScreen createState() => MySplashScreen();
}

class MySplashScreen extends State<SplashScreenPage> {
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/FirstLogin');
                  },
                  child: Image.asset("assets/images/demo.gif"),
                )
              ],
            ),
          )),
    );
  }
}
