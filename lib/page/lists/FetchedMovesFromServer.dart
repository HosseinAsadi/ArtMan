import 'dart:io';
import 'package:art_man/components/ImageAbout/GenerateThumbnails.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';

import 'package:video_thumbnail/video_thumbnail.dart';
import 'dart:ui' as ui show Image;
// package publish gives warning for those imports
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:lazy_load_scrollview/lazy_load_scrollview.dart';
import 'package:video_thumbnail/video_thumbnail.dart';

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
  bool isfirst=true,complete=true;
  int oldmove=moves.length;


  final int increment = 8;
  bool isLoading = false;

  _FetchedMovesFromServerState(this.numberclass, this.route,
      {this.color, this.radius});

 @override
  void initState() {
    super.initState();
    getdirectory();
    _loadMore();

  }

  Future _loadMore() async {
    setState(() {
      isLoading = true;
    });

    if(moves.length!=oldmove){
      resetlist();

    }
    // Add in an artificial delay


    for (var i = currentLength; i <= currentLength + increment && i<moves.length; i++) {
      print(directory);
     /* File f=new File( "$directory/${moves[i].videourl.split("/").last.replaceAll("mp4", "png")}");
     if(!f.existsSync())
    await getimage("${strings.baseurl}/videos/${moves[i].videourl}");*/
      data.add(i);
    }
    await new Future.delayed(const Duration(seconds: 2));
    setState(() {
      isLoading = false;
      currentLength = data.length;
      oldmove=moves.length;
    });
  }
  resetlist(){
   setState(() {
     currentLength=0;
     data.length==0;
   });
  }
  getdirectory()async{
    String dir= (await getTemporaryDirectory()).path;
    setState(() {
      directory=dir;
    });
  }



  @override
  Widget build(BuildContext context) {

    return moves.length==0?Text("        هیچ حرکتی یافت نشد       ",style: TextStyle(color: Colors.black),):LazyLoadScrollView(
        isLoading: isLoading,
        onEndOfPage: () => _loadMore(),
    child: ListView.builder(
    itemCount:data.length,
    itemBuilder: (context, position) {
    return _buildProductItem(context,position);
    },
    ));
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
                  child: ClipRRect(//File("$directory/${moves[index].videourl.split("/").last.replaceAll("mp4", "png")}")
                  child:Image.asset("assets/images/muscle/7.jpg",fit: BoxFit.cover,),

                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                ),
                Expanded(

                  flex: 1,

                  child: Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 7),
                    child: Column(
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
                    )
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


