import 'package:art_man/components/ImageAbout/GenerateThumbnails.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/profile/StudentReadOnlyProfile.dart';
import 'package:art_man/page/profile/TeacherProfileReadOnly.dart';
import 'package:flutter/material.dart';

class ListViewGenerator extends StatefulWidget {
  List<TeacherInfo> newlistsearch;
  MaterialPageRoute route;
  Color color;
  double radius;
  String id;

  ListViewGenerator(this.newlistsearch,
      {this.route, this.color, this.radius, this.id});

  @override
  _ListViewGeneratorState createState() =>
      _ListViewGeneratorState(newlistsearch, route,
          color: color, radius: radius, id: id);
}

class _ListViewGeneratorState extends State<ListViewGenerator> {
  Strings strings = new Strings();
  List<TeacherInfo> newlistsearch;
  MaterialPageRoute route;
  Color color;
  double radius;
  String id;
  String type;

  _ListViewGeneratorState(this.newlistsearch, this.route,
      {this.color, this.radius, this.id});



  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        reverse: false,
        itemBuilder: _buildProductItem,
        itemCount: newlistsearch.length,

    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
          return Card(
              child: ListTile(
              onTap: () async{
                String type=await gettype();
                print(type);
             type=="teachers"?Navigator.push(context, MaterialPageRoute(builder:
             (context)=>StudentProfileReadOnly(username: "${newlistsearch[index].username}",))):
             Navigator.push(
                    context,
                     MaterialPageRoute(
                            builder: (context) => TeacherProfileReadOnly(
                                  text: "${newlistsearch[index].username}",
                                ),
                          )
             );
              },
              leading: Container(
                width: 40,
                height: 40,
                child: ClipRRect(
                  child: "" == "${newlistsearch[index].imageprofile}"
                      ? Image.asset("assets/images/morabi.jpeg")
                      : Image.network("${newlistsearch[index].imageprofile}"),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              title: Text(
                "${newlistsearch[index].username}",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              subtitle: Text("${newlistsearch[index].name}",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.normal)),
            ))
         ;
  }
}
