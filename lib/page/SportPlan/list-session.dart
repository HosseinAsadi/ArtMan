import 'package:art_man/components/Networking/FetchSportPlansOfTeacher.dart';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:art_man/page/VideoAbout/VideoPlayer.dart';
import 'package:flutter/material.dart';

class ListSession extends StatefulWidget {
  List<Moves> mymoves;
  String movename;
  ListSession({Key key , @required this.mymoves,this.movename}) :super(key:key);
  @override
  State<StatefulWidget> createState() {
    return LS(mymoves,movename);
  }
}

class LS extends State<ListSession> with SingleTickerProviderStateMixin {
  bool _isSelected = false;
  List<Moves> mymoves;
  String movename;
  String type;
  gettypee()async{
    String t=await gettype();
    setState(() {
      type=t;
    });
  }

   LS(this.mymoves,this.movename);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettypee();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    /*  appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text('تنظیم مجدد', style: TextStyle(fontSize: 13),),
            Text('جلسه شماره${classroomindex+1}-هفته شماره${weekindex+1}',style: TextStyle(fontSize: 15))
          ],
        ),
        actions: <Widget>[
          Icon(Icons.arrow_forward)
        ],
        backgroundColor: Colors.green[800],
      ),*/

      body: setBackground(),
    );
  }

  Widget setBackground() =>
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: body(),
      );

  Widget body() =>
      Column(
        children: <Widget>[

          Expanded(
              child: ListView.builder(
                  itemCount: mymoves.length, itemBuilder: _buildProductItem)
          ),
        ],
      );


  Widget _buildProductItem(BuildContext context, int index) {
    return ListTile(
      onTap: (){
        Strings strings=new Strings();
      String  video="${strings.baseurl}/videos/${mymoves[index].moves_id.replaceAll(" ", "%20")}";
        print(video);
        Navigator.push(context, MaterialPageRoute(builder: (contex)=>VideoPlayerApp(
          videoUrl:video ,
        )));
      },
      subtitle: Container(
          margin: EdgeInsets.only(left: 20, right: 20, top: 16),
          padding: EdgeInsets.all(16),
          height: 162,
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
                        'assets/images/muscle/8.jpg', width: 75, height: 75),
                  ),
                  Container(
                    width: 180,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.only(bottom: 5),
                          child: Text(movename,
                            style: TextStyle(fontWeight: FontWeight.bold),),
                        ),
                        Row(
                          children: <Widget>[
                            Text('گام ها               ',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12)),
                            Text('${mymoves[index].options.set}', style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('تعداد تکرارها        ', style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                            Text('${mymoves[index].options.repeat}', style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12))
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text('زمان استراحت      ', style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12)),
                            Text('${mymoves[index].options.rest}', style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12))
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              type=="users"?  Container(
                height: 1,
                margin: EdgeInsets.only(bottom: 2),
                color: Colors.grey,
              ):Container(width: 0,height: 0,),

             type=="users"? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(left: 8),
                      decoration: BoxDecoration(
                          color: _isSelected ? Colors.green : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey)
                      ),
                      child: Icon(
                        Icons.done,
                        size: 20,
                        color: _isSelected ? Colors.white : Colors.grey,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        if(!this._isSelected)
                          this._isSelected = true;
                        else
                          this._isSelected = false;
                      });
                    },
                  ),

                  Text('به اتمام رسیده است..', style: TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 15),)
                ],
              ):Container(width: 0,height: 0,)
            ],
          )
      ),
    ) ;

  }

}