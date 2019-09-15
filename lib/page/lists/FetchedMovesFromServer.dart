import 'dart:io';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class FetchedMovesFromServer extends StatefulWidget {
  MaterialPageRoute route;
  Color color;
  double radius;
  String numberclass;

  FetchedMovesFromServer(this.numberclass,
      {this.route, this.color, this.radius});

  @override
  _FetchedMovesFromServerState createState() =>
      _FetchedMovesFromServerState( numberclass,route,
          color: color, radius: radius);
}

class _FetchedMovesFromServerState extends State<FetchedMovesFromServer> {
  Strings strings = new Strings();
  MaterialPageRoute route;
  Color color;
  String directory;
  double radius;
  String numberclass;


  _FetchedMovesFromServerState(this.numberclass, this.route,
      {this.color, this.radius});

 @override
  void initState() {
    super.initState();
    getdirectory();
  }
  getdirectory()async{
    String dir= (await getApplicationDocumentsDirectory()).path;
    setState(() {
      directory=dir;
    });
  }

  @override
  Widget build(BuildContext context) {

    return  ListView.builder(
      reverse: false,
      itemBuilder: _buildProductItem,
      itemCount: moves.length,

    );
  }

  Widget _buildProductItem(BuildContext context, int index) {

      return InkWell(
        onTap: (){
          setState(() {
            if(moves[index].isselected)
            {
              Moveslist teacherInfo = new Moveslist();
              teacherInfo.fa = moves[index].fa;
              teacherInfo.en = moves[index].en;
              teacherInfo.description = moves[index].description;
              teacherInfo.muscles = moves[index].muscles;
              teacherInfo.equipment = moves[index].equipment;
              teacherInfo.exercise = moves[index].exercise;
              teacherInfo.isselected = false;
              teacherInfo.videourl = moves[index].videourl;
              moves[index] = teacherInfo;
            }
            else{
              Moveslist teacherInfo = new Moveslist();
              teacherInfo.fa = moves[index].fa;
              teacherInfo.en = moves[index].en;
              teacherInfo.description = moves[index].description;
              teacherInfo.muscles = moves[index].muscles;
              teacherInfo.equipment = moves[index].equipment;
              teacherInfo.exercise = moves[index].exercise;
              teacherInfo.isselected = true;
              teacherInfo.videourl = moves[index].videourl;
              moves[index] = teacherInfo;
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
                  margin: EdgeInsets.only(left: 10,right: 7),
                  width: 40,
                  height: 40,
                  child: ClipRRect(// ${classes[int.parse(numberclass)].moves[index].videourl.split(".").first}
                  child: Image.file(new File("$directory/424d70026cf77ed82aec24c04ad785ee16880451-480p__49173.png"),fit: BoxFit.cover,),
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  margin: EdgeInsets.only(left: 30),
                  child:  Column(
                    children: <Widget>[
                      Text("${moves[index].fa}",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(

                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                      Text(
                        "${moves[index].en}",
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                        style: TextStyle(

                            color: Colors.black, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),),

                Container(width: 20,
                  margin: EdgeInsets.only(left: 20),
                  alignment: Alignment.center,
                  child: IconButton(icon: !moves[index].isselected? Icon(Icons.radio_button_unchecked,size: 30,color: Colors.grey[800],):
                  Icon(Icons.check_circle_outline,color: Colors.blue[800],size: 30,),
                      onPressed: null),)
              ],
            )),
      );
  }
}