import 'package:flutter/material.dart';
import 'package:art_man/utils/Strings.dart';
import 'package:art_man/components/button.dart';

class CoachExplan extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CE();
  }
}

class CE extends State<CoachExplan>{
  CustomButton _cb = new CustomButton('صفحه ورود/ثبت نام');

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

  Widget button() => GestureDetector(
    child: _cb,
    onTap: () {
        Navigator.pushNamed(context, '/register');
    },
  );

}