import 'package:art_man/components/ImageAbout/GenerateThumbnails.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Toast/OptionsDialogforSelect.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:art_man/page/SportPlan/ExtractSportName.dart';
import 'package:flutter/material.dart';

class ListViewClass extends StatefulWidget {
  MaterialPageRoute route;
  Color color;
  double radius;
  String id,classnumber;
  List<Moveslist> newlistsearch;
  Function callback;


  ListViewClass(this.callback,this.newlistsearch,
      {this.route, this.color, this.radius, this.id,this.classnumber});

  @override
  _ListViewClassState createState() =>
      _ListViewClassState(newlistsearch, route,
        color: color, radius: radius, id: id,classnumber:classnumber);
}

class _ListViewClassState extends State<ListViewClass> {
  Strings strings = new Strings();
  List<Moveslist> newlistsearch;
  MaterialPageRoute route;
  Color color;
  double radius;
  String id;
  String selection;
  String classnumber;
  OptionsDialog dialog;
  void setselection(String isselection) {
    setState(() {
      this.selection = isselection;
      print("selection runned0 "+selection.toString());
    });
  }
  _ListViewClassState(this.newlistsearch, this.route,
      {this.color, this.radius, this.id,this.classnumber});

  thumbnail(videourl, index) async {
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
  void initState() {
    super.initState();
    dialog = OptionsDialog(this.setselection,this.widget.callback);

  }
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
                    content: OptionsDialog(this.setselection,this.widget.callback),
                  )
              );
            },
            onTap: (){
              Navigator.push(context, 
              MaterialPageRoute(builder:(context) => ExtractSportName(currentclass:classnumber,currentmove:index.toString())));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(right: 10),
                    width: 50,child: !newlistsearch[index].optionfilled?
                  Text("ناقص",style: TextStyle(color: Colors.red,fontSize: 11),):
                Text("کامل",style: TextStyle(color: Colors.green,fontSize: 11),)),
                selection==null?Container(height: 0,width: 0,):Container(width: 20,
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.center,
                  child: IconButton(icon: !newlistsearch[index].selectfordelete? Icon(Icons.radio_button_unchecked,size: 30,color: Colors.grey[800],):
                  Icon(Icons.check_circle_outline,color: Colors.blue[800],size: 30,),
                      onPressed: (){
                        selectionMovesForRemove.add(index);
                        setState(() {
                          newlistsearch[index].selectfordelete=!newlistsearch[index].selectfordelete;
                        });
                      }),)
              ],
            )
        ),
      );
  }
}
