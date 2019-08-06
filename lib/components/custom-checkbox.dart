import 'package:flutter/material.dart';


class CustomCheckbox extends StatefulWidget {
  bool _boolValue;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    CC c = new CC();
    _boolValue = c.boolValue;
    return c;
  }

  bool get boolValue => _boolValue;
}

class CC extends State<CustomCheckbox> {
  bool _boolValue = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return checkbox(_boolValue);
  }

  bool get boolValue => _boolValue;

  Widget checkbox(bool value) => Container(
        margin: EdgeInsets.only(top: 15, left: 25, right: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
//         Checkbox(
//               value: value,
//               checkColor: Colors.white,
//               activeColor: Colors.green,
//               onChanged: (bool v) {
//                 setState(() {
//                   _boolValue = v;
//                 });
//               }
//           ),
            Container(
                padding: EdgeInsets.all(3),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _boolValue = !_boolValue;
                    });
                  },
                  child: _boolValue
                      ? Icon(
                          Icons.check,
                          size: 30.0,
                          color: Colors.green,
                        )
                      : Icon(
                          Icons.check_box_outline_blank,
                          size: 30.0,
                          color: Colors.green,
                        ),
                )
            ),
            Text("قوانین و مقرارت اپلیکیشن را می پذیرم.",
                style: TextStyle(color: Colors.white,fontSize: 13)),
            GestureDetector(
              child: Text("(توضیحات)",
                  style: TextStyle(
                      color: Colors.green,
                      fontSize: 10,
                      decoration: TextDecoration.underline)),
              onTap: () {
                setState(() {});
              },
            )
          ],
        ),
      );
}
