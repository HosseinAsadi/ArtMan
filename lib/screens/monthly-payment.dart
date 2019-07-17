import 'package:flutter/material.dart';
import 'package:art_man/components/text.dart';
import 'package:art_man/components/text-field-enter.dart';
import 'package:art_man/components/button.dart';

class MonthlyPayment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MP();
  }
}

class MP extends State<MonthlyPayment> {
  CustomText _ct = new CustomText("پرداخت‌اشتراک‌ماهانه:");
  CustomButton _cb = new CustomButton("پرداخت‌آنلاین");

  TextEditingController _controller = new TextEditingController();
  int countSlash = 0;

  @override
  Widget build(BuildContext context) {
    _controller.addListener(onChange);

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

  Widget body() => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width / 4), child: _ct),
          getTextFields("پرداخت اشتراک ماهانه خود را وارد کنید.."),
          button()
        ],
      );

  Widget getTextFields(String hint) => Container(
      height: 50,
      alignment: Alignment(0, 0),
      margin: EdgeInsets.only(left: 30, right: 30),
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(25)),
      child: Padding(
          padding: EdgeInsets.only(left: 5, right: 5),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                  flex: 7,
                  child: TextFormField(
                    textDirection: TextDirection.rtl,
                    keyboardType: TextInputType.number,
                    controller: _controller,
                    textAlign: TextAlign.right,
                    validator: (String value) {
                      if (value.isEmpty) {
                        return null;
                      }
                    },
                    decoration: InputDecoration.collapsed(
                        hintText: hint, fillColor: Colors.grey),
                  )),
              Flexible(
                  flex: 3,
                  child: Text(
                    "ریال",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ],
          )));

  Widget button() => GestureDetector(
        child: _cb,
        onTap: () {
          Navigator.pushNamed(context, '/membership');
        },
      );

  _displaySnackBar(context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('لطفا همه فیلد ها را پر کنید!')));
  }

  void onChange(){
    String text = _controller.text;
    int l = text.length - countSlash;

    if (l % 3 == 0) {
      text += "/";
      countSlash++;
    }

  }
}
