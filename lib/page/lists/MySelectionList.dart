import 'dart:io';
import 'package:art_man/components/ImageAbout/GenerateThumbnails.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Toast/OptionsDialogforSelect.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/page/SportPlan/ExtractSportName.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class MySelectionList extends StatefulWidget {
  MaterialPageRoute route;
  Color color;
  double radius;
  String numberclass;

  Function callback;

  MySelectionList(this.numberclass, this.callback,
      {this.route, this.color, this.radius});

  @override
  _MySelectionListState createState() =>
      _MySelectionListState(numberclass, route,
          color: color, radius: radius);
}

class _MySelectionListState extends State<MySelectionList> {
  Strings strings = new Strings();
  String numberclass;


  MaterialPageRoute route;
  Color color;
  double radius;
  String directory;

  OptionsDialog dialog;

  void setselection(bool isselection) {
    setState(() {
      selection = isselection;
    });
  }

  _MySelectionListState(this.numberclass, this.route,
      {this.color, this.radius});

  thumbnail(videourl, index) async {
    File f=new File( "$directory/${videourl.split("/").last.replaceAll("mp4", "png")}");

    if(!f.existsSync())
      await getimage(videourl);

  }

  @override
  void initState() {
    super.initState();
    dialog = OptionsDialog(this.setselection, this.widget.callback);
    getdirectory();

  }
  getdirectory()async{
    String dir= (await getTemporaryDirectory()).path;
    setState(() {
      directory=dir;
    });
  }
  @override
  Widget build(BuildContext context) {
    return
          ListView.builder(
            reverse: false,
            itemBuilder: _buildProductItem,
            itemCount: classes[int.parse(numberclass)].moves.length,
          );

  }

  Widget _buildProductItem(BuildContext context, int index) {

      thumbnail(classes[int.parse(numberclass)].moves[index].videourl,index);

    return GestureDetector(
      onLongPress: () {
        showDialog(
            context: context,
            builder: (_) => new AlertDialog(
                  contentPadding: EdgeInsets.all(0.0),
                  content:
                      OptionsDialog(this.setselection, this.widget.callback),
                ));
      },
      onTap: () {
        if ( selection==false) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ExtractSportName(
                      currentclass: numberclass,
                      currentmove: index.toString())));
        }
        if(selection){
          setState(() {
            classes[int.parse(numberclass)].moves[index].isselectedfor=true;

          });
        }

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
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 10,right: 7),
                width: 40,
                height: 40,
                child: ClipRRect(
                  child: Image.file(new File("$directory/${classes[int.parse(numberclass)].moves[index].videourl.split("/").last.replaceAll("mp4", "png")}"),fit: BoxFit.cover),
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
              ),
              Container(
                width: 150,
                margin: EdgeInsets.only(right: 40),
                child: Column(
                  children: <Widget>[
                    Text("${classes[int.parse(numberclass)].moves[index].fa}",
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    Text(
                      "${classes[int.parse(numberclass)].moves[index].en}",
                      maxLines: 1,

                      style: TextStyle(
                          color: Colors.black, fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
              Container(
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(right: 10),
                  width: 50,
                  child: !classes[int.parse(numberclass)].moves[index].optionfilled
                      ? Text(
                          "ناقص",
                          style: TextStyle(
                              color: Colors.red,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        )
                      : Text(
                          "کامل",
                          style: TextStyle(
                              color: Colors.green,
                              fontSize: 11,
                              fontWeight: FontWeight.w500),
                        )),
              selection ==false
                  ? Container(
                      height: 0,
                      width: 0,
                    )
                  : Container(
                      width: 20,
                      margin: EdgeInsets.only(left: 20),
                      alignment: Alignment.center,
                      child: !classes[int.parse(numberclass)].moves[index].isselectedfor
                          ? Icon(
                              Icons.radio_button_unchecked,
                              size: 30,
                              color: Colors.grey[800],
                            )
                          : Icon(
                              Icons.check_circle_outline,
                              color: Colors.blue[800],
                              size: 30,
                            ),
                    ),
            ],
          )),
    );
  }

}
