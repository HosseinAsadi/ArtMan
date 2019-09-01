import 'package:art_man/components/ImageAbout/GenerateThumbnails.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Toast/OptionsDialogforSelect.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/SportPlan/ExtractSportName.dart';
import 'package:flutter/material.dart';

class ListViewClass extends StatefulWidget {
  MaterialPageRoute route;
  Color color;
  double radius;
  String id;
  List<Moveslist> newlistsearch;
  ListViewClass(this.newlistsearch,
      {this.route, this.color, this.radius, this.id});

  @override
  _ListViewClassState createState() =>
      _ListViewClassState(newlistsearch, route,
        color: color, radius: radius, id: id,);
}

class _ListViewClassState extends State<ListViewClass> {
  Strings strings = new Strings();
  List<Moveslist> newlistsearch;
  MaterialPageRoute route;
  Color color;
  double radius;
  String id;

  _ListViewClassState(this.newlistsearch, this.route,
      {this.color, this.radius, this.id});

  thumbnail(videourl,index) async {
    String image = await getImageThumbnail(videourl);
    Moveslist teacherInfo = new Moveslist();
    teacherInfo.fa = newlistsearch[index].fa;
    teacherInfo.en = newlistsearch[index].en;
    teacherInfo.description = newlistsearch[index].description;
    teacherInfo.muscles = newlistsearch[index].muscles;
    teacherInfo.equipment = newlistsearch[index].equipment;
    teacherInfo.exercise = newlistsearch[index].exercise;
    teacherInfo.isselected = newlistsearch[index].isselected;
    teacherInfo.videourl = image;
    newlistsearch[index] = teacherInfo;
    print("thumbnail generated and uri is :" + image);
  }
  @override

  @override
  Widget build(BuildContext context) {

    return  ListView.builder(
      reverse: false,
      itemBuilder: _buildProductItem,
      itemCount: newlistsearch.length,

    );
  }

  Widget _buildProductItem(BuildContext context, int index) {
    if (id == "sports")
      //thumbnail(newlistsearch[index].imageprofile, index);//convert video to image thumbnail
      return Container(
        alignment: Alignment.center,
        height: 50,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color == null ? Colors.white : color,
          borderRadius: BorderRadius.all(
              Radius.circular(radius == null ? 3.0 : radius)),
        ),
        child:GestureDetector(
            onLongPress: (){
              showDialog(
                  context: context,
                  builder: (_) => new AlertDialog(
                    contentPadding: EdgeInsets.all(0.0),
                    content: OptionsDialog(),
                  )
              );
            },
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExtractSportName(classnumber: (index+1).toString(),),
                  ));
            },
            /*onTapDown: (Details){
              setState(() {
                if()
                color=Colors.white.withOpacity(0.2);
              });
            },*/
            onTapUp: (Details){
              setState(() {
                color=Colors.white;
              });
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(left: 20),
                  width: 40,
                  height: 40,
                  child: ClipRRect(
                    child: Image.asset("assets/images/morabi.jpeg"),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 40),
                  child:  Column(
                    children: <Widget>[
                      Text("${newlistsearch[index].fa}",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text(
                        "${newlistsearch[index].en}",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),),


              ],
            )
        ),
      );
  }
}
