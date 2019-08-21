import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/profile/TeacherProfileReadOnly.dart';
import 'package:flutter/material.dart';

class ListViewGenerator extends StatefulWidget {
  List<TeacherInfo> newlistsearch;


  ListViewGenerator(this.newlistsearch);
  @override
  _ListViewGeneratorState createState() => _ListViewGeneratorState(newlistsearch);
}

class _ListViewGeneratorState extends State<ListViewGenerator> {
  Strings strings=new Strings();
  List<TeacherInfo> newlistsearch;

  _ListViewGeneratorState(this.newlistsearch);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 80,
      child: new ListView.builder(
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
                MaterialPageRoute(
                  builder: (context) => TeacherProfileReadOnly(text: "${newlistsearch[index].username}",),
                ));

          },
          leading: Container(
            width: 40,
            height: 40,
            child: ClipRRect(
              child: "" == "${newlistsearch[index].imageprofile}"
                  ? Image.asset("assets/images/morabi.jpeg")
                  : Image.network(
                  "${strings.baseurl}/images/teachers/${newlistsearch[index].imageprofile}"),
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
