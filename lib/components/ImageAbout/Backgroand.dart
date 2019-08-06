import 'package:flutter/material.dart';

class Backgroand extends StatelessWidget {
  Widget body;
  Backgroand(this.body);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/background.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: body,
    );
  }
}
