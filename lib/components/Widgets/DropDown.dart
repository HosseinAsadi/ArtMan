import 'package:art_man/components/Utility/CityOfCountrys.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  String _hint, id,value;
  List<String> list;
  double fontsize;
  Color backgroundColor, fontcolor, arrowcolor;
  Function callback;

  DropDown(this.id, this.list, this._hint,
      {this.backgroundColor,
      this.fontcolor,
      this.arrowcolor,
      this.fontsize,
      this.callback,
      this.value});

  @override
  myDropDown createState() {
    return myDropDown(id, list, _hint,
        backgroundColor: backgroundColor,
        fontcolor: fontcolor,
        arrowcolor: arrowcolor,
        fontsize: fontsize,
    value: value);
  }
}

class myDropDown extends State<DropDown> {
  String cityvalue = null;
  String _hint, id,value;
  List<String> list;
  double fontsize;

  Color backgroundColor, fontcolor, arrowcolor;

  myDropDown(this.id, this.list, this._hint,
      {this.backgroundColor, this.fontcolor, this.arrowcolor, this.fontsize,this.value});

  @override
  void initState() {
    super.initState();
  }

  @override
  void didUpdateWidget(DropDown oldWidget) {
      if (oldWidget.list != widget.list) {
        setState(() {
          list = cities;
        });
        print("rebuild in country is runned");
      }
  }


  @override
  Widget build(BuildContext context) {

    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top: 4, bottom: 7),
        padding: EdgeInsets.only(right: 15, left: 15),
        height: 40.0,
        decoration: BoxDecoration(
            color: backgroundColor == null ? Colors.white : backgroundColor,
            borderRadius: BorderRadius.circular(20)),
        child: DropdownButton<String>(
          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(fontSize: fontsize == null ? 13 : fontsize),
              ),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              if (id == "country") {
                this.widget.callback(newValue);
              }
              if (id == "sport tools") {
                this.widget.callback(newValue, id);
              }
              if (id == "muscle group") {
                this.widget.callback(newValue, id);
              }
              if (id == "field_sport") {
                this.widget.callback(newValue, id);
              }
              this.cityvalue = newValue;
              Kelid.setter(id, cityvalue);
            });
          },
          value: cityvalue,
          isExpanded: true,
          underline: Text(""),
          icon: Icon(
            IconData(0xe900, fontFamily: "icone"),
            color: arrowcolor == null ? Colors.green : arrowcolor,
            size: 18,
          ),
    hint: Text(
    value==null||value==""?_hint:value,
    style: TextStyle(
    color: value == null||value=="" ? Colors.grey : Colors.black,
    fontSize:  fontsize == null ? 13 : fontsize),
    ) ));
  }
}
