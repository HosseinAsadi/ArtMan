import 'package:art_man/components/Toast/VeryfiyDialog.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatefulWidget{
  String _text, _navigatorPush;
  IconData _icon;
  Color _color;

  ProfileButton(this._text, this._icon, this._color, this._navigatorPush);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PB(this._text, this._icon, this._color, this._navigatorPush);
  }

}

class PB extends State<ProfileButton>{
  String _text, _navigatorPush;
  IconData _icon;
  Color _color;

  PB(this._text, this._icon, this._color, this._navigatorPush);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Icon(_icon),
            Container(
              width: 220,
              height: 60,
              child: Text(_text,
                style: TextStyle(color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
      onTap: (){
        print("exiting runned");
        setState(() {
          if(_text=="خروج از حساب کاربری"){
            showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  contentPadding: EdgeInsets.all(0.0),
                  content: VerifyDialog("آیامطمئنید می خواهید از حساب کاربری خود خارج شوید؟",id:"remove"),)
            );
          }
          else
          Navigator.pushNamed(context, _navigatorPush);
        });
      },
    );
  }
}