import 'package:flutter/material.dart';


class DropDown extends StatefulWidget {
  String _hint;
  Color backgroundColor,fontcolor,arrowcolor;
  DropDown(this._hint,{this.backgroundColor,this.fontcolor,this.arrowcolor});
  @override
  myDropDown createState() {
    return myDropDown(_hint,backgroundColor: backgroundColor,fontcolor: fontcolor,arrowcolor: arrowcolor);
  }
}
class myDropDown extends State<DropDown> {
  String cityvalue=null;
  String _hint;
  Color backgroundColor,fontcolor,arrowcolor;

  myDropDown(this._hint,{this.backgroundColor,this.fontcolor,this.arrowcolor});
  @override
  Widget build(BuildContext context) {

    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(top:4,bottom: 7 ),
        padding: EdgeInsets.only(right: 15,left: 15),
        height: 40.0,
        decoration: BoxDecoration(
            color:backgroundColor==null? Colors.white:backgroundColor ,
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
          icon: Icon(IconData(0xe900,fontFamily: "icone"),color:arrowcolor==null? Colors.green:arrowcolor,size: 18,),
          hint: Text(
            _hint,
            style: TextStyle(color:fontcolor==null? Colors.grey:fontcolor, fontSize: 13),
          ),
        )

    );
  }
}








