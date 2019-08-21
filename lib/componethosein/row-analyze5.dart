import 'package:art_man/components/InputTexts/InputText.dart';
import 'package:art_man/components/Utility/Goals.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/Sicks.dart';
import 'package:flutter/material.dart';

class RowAnalyze5 extends StatefulWidget {
  String _title;
  bool _isSelected = false;
  String type;
  TextEditingController _controller;

  RowAnalyze5(this._title,this.type);

  TextEditingController get controller => _controller;

  @override
  State<StatefulWidget> createState() {
    RA ra = new RA(this._isSelected, this._title,type);
    this._controller = ra._controller;
    return ra;
  }
}


class RA extends State<RowAnalyze5> {
  bool _isSelected = false;
  String _title;
  String type;

  TextEditingController _controller = new TextEditingController();
  String text = ""; // empty string to carry what was there before it
  int maxLength = 15;

  RA(this._isSelected, this._title,this.type);

  TextEditingController get controller => _controller;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Row(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            width: 110,
            height: 30,
            padding: EdgeInsets.only(left: 5, right: 5, ),
            margin: EdgeInsets.only(left: 4,bottom: 5),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            child: Text(
              this._title,
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 9,
                  fontWeight: FontWeight.bold),
            ),
          ),

          GestureDetector(
            child: Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 4),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.done,
                size: 20,
                color: this._isSelected ? Colors.green : Colors.grey,
              ),
            ),
            onTap: () {
              setState(() {
                if(type=="sick"){
                  this._isSelected = true;
                  Sick sick=new Sick();
                  sick.name=_title;
                  sick.description=Kelid.getter(_title);
                  sick.selection=true;
                  setSick(sick);
                }
                if(type=="goal"){
                  this._isSelected = true;
                  Goal goal=new Goal();
                  goal.name=_title;
                  goal.description=Kelid.getter(_title);
                  goal.selection=true;
                  setGoal(goal);
                }
              });
            },
          ),
          GestureDetector(
            child: Container(
              margin: EdgeInsets.only(left: 4),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.close,
                size: 20,
                color: !this._isSelected ? Colors.red : Colors.grey,
              ),
            ),
            onTap: () {
              setState(() {
                this._isSelected = false;
              });
            },
          ),
          Expanded(
            child:Container(
              height: 35,
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(bottom: 5),
              padding: EdgeInsets.only(right: 7),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: InputText("توضیحات ...",_title
                ,textAlign: TextAlign.right
                ,maxlenght: 60.0,hintsize: 11.0,maxlines: 2,)
          )),
        ],
      ),
    );
  }

}
