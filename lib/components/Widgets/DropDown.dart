import 'package:art_man/components/Utility/CityOfCountrys.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/ListMoves.dart';
import 'package:flutter/material.dart';

class DropDown extends StatefulWidget {
  String _hint,id;
  List<String> list;
  double fontsize;
  Color backgroundColor,fontcolor,arrowcolor;
  DropDown(this.id,this.list,this._hint,{this.backgroundColor,this.fontcolor,this.arrowcolor,this.fontsize});
  @override
  myDropDown createState() {
    return myDropDown(id,list,_hint,backgroundColor: backgroundColor,fontcolor: fontcolor,arrowcolor: arrowcolor,fontsize :fontsize);
  }
}
class myDropDown extends State<DropDown> {
  String cityvalue=null;
  String _hint,id;
  List<String> list;
  double fontsize;
  CityOfCountrys cities;
  Color backgroundColor,fontcolor,arrowcolor;

  myDropDown(this.id,this.list,this._hint,{this.backgroundColor,this.fontcolor,this.arrowcolor,this.fontsize});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(Kelid.getter(id)=="city"){
       cities=new CityOfCountrys();
      list=cities.getCities(Kelid.getter("country"));
    }
  }
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

          items: list.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value,style: TextStyle(fontSize:fontsize==null?14: fontsize),),
            );
          }).toList(),

          onChanged: (String newValue) {
            setState(() {
              if(Kelid.getter(id)=="country"){
                cities=new CityOfCountrys();
                list=cities.getCities(Kelid.getter("country"));
              }
              if(id=="sport tools"){
                filterTools(newValue);
              }
              if(id=="muscle group"){
                filterMuscles(newValue);
              }

              this.cityvalue = newValue;
              Kelid.setter(id, cityvalue);

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








