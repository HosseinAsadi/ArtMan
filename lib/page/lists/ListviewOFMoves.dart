import 'package:art_man/components/ImageAbout/GenerateThumbnails.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/components/Utility/ListMoves.dart';
import 'package:art_man/components/Utility/TeacherInfoForSearch.dart';
import 'package:flutter/material.dart';

class ListViewMoves extends StatefulWidget {
  MaterialPageRoute route;
  Color color;
  double radius;
  String id;

  ListViewMoves(
      {this.route, this.color, this.radius, this.id});

  @override
  _ListViewMovesState createState() =>
      _ListViewMovesState( route,
          color: color, radius: radius, id: id);
}

class _ListViewMovesState extends State<ListViewMoves> {
  Strings strings = new Strings();
  List<Moveslist> newlistsearch=getMoveList();
  MaterialPageRoute route;
  Color color;
  double radius;
  String id;

  _ListViewMovesState( this.route,
      {this.color, this.radius, this.id});

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
      return InkWell(
        onTap: (){
          setState(() {
            if(newlistsearch[index].isselected)
            {
              Moveslist teacherInfo = new Moveslist();
              teacherInfo.fa = newlistsearch[index].fa;
              teacherInfo.en = newlistsearch[index].en;
              teacherInfo.description = newlistsearch[index].description;
              teacherInfo.muscles = newlistsearch[index].muscles;
              teacherInfo.equipment = newlistsearch[index].equipment;
              teacherInfo.exercise = newlistsearch[index].exercise;
              teacherInfo.isselected = false;
              teacherInfo.videourl = newlistsearch[index].videourl;
              newlistsearch[index] = teacherInfo;
            }
            else{
              Moveslist teacherInfo = new Moveslist();
              teacherInfo.fa = newlistsearch[index].fa;
              teacherInfo.en = newlistsearch[index].en;
              teacherInfo.description = newlistsearch[index].description;
              teacherInfo.muscles = newlistsearch[index].muscles;
              teacherInfo.equipment = newlistsearch[index].equipment;
              teacherInfo.exercise = newlistsearch[index].exercise;
              teacherInfo.isselected = true;
              teacherInfo.videourl = newlistsearch[index].videourl;
              newlistsearch[index] = teacherInfo;
            }

          });
        },
       child: Container(
        alignment: Alignment.center,
        height: 50,
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: color == null ? Colors.white : color,
          borderRadius: BorderRadius.all(
              Radius.circular(radius == null ? 3.0 : radius)),
        ),


            child:  Row(
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
                  margin: EdgeInsets.only(left: 30),
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

                Container(width: 20,
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.center,
                  child: IconButton(icon: !newlistsearch[index].isselected? Icon(Icons.radio_button_unchecked,size: 30,color: Colors.grey[800],):
                  Icon(Icons.check_circle_outline,color: Colors.blue[800],size: 30,),
                      onPressed: null),)
              ],
            )),
      );
  }
}