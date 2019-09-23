import 'package:art_man/page/lists/AnalyzesList.dart';
import 'package:flutter/material.dart';

class ProfileButtone extends StatefulWidget{
  String _text, _navigatorPush;
  IconData _icon;
  Color _color;
  Function callback;

  ProfileButtone(this._text, this._icon, this._color, this._navigatorPush,{this.callback});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PBe(this._text, this._icon, this._color, this._navigatorPush);
  }

}

class PBe extends State<ProfileButtone>{
  String _text, _navigatorPush;
  IconData _icon;
  Color _color;

  PBe(this._text, this._icon, this._color, this._navigatorPush);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(bottom: 10, ),
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
        decoration: BoxDecoration(
          color: _color,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(right: 3,left: 7),
              child: Icon(_icon,color: Colors.white,size: 40,),
            ),

            Expanded(
              flex: 1,
              child: Text(_text,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white,
                  fontSize: 17,

                  fontWeight: FontWeight.bold
                ),
              ),
            )
          ],
        ),
      ),
      onTap: (){
        setState(() {
          if(_text=="آنالیزهای هنرجو"){
            Navigator.push(context, MaterialPageRoute(builder: (contex)=>AnalyzeList(
              username: this.widget.callback(),)));
          }
          else
          Navigator.pushNamed(context, this._navigatorPush);
        });
      },
    );
  }

}