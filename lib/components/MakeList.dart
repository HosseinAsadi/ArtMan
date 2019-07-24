import 'package:art_man/components/InputText.dart';
import 'package:flutter/material.dart';

class MakeList extends StatefulWidget {
  @override
  _MakeListState createState() {
    return _MakeListState();
  }
}

class _MakeListState extends State<MakeList> {
  double height = 90.0;
  int week=1;
  static InputText move = new InputText(
    "حداقل یک حرکت به جلسه مورد نظر اضافه نمایید",
    "move",
    margintop: 0.0,
    height: 25.0,
  );
  static InputText nameClass = new InputText(
    "نام جلسه را وارد نمایید ...",
    "classname",
    margintop: 0.0,
    height: 25.0,
  );
  static container(number) => Container(
    margin: EdgeInsets.only(right: 15, left: 15, top: 7, bottom: 7),
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15))),
    child: Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 15),
          child: Text(
            "جلسه ${number}",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ),
        Container(child: move),
        Container(
          child: nameClass,
        ),
      ],
    ),
  );
  List<Container> _listViewData = [container(1)];

  _onSubmit() {
    setState(() {
      _listViewData.add(container(++week));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 20),
          height: height,
          child: Column(children: _listViewData),
        ),
        Container(
          alignment: Alignment(0, 0),
          width: 30,
          height: 30,
          margin: EdgeInsets.only(
            top: 10,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              //border: Border.all(color: bordercolor,width: borderwidth),
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.yellow[700], Colors.yellow[700]])),
          child: GestureDetector(
            /* onTapDown: (tapDetails) {
              setState(() {
                width = width - 2;
                --height;
                startcolor = Colors.green[900];
                endcolor = Colors.green[800];
              });
            },
            onTapUp: (TapUpDetails) {
              setState(() {
                startcolor = Color(0xFF5AE100);
                endcolor = Color(0xFF0F8F00);
                width = width + 2;
                ++height;
              });
            },*/
            onTap: () {
              setState(() {
                _onSubmit();
                height += 90;
              });
            },
            child: Text(
              "+",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w900,
                  fontSize: 25),
            ),
          ),
        )
      ],
    );
  }
}
