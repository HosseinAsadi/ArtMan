import 'package:flutter/material.dart';

class SelectAbleList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 200.0, // Change as per your requirement
          width: 300.0,
          color: Colors.white, // Change as per your requirement
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 50,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                  height: 60,
                  width: 301,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      gradient: new RadialGradient(
                    colors: [Colors.blue[900], Colors.white],
                    radius: 2.2,
                    center: Alignment.center,
                  )),
                  child: Container(
                    height: 58,
                    width: 301,
                    alignment: Alignment.center,
                    color: Colors.white,
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold,fontSize: 18),
                    ),
                  ));
            },
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.white.withOpacity(0.1)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter)),
              height: 60,
              child: Text(""),
            )),
        Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
              width: 20,
              child: Text(""),
            )),
        Positioned(
            right: 0,
            top: 0,
            bottom: 0,
            child: Container(
              color: Colors.white,
              width: 20,
              child: Text(""),
            )),
        Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.white, Colors.white.withOpacity(0.1)],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
              height: 60,
              child: Text(""),
            )),
      ],
    );
  }
}
