import 'package:art_man/components/Animation/ScaleRoutePage.dart';
import 'package:art_man/page/SportPlan/PlanSport.dart';
import 'package:art_man/page/lists/SearchPage.dart';
import 'package:flutter/material.dart';
class RequestButton extends StatefulWidget {
  IconData icon;
  String titleText;
  String contentText;
  Color colorIcon,textColor;
  String routgoal;

  RequestButton(this.icon, this.titleText, this.contentText, this.colorIcon,
      this.routgoal,{this.textColor});

  @override
  _RequestButtonState createState() => _RequestButtonState(icon,
  titleText,contentText,colorIcon,routgoal,textColor: textColor);
}

class _RequestButtonState extends State<RequestButton> {
  IconData icon;
  String titleText;
  String contentText;
  Color colorIcon,textColor,backColor= Colors.grey[300];
  String routgoal;
  _RequestButtonState(this.icon, this.titleText, this.contentText, this.colorIcon,
      this.routgoal,{this.textColor});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        routgoal=="/SearchPage"?
            Navigator.push(context,ScaleRoute(
                page:  SearchPage())):
        Navigator.push(
            context,
            ScaleRoute(
              page: PlanSport(typeplan: routgoal,),
            ));
      },
      onTapDown: (Details){
        setState(() {
          backColor=Colors.white.withOpacity(0.3);
        });
      },
      onTapUp: (Details){
        setState(() {
          backColor=Colors.grey[300];
        });
      },
      child: coachSearch() ,
    );
  }
  Widget coachSearch() =>Container(
    margin: EdgeInsets.only( bottom: 20),
    padding: EdgeInsets.all(20),
    decoration: BoxDecoration(
        color:backColor,
        borderRadius: BorderRadius.circular(20)
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: new Color(0xFFEDC40A), width: 2),
              borderRadius: BorderRadius.circular(30)
          ),
          child: Icon(icon, color: colorIcon),
        ),

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              width: 200,
              margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
              child: Text(titleText, style: TextStyle(color:textColor==null? Colors.black:textColor, fontWeight: FontWeight.bold),),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.only(left: 16, right: 16),
              child: Text(contentText, style: TextStyle(color:textColor==null? Colors.black:textColor, fontSize: 13),),
            ),
          ],
        )
      ],
    ),
  );
}
