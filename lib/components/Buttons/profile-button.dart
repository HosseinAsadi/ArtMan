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
    return PB(this._text, this._icon, this._color, this._navigatorPush);
  }
}

class PB extends State<ProfileButton>{
  String _text, _navigatorPush;
  IconData _icon;
  Color _color,temp;

  PB(this._text, this._icon, this._color, this._navigatorPush);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
              margin: EdgeInsets.only(right: 10),
              padding: EdgeInsets.all(3),
              child: Icon(_icon,color: Colors.white,),
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
      onTapDown: (Details){
        setState(() {

          temp=_color;
          _color=_color.withOpacity(0.3);
        });

      },
      onTapUp: (Details){
        setState(() {
          _color=temp;
        });

      },

      onTap: (){

        setState(() {


          if(_text=="خروج از حساب کاربری"){
            print("exiting runned");
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
          if(_text=="برنامه تمرینی / غذایی"){
            Navigator.pushNamed(context, _navigatorPush);
          }
          if(_text=="دسته بندی"){
            Navigator.pushNamed(context, _navigatorPush);
          }

        });
      },
    );
  }
}