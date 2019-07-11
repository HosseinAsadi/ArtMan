import 'package:flutter/material.dart';
import 'package:art_man/components/custom-radio-model.dart';

class FirstLogin extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FL();
  }
}

class FL extends State<FirstLogin> {
  List<RadioModel> values = new List<RadioModel>();

  @override
  void initState() {
    super.initState();
    values.add(new RadioModel(true, 'مربی'));
    values.add(new RadioModel(false, 'هنرجو'));
  }

  @override
  Widget build(BuildContext context) {
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
            Container(
              margin: EdgeInsets.only(bottom: 25),
              padding: EdgeInsets.only(left: 55, right: 55),
              child: Image.asset('assets/images/icon.png'),
            ),
            radioButton(),
            button()
          ],
        ),
      );

  Widget radioButton() => Container(
      height: 190,
      child: ListView.builder(
        itemCount: values.length,
        scrollDirection: Axis.vertical,

        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                values.forEach((element) => element.isSelected = false);
                values[index].isSelected = true;
              });
            },
            child: new RadioItem(values[index]),
          );
        },
      )
  );

  Widget button() => Container(
        width: 200,
        padding: EdgeInsets.only(top: 10, bottom: 10),
        alignment: Alignment(0, 0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [new Color(0xFF0F8F00), new Color(0xFF5AB403)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
          borderRadius: BorderRadius.circular(25)
        ),
        child: Text('ورود',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 20)
        ),
      );
}
