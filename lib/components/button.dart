import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  String _text, _navigatorPush;

  var _formKey = GlobalKey<FormState>();

  CustomButton(this._text, this._formKey, this._navigatorPush);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return CB(this._text, this._formKey, this._navigatorPush);
  }
}

class CB extends State<CustomButton> {
  String _text, _navigatorPush;
  var _formKey = GlobalKey<FormState>();

  CB(this._text, this._formKey, this._navigatorPush);

  @override
  Widget build(BuildContext context) {
    var b;
    if(_navigatorPush.isEmpty)
      b = button1(this._text);
    else
      b = button(this._text);
    // TODO: implement build
    return b;
  }

  Widget button(String text) => Builder(
      builder: (context) => GestureDetector(
            child: Container(
                margin: EdgeInsets.only(
                    left: (MediaQuery.of(context).size.width / 3.5),
                    right: (MediaQuery.of(context).size.width / 3.5),
                    top: 30),
                padding: EdgeInsets.only(top: 4, bottom: 4),
                alignment: Alignment(0, 0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [new Color(0xFF0F8F00), new Color(0xFF5AB403)],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Text(text,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 22))),
            onTap: () {
//              if(_formKey != null)
//                            if (_formKey.currentState.validate())
              Navigator.pushNamed(context, this._navigatorPush);
//              else
//                _displaySnackBar(context);
            },
          ));

  _displaySnackBar(context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('لطفا همه فیلد ها را پر کنید!')));
  }

  Widget button1(String text) => Container(
      margin: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width / 4),
          right: (MediaQuery.of(context).size.width / 4),
          top: 30),
      padding: EdgeInsets.only(top: 4, bottom: 4),
      alignment: Alignment(0, 0),
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [new Color(0xFF0F8F00), new Color(0xFF5AB403)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(text,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22)
      )
  );
}
