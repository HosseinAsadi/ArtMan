import 'package:flutter/material.dart';
import 'package:art_man/utils/Strings.dart';
import 'package:art_man/components/custom-checkbox.dart';
import 'package:art_man/components/button.dart';

class Membership extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return M();
  }
}

class M extends State<Membership> {
  CustomCheckbox _cc = new CustomCheckbox();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: setBackground(),
    );
  }

  Widget setBackground() => Container(
        alignment: Alignment(1, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: body(),
      );

  Widget body() => ListView(
        shrinkWrap: true,
        children: <Widget>[title(), bText(), _cc, button()],
      );

  Widget title() => Container(
        child: Text(
          "عضویت شما فعال گردیده است...",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(30)),
        height: 50,
        alignment: Alignment(0, 0),
        margin: EdgeInsets.only(left: 25, right: 25, bottom: 30)
      );

  Widget bText() => Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Text(
          Strings.TEXTOFMEMBERSHIP,
          style: TextStyle(color: Colors.white, fontSize: 15),
          textAlign: TextAlign.center,
        ),
      );

  Widget button() => GestureDetector(
        child: CustomButton("ورود به پنل کاربری"),
        onTap: () {
          Navigator.pushNamed(context, '/profile');
        },
      );
}
