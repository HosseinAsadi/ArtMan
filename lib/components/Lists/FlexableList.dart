import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:flutter/material.dart';
class FlexableList extends StatefulWidget {
  List<TeacherInfo> newlistsearch;
  FlexableList(this.newlistsearch);
  @override
  _FlexableListState createState() => _FlexableListState(newlistsearch);
}

class _FlexableListState extends State<FlexableList> {
  List<TeacherInfo> newlistsearch;
  String Teacherid;
  _FlexableListState(this.newlistsearch,);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: (40*newlistsearch.length+newlistsearch.length).toDouble(),
      child: null
    );
  }
  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
        child: ListTile(
          onTap: () {
            setState(() {
              Teacherid=  newlistsearch[index].username;
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
