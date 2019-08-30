import 'package:art_man/components/Lists/FlexableList.dart';
import 'package:art_man/components/Utility/Keys.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/lists/LisviewGenerator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';





class ListInputText extends StatefulWidget {
  String _hint, id;
  double height;
  TextEditingController ctrl;
  Color brdercolor;
  double brderwidth;
  double radius;
  double margintop;
  TextAlign textAlign;
  int maxlines;
  Color hintconlor;
  double hintsize;
  double maxlenght;
  List<TeacherInfo> newlistsearch;


  ListInputText(this.newlistsearch,this._hint, this.id,
      {this.height,
        this.brdercolor,
        this.brderwidth,
        this.margintop,
        this.radius,
        this.textAlign,
        this.maxlines,
        this.hintconlor,
        this.hintsize,
        this.maxlenght});

  @override
  myListInputText createState() {
    myListInputText it = new myListInputText(newlistsearch,id,_hint,
        height: height,
        brdercolor: brdercolor,
        brderwidth: brderwidth,
        margintop: margintop,
        radius: radius,
        maxlines: maxlines,
        hintconlor: hintconlor,
        alignment: textAlign,
        hintsize: hintsize,
        maxlenght: maxlenght);
    return it;
  }
}

class myListInputText extends State<ListInputText> {
  String _hint;
  String id;
  double height;
  Color brdercolor;
  double brderwidth;
  double radius;
  double margintop;
  TextAlign alignment;
  int maxlines;
  Color hintconlor;
  double hintsize;
  double maxlenght;
  String teacherid;
  bool positionshow=false;
  List<TeacherInfo> newlistsearch;

  myListInputText(this.newlistsearch,this.id,this._hint,
      {this.height,

        this.brdercolor,
        this.brderwidth,
        this.margintop,
        this.radius,
        this.alignment,
        this.maxlines,
        this.hintsize,
        this.hintconlor,
        this.maxlenght});

  var ctrl = new TextEditingController();
     final myController = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Stack(
      children: <Widget>[
        Container(
         
          alignment: Alignment.center,
          margin: EdgeInsets.only(
            top: margintop == null ? 1.0 : margintop,
          ),
          padding: EdgeInsets.only(right: 3),
          height: height == null ? 40.0 : height,
          decoration: BoxDecoration(
              border: Border.all(
                  color: brdercolor == null ? Colors.white : brdercolor,
                  width: brderwidth == null ? 0.0 : brderwidth),
              color: Colors.white,
              borderRadius: BorderRadius.circular(radius == null ? 25 : radius)),
          child: TextField(
            controller: myController,
            inputFormatters: [
              new LengthLimitingTextInputFormatter(maxlenght==null?30:maxlenght.toInt()),
            ],
            onChanged: (value){
              Kelid.setter(id, value);
              print(Kelid.getter(id));
              setState(() {
                positionshow=true;
                print("position showed");

              });

            },
            textAlign: alignment == null ? TextAlign.right : alignment,
            maxLines: maxlines==null?1:maxlines,

            style: TextStyle(
              fontSize: hintsize==null?14:hintsize,
            ),

            textDirection: TextDirection.rtl,



            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: const EdgeInsets.all(0.0),
                hintText: _hint,
                errorStyle: TextStyle(height: 0),
                hintStyle: TextStyle(

                    color: hintconlor == null ? Colors.grey : hintconlor,
                    fontSize: hintsize == null ? 13 : hintsize)),
          ),
        ),
       positionshow? Container(
            margin: EdgeInsets.only(top: 60),
            height: (40*newlistsearch.length).toDouble()+newlistsearch.length.toDouble()+20,
            child:  ListView.builder(
              reverse: false,
              itemBuilder: _buildProductItem,
              itemCount: newlistsearch.length,
            ),
          )
        :Container(height: 0,width: 0,)
      ],
    );
  }
  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
        child: ListTile(
          onTap: () {
            setState(() {
              teacherid=newlistsearch[index].username;
              positionshow=false;
              myController.text=teacherid;
              Kelid.setter(id, teacherid);
              print("id saved id =="+teacherid);
            });

          },
          leading: Container(
            width: 40,
            height: 40,
            child: ClipRRect(
              child: "" == "${newlistsearch[index].imageprofile}"
                  ? Image.asset("assets/images/morabi.jpeg")
                  : Image.network(
                  "${newlistsearch[index].imageprofile}"),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
          ),
          title: Text(
            "${newlistsearch[index].username}",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          subtitle: Text("${newlistsearch[index].name}",
              style: TextStyle(color: Colors.black, fontWeight: FontWeight.normal)),
        ));
  }
}

