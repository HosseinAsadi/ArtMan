import 'package:art_man/components/Networking/FetchMoves.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/Categorylist.dart';
import 'package:art_man/components/Utility/Classroom.dart';
import 'package:art_man/page/SportPlan/MuscleGroupList.dart';
import 'package:art_man/page/VideoAbout/VideoPlayer.dart';
import 'package:flutter/material.dart';

class ListMoves extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LM();
  }

}

class LM extends State<ListMoves> with SingleTickerProviderStateMixin {
  List<Moveslist> moveslist=new List();
  bool complete=false;
  @override
  void initState() {
    super.initState();
    getMovess();
  }
  getMovess()async{
    Strings strings=new Strings();
    print("fetchmoves");

    Moves movess=await fetchMoves("${strings.baseurl}/admin/getsportingMoves");
    setState(() {
      for(int i=0;i<movess.result.length;i++){
        if((movess.result[i].muscles==int.parse(muscleid) || movess.result[i].muscles==-1) && (movess.result[i].equipment==int.parse(toolid) || movess.result[i].equipment==-1) &&(movess.result[i].exercise==int.parse(fieldid) || movess.result[i].exercise==-1))
        {
          Moveslist move=new Moveslist();
          move.fa=movess.result[i].fa;
          move.en=movess.result[i].en;
          move.videourl=movess.result[i].videoURL;
          moveslist.add(move);
        }
      }
      complete=true;
    });
  }
  Future<Null> onWillPop(){
    Navigator.push(context, MaterialPageRoute(builder: (contex)=>MuscleGroupList()));

  }

  @override
  Widget build(BuildContext context) {
    print("tools"+toolid.toString());
    print("muscles"+muscleid.toString());
    print(fieldid);
    return new WillPopScope( onWillPop: onWillPop,
    child:Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        actions: <Widget>[
          Center(
            child: InkWell(
                onTap: (){
                  setState(() {

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
        child:complete?moveslist.length==0?Center(child: Container(child: Text("هیچ حرکتی یافت نشد",style: TextStyle(color: Colors.black45),),),): body():Center(child: CircularProgressIndicator(),),
      );

  Widget body() =>
      Column(
        children: <Widget>[

          Expanded(
              child: ListView.builder(
                  itemCount: 5, itemBuilder: _buildProductItem)
          ),
        ],
      );


  Widget _buildProductItem(BuildContext context, int index) {
    return ListTile(
      onTap: (){
        Strings strings=new Strings();
        Navigator.push(context, MaterialPageRoute(builder: (contex)=>VideoPlayerApp(videoUrl:
          "${strings.baseurl}/videos/${moveslist[index].videourl}",)));
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
                    child: Image.asset(
                        'assets/images/muscle/1.jpg', width: 75, height: 75,fit: BoxFit.cover,),
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
                            maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(moveslist[index].en,
                            maxLines: 1,
                            style: TextStyle(fontWeight: FontWeight.bold),),
                        ),

                      ],
                    ),
                  ),
                  Container(

                    child: Icon(Icons.queue_play_next,color: Colors.green,size: 50,),
                  )
                ],
              ),
            ],
          )
      ),
    ) ;

  }

}