import 'package:art_man/components/Animation/RightSlidePage.dart';
import 'package:art_man/components/Utility/Categorylist.dart';
import 'package:art_man/page/SportPlan/MuscleGroupList.dart';
import 'package:art_man/page/lists/MovesList.dart';
import 'package:flutter/material.dart';

class BuildGrid extends StatefulWidget {
  double maxCrossAxisExtent;
  double mainAxisSpacing;
  double crossAxisSpacing,width;
  int count;
  int padding;
  List<Group> list;
  Color bottomColor,fontColor;


  BuildGrid(this.maxCrossAxisExtent, this.mainAxisSpacing,
      this.crossAxisSpacing, this.width, this.count, this.padding,
      this.list, this.bottomColor, this.fontColor);

  @override
  _BuildGridState createState() => _BuildGridState(maxCrossAxisExtent,mainAxisSpacing,
  crossAxisSpacing,width,count,padding,list,bottomColor,fontColor);
}

class _BuildGridState extends State<BuildGrid> {
  double maxCrossAxisExtent;
  double mainAxisSpacing;
  double crossAxisSpacing,width,height;
  int counte;
  int padding;
 List<Group> list;
  Color bottomColor,fontColor;


  _BuildGridState(this.maxCrossAxisExtent, this.mainAxisSpacing,
      this.crossAxisSpacing, this.width, this.counte, this.padding,
      this.list, this.bottomColor, this.fontColor);

  @override
  Widget build(BuildContext context) {
    setState(() {
      builded=true;
    });
    ListTile _listTile=new ListTile(list.length,bottomColor,list,fontColor,
    width,padding,context);

    return  GridView.extent(
        maxCrossAxisExtent: maxCrossAxisExtent,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        children: _listTile._buildGridTileList(counte));



  }

}
class ListTile {
  List<Group> liste;
  Color bottomColor,fontcolor;
  int count;
  double width;
  int padding;
  BuildContext context;

  ListTile(this.count,this.bottomColor,this.liste,this.fontcolor,this.width,this.padding,this.context);



  List<InkWell> _buildGridTileList(int count) =>
      List.generate(count, (i) =>
      InkWell(
        onTap: (){

          if(state=="fields"){
            state="muscle";
            print(state);
            fieldid=i.toString();
            Navigator.push(context, SlideRightRoute(page: MuscleGroupList()));
            return;
          }
          if(state=="muscle"){
            state="tools";
            print("state when click on muscles  "+state);
            muscleid=i.toString();
            Navigator.push(context, SlideRightRoute(page: MuscleGroupList()));
            return;
          }
          if(state=="tools"){
            print(state);
            toolid=i.toString();
            Navigator.push(context, SlideRightRoute(page:ListMoves()));
            return;

          }
          print(state);
        },

        child: Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    child: Image.asset("assets/images/$state/${liste[i].id}.jpg"),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    child: Container(
                      width: ((2/3)*width),
                      decoration: BoxDecoration(
                          color: bottomColor,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              topRight: Radius.circular(40))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[

                          Text(
                            liste[i].fa,
                            style: TextStyle(
                                color: fontcolor,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                          Text(liste[i].en,
                              style: TextStyle(
                                  color: fontcolor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 14))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      ));
}

