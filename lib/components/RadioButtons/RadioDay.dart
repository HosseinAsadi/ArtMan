import 'package:art_man/components/Utility/AbnormalcyProblems.dart';
import 'package:art_man/components/Utility/DigestionProblems.dart';
import 'package:art_man/components/Utility/FoodPlanClasses.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:flutter/material.dart';



class RadioDay extends StatefulWidget {
  List<RadioModel> items;
  String id;

  RadioDay(this.items,this.id);
  @override
  createState() {
    return  RadioDayState(items,id);
  }
}

class RadioDayState extends State<RadioDay> {
  List<RadioModel> items;
  String id;


  RadioDayState(this.items,this.id);



  List<String> items2;
  Seperator(){
    items2=new List();
    for(int i=0;i<items.length;i++){
      if(items[i].isSelected)
        items2.add(items[i].text);
    }
  }

  @override
  Widget build(BuildContext context) {

    return  new ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return new GestureDetector(

          onTap: () {
            setState(() {


                if(index==items.length-1){
                  items.forEach((element) => element.isSelected = false);
                  items[index].isSelected = true;

                  if(id=="days"){
                    Seperator();

                    setDays(items2);
                    Kelid.setter(id, "days entered");
                  }
                }
                else{
                  items[index].isSelected = true;
                  items[items.length-1].isSelected = false;

                  if(id=="days"){
                    Seperator();
                    setDays(items2);
                    Kelid.setter(id, "days entered");
                  }
                }


            });
          },
          child: new RadioItem(items[index]),
        );
      },

    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;
  RadioItem(this._item);
  @override
  Widget build(BuildContext context) {

    return  Container(
      margin: EdgeInsets.all(2),
      decoration: new BoxDecoration(
        color: 
             Colors.green.withOpacity(0.3)
            ,
        borderRadius:  BorderRadius.all( Radius.circular(30.0)),
      ),
      child:  Row(
        children: <Widget>[
          Container(
            height: 15.0,
            width: 15.0,
margin: EdgeInsets.all(3),
            child: new Center(
              child: new Text("",
                  style: new TextStyle(
                      color:
                      _item.isSelected ? Colors.white : Colors.black,
                      //fontWeight: FontWeight.bold,
                      fontSize: 18.0)),
            ),
            decoration: new BoxDecoration(
              color: _item.isSelected
                  ? Colors.green
                  : Colors.white,
              borderRadius:  BorderRadius.all( Radius.circular(10.0)),
            ),

          ),
          Container(

            margin: new EdgeInsets.only(left: 5.0,right: 1.0),
            child: new Text(_item.text,style: TextStyle(color: Colors.white,fontSize: 10),),
          )
        ],
      ),
    );
  }
}

class RadioModel {
   bool isSelected;
   String text;


}