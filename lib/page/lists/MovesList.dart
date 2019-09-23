import 'dart:io';

import 'package:art_man/components/Animation/RightSlidePage.dart';
import 'package:art_man/components/ImageAbout/GenerateThumbnails.dart';
import 'package:art_man/components/Networking/FetchMoves.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/Categorylist.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/page/SportPlan/MuscleGroupList.dart';
import 'package:art_man/page/VideoAbout/VideoPlayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screen/screen.dart';
class ListMoves extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LM();
  }

}

class LM extends State<ListMoves> with SingleTickerProviderStateMixin {
  List<Moveslist> moveslist=new List();
  bool complete=false;
  String directory;
  @override
  void initState() {

    super.initState();
    getdirectory();
    getMovess();

  }
  getdirectory()async{
    String dir= (await getTemporaryDirectory()).path;
    setState(() {
      directory=dir;
    });
  }


  getMovess()async{
    Strings strings=new Strings();
    print("fetchmoves");

    Moves movess=await fetchMoves("${strings.baseurl}/admin/getsportingMoves");

      for(int i=0;i<movess.result.length;i++){
        if((movess.result[i].muscles==int.parse(muscleid) || movess.result[i].muscles==-1) && (movess.result[i].equipment==int.parse(toolid) || movess.result[i].equipment==-1) &&(movess.result[i].exercise==int.parse(fieldid) || movess.result[i].exercise==-1))
        {
          /*File f=new File( "$directory/${movess.result[i].videoURL.replaceAll(" ","%20").split("/").last.replaceAll("mp4", "png")}");
          if(!f.existsSync())
            await getimage("${strings.baseurl}/videos/${movess.result[i].videoURL.replaceAll(" ","%20")}");
*/
          Moveslist move=new Moveslist();
          move.fa=movess.result[i].fa;
          move.en=movess.result[i].en;
          move.videourl=movess.result[i].videoURL;
          moveslist.add(move);
        }
      }
    setState(() {
      complete=true;
    });
  }
  Future<Null> onWillPop(){
    Navigator.push(context, SlideRightRoute(page: MuscleGroupList()));

  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,

    ]);
    return new WillPopScope( onWillPop: onWillPop,
    child:Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          Center(
            child: InkWell(
                onTap: (){
                  setState(() {
                    state="fields";
                   Navigator.pushNamed(context, "/SportField");
                  });
                },
                child:Container(
                  height: 45,
                  alignment: Alignment.centerRight,
                  margin: EdgeInsets.only(right: 20),
                  child: Text(
                    "تنظیم مجدد         ",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12,fontWeight: FontWeight.w500),
                  ),
                )
            ),
          ),
        ],

        backgroundColor: Colors.green[800],
      ),

      body: setBackground(),
    ) );
  }

  Widget setBackground() =>
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child:complete?moveslist.length==0?Center(child: Container(child: Text("هیچ حرکتی یافت نشد",style: TextStyle(color: Colors.white),),),): body():Center(child: CircularProgressIndicator(),),
      );

  Widget body() =>
      Column(
        children: <Widget>[

          Expanded(
              child: ListView.builder(
                  itemCount: moveslist.length, itemBuilder: _buildProductItem)
          ),
        ],
      );


  Widget _buildProductItem(BuildContext context, int index) {
    return ListTile(
      onTap: (){
        Strings strings=new Strings();
        print( "${strings.baseurl}/videos/${moveslist[index].videourl.replaceAll(" ", "%20")}");
        String url="${strings.baseurl}/videos/${moveslist[index].videourl.replaceAll(" ", "%20")}";
        Navigator.push(context, MaterialPageRoute(builder: (contex)=>VideoPlayerApp(videoUrl:
          url,)));
      },
      subtitle: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 16),
          padding: EdgeInsets.all(16),
          height: 120,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(//"$directory/${moveslist[index].videourl.replaceAll(" ","%20").split("/").last.replaceAll("mp4", "png")}"
                        "assets/images/muscle/7.jpg", width: 75, height: 75,fit: BoxFit.cover,),
                  ),
                  Container(
                    width: 160,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(moveslist[index].fa,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(moveslist[index].en,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontWeight: FontWeight.bold),),
                        ),

                      ],
                    ),
                  ),
                
                ],
              ),
            ],
          )
      ),
    ) ;

  }

}