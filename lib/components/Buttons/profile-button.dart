import 'package:art_man/components/Toast/VeryfiyDialog.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/page/lists/MyStudents.dart';
import 'package:flutter/material.dart';

class ProfileButton extends StatefulWidget{
  String _text, _navigatorPush;
  IconData _icon;
  Color _color;
  Function callback;

  ProfileButton(this._text, this._icon, this._color, this._navigatorPush,{this.callback});

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
    return InkWell(
      child: Container(
        height: 60,
        alignment: Alignment.centerRight,
        margin: EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(3),
              child: Icon(_icon),
            ),
            Expanded(
              flex:1,
           child: Container(
              alignment: Alignment.center,
              child: Text(_text,
                style: TextStyle(color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
            )
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
          if(_text=="لیست هنرجویان"){
           Navigator.push(context, MaterialPageRoute(builder: (context)=>MyStudents(userslist: this.widget.callback(),)));
          }
          else
          Navigator.pushNamed(context, _navigatorPush);
        });
      },
    );
  }
}