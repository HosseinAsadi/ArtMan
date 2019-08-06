import 'package:art_man/components/Buttons/Button.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:flutter/material.dart';
import 'package:art_man/components/custom-checkbox.dart';

class Membership extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return M();
  }
}

class M extends State<Membership> {
  CustomCheckbox _cc = new CustomCheckbox();

  @override
  Widget build(BuildContext context) {
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
        children: <Widget>[
          title(),
          bText(),
          _cc,
          Button([""],"/profile","ورود به پنل کاربری", 40.0, 10.0,),

        ],
      );

  Widget title() => Container(
      child: Text(
        "عضویت شما فعال گردیده است...",
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
      ),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      height: 50,
      alignment: Alignment(0, 0),
      margin: EdgeInsets.only(left: 25, right: 25, bottom: 30));

  Widget bText() => Padding(
        padding: EdgeInsets.only(left: 25, right: 25),
        child: Text(
          Strings.TEXTOFMEMBERSHIP,
          style: TextStyle(color: Colors.white, fontSize: 15),
          textAlign: TextAlign.center,
        ),
      );
}
