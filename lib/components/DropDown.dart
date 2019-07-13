import 'package:flutter/material.dart';


class DropDown extends StatefulWidget {
  String _hint;
  DropDown(this._hint);
  @override
  myDropDown createState() {
    // TODO: implement createState
    return myDropDown(_hint);
  }
}
class myDropDown extends State<DropDown> {
  String cityvalue=null;
  String _hint;
  myDropDown(this._hint);
  @override
  Widget build(BuildContext context) {

    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top:7,bottom: 7 ),
        padding: EdgeInsets.only(right: 15,left: 15),
        height: 40.0,
        decoration: BoxDecoration(
            color: Colors.white ,
            borderRadius: BorderRadius.circular(20)
        ),


        child:DropdownButton<String>(
          items: ["نیجریه","عربستان","ترکیه","آلمان","ایران"].map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
          onChanged: (String newValue) {
            setState(() {
              this.cityvalue = newValue;
            });
          },
          value: cityvalue,
          isExpanded: true,
          underline: Text(""),
          icon: Icon(IconData(0xe900,fontFamily: "icone"),color: Colors.green,size: 18,),
          hint: Text(
            _hint,
            style: TextStyle(color: Colors.grey, fontSize: 13),
          ),
        )

    );
  }
}








