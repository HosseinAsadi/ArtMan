import 'package:art_man/page/SportPlan/MuscleGroupList.dart';
import 'package:flutter/material.dart';

class BuildGrid extends StatefulWidget {
  double maxCrossAxisExtent;
  double mainAxisSpacing;
  double crossAxisSpacing,width;
  int count;
  int padding;
  List<String> sport;
  List<String> images;
  Color bottomColor,fontColor;


  BuildGrid(this.maxCrossAxisExtent, this.mainAxisSpacing,
      this.crossAxisSpacing, this.width, this.count, this.padding,
      this.sport, this.bottomColor, this.fontColor,this.images);

  @override
  _BuildGridState createState() => _BuildGridState(maxCrossAxisExtent,mainAxisSpacing,
  crossAxisSpacing,width,count,padding,sport,bottomColor,fontColor,images);
}

class _BuildGridState extends State<BuildGrid> {
  double maxCrossAxisExtent;
  double mainAxisSpacing;
  double crossAxisSpacing,width,height;
  int counte;
  int padding;
  List<String> sport;
  List<String> images;
  Color bottomColor,fontColor;


  _BuildGridState(this.maxCrossAxisExtent, this.mainAxisSpacing,
      this.crossAxisSpacing, this.width, this.counte, this.padding,
      this.sport, this.bottomColor, this.fontColor,this.images);



  @override
  Widget build(BuildContext context) {
    ListTile _listTile=new ListTile(counte,bottomColor,sport,fontColor,
    width,padding,images,context);

    return  GridView.extent(
        maxCrossAxisExtent: maxCrossAxisExtent,
        padding: const EdgeInsets.all(4),
        mainAxisSpacing: mainAxisSpacing,
        crossAxisSpacing: crossAxisSpacing,
        children: _listTile._buildGridTileList(counte));



  }

}
class ListTile {
  List<String> sport;
  List<String> images;
  Color bottomColor,fontcolor;
  int count;
  double width;
  int padding;
  BuildContext context;

  ListTile(this.count,this.bottomColor,this.sport,this.fontcolor,this.width,this.padding,this.images,this.context);



  List<InkWell> _buildGridTileList(int count) =>
      List.generate(count, (i) =>
      InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (contex)=>MuscleGroupList()));
        },

        child: Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    child: Image.asset(images[i]),
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
                            "تجهیزات",
                            style: TextStyle(
                                color: fontcolor,
                                fontWeight: FontWeight.w700,
                                fontSize: 14),
                          ),
                          Text(sport[i],
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

class Sport{
  String field;
  String timeortext;
}