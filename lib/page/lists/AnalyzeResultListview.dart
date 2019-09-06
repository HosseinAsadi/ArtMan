import 'dart:convert';

import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/Analyzes/Branch.dart';
import 'package:art_man/page/Analyzes/SummaryAnswer.dart';
import 'package:art_man/page/profile/TeacherProfileReadOnly.dart';
import 'package:flutter/material.dart';

class AnalyzeResultListview extends StatefulWidget {
  List<TeacherInfo> newlistsearch;
  MaterialPageRoute route;

  AnalyzeResultListview(this.newlistsearch, {this.route});
  @override
  _AnalyzeResultListviewState createState() => _AnalyzeResultListviewState(newlistsearch,route);
}

class _AnalyzeResultListviewState extends State<AnalyzeResultListview> {
  Strings strings=new Strings();
  List<TeacherInfo> newlistsearch;
  MaterialPageRoute route;
  _AnalyzeResultListviewState(this.newlistsearch,this.route);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      child:newlistsearch.length==0?Center(
        child: Container(child: Text("شما تا به حال هیچ آنالیزی انجام نداده اید"),),
      ) :new ListView.builder(
        reverse: false,
        itemBuilder: _buildProductItem,
        itemCount: newlistsearch.length,
      ),
    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
        child: ListTile(
          onTap: () {
            Navigator.push(
                context,
                route==null?MaterialPageRoute(
                  builder: (context) => Branch(index: "$index",date: newlistsearch[index].username,),
                ):route
            );

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
  getListfromJson(jsonString){
    String myJSON = jsonString;
    var json = jsonDecode(myJSON);
    var nameJson = json['name'];
  }
}
