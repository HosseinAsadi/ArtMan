import 'package:flutter/material.dart';

class BuildGrid extends StatefulWidget {
  double maxCrossAxisExtent;
  double mainAxisSpacing;
  double crossAxisSpacing,width;
  int count;
  int padding;
  List<String> sport;
  Color bottomColor,fontColor;


  BuildGrid(this.maxCrossAxisExtent, this.mainAxisSpacing,
      this.crossAxisSpacing, this.width, this.count, this.padding,
      this.sport, this.bottomColor, this.fontColor);

  @override
  _BuildGridState createState() => _BuildGridState(maxCrossAxisExtent,mainAxisSpacing,
  crossAxisSpacing,width,count,padding,sport,bottomColor,fontColor);
}

class _BuildGridState extends State<BuildGrid> {
  double maxCrossAxisExtent;
  double mainAxisSpacing;
  double crossAxisSpacing,width,height;
  int counte;
  int padding;
  List<String> sport;
  Color bottomColor,fontColor;


  _BuildGridState(this.maxCrossAxisExtent, this.mainAxisSpacing,
      this.crossAxisSpacing, this.width, this.counte, this.padding,
      this.sport, this.bottomColor, this.fontColor);



  @override
  Widget build(BuildContext context) {
    ListTile _listTile=new ListTile(counte,bottomColor,sport,fontColor,
    width,padding);

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
  Color bottomColor,fontcolor;
  int count;
  double width;
  int padding;

  ListTile(this.count,this.bottomColor,this.sport,this.fontcolor,this.width,this.padding);

  List<Container> _buildGridTileList(int count) =>
      List.generate(count, (i) =>
            Container(
              margin: EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Stack(
                children: <Widget>[
                  ClipRRect(
                    child: Image.asset('assets/images/pic${i + 1}.jpeg'),
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
                            "پاور لیفتینک",
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
      );
}

class Sport{
  String field;
  String timeortext;
}