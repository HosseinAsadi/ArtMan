import 'package:flutter/material.dart';
class Background extends StatelessWidget {
  Widget body;
  Drawer drawer;
  AppBar appBar;

  Background(this.body,{this.drawer,this.appBar});
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
        child: ListView(
          shrinkWrap: false,
          children: <Widget>[
            body
          ],
        ),
      ),
    );
  }
}
