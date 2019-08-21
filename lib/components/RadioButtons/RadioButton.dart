import 'package:art_man/components/Utility/AbnormalcyProblems.dart';
import 'package:art_man/components/Utility/DigestionProblems.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:flutter/material.dart';



class CustomRadio extends StatefulWidget {
  List<String> items;
  String id;
  bool isradio;
  CustomRadio(this.items,this.id,this.isradio);
  @override
  createState() {
    return  CustomRadioState(items,id,isradio);
  }
}

class CustomRadioState extends State<CustomRadio> {
  List<String> items;
  String id;
  bool isradio;


  CustomRadioState(this.items,this.id,this.isradio);
  List<RadioModel> sampleData = new List<RadioModel>();

  @override
  void initState() {

    super.initState();
    for(int i=0;i<items.length;i++)
    sampleData.add(new RadioModel(false, '', items[i]));
  }

  @override
  Widget build(BuildContext context) {
    return  new ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: sampleData.length,
        itemBuilder: (BuildContext context, int index) {
          return new GestureDetector(

            onTap: () {
              setState(() {
                if(isradio){
                  sampleData.forEach((element) => element.isSelected = false);
                  sampleData[index].isSelected = true;
                  Kelid.setter(id, "alergy entered");
                }
                else{
                  if(index==sampleData.length-1){
                    sampleData.forEach((element) => element.isSelected = false);
                    sampleData[index].isSelected = true;
                    if(id=="digestion"){
                      setDigestion(items[index]);
                      Kelid.setter(id, "digestion entered");
                    }
                    if(id=="abnormalcy"){
                      setAbnormalacy(items[index]);
                      Kelid.setter(id, "abnormalcy entered");
                    }

                  }
                  else{
                    sampleData[index].isSelected = true;
                    sampleData[sampleData.length-1].isSelected = false;
                    if(id=="digestion"){
                      setDigestion(items[index]);
                      Kelid.setter(id, "digestion entered");
                    }
                    if(id=="abnormalcy"){
                      setAbnormalacy(items[index]);
                      Kelid.setter(id, "abnormalcy entered");
                    }
                  }
                }

              });
            },
            child: new RadioItem(sampleData[index]),
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
      child:  Row(

        children: <Widget>[
          Container(
            height: 15.0,
            width: 15.0,

            child: new Center(
              child: new Text(_item.buttonText,
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
              border: new Border.all(
                  width: 0.3,
                  color: _item.isSelected
                      ? Colors.green
                      : Colors.grey),
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
  final String buttonText;
  final String text;

  RadioModel(this.isSelected, this.buttonText, this.text);
}