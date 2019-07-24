import 'package:flutter/material.dart';
class MaterialText extends StatefulWidget{
  double width,height;
  double left,right,bottom,top;
  String text;
  Color textColor;
  Color backgroundColor;
  FontWeight fontWeight;
  double fontsize;
  Alignment align;

  MaterialText( this.height, this.text,
      this.textColor, {this.backgroundColor, this.left, this.right, this.bottom,
  this.top,this.width,this.fontWeight,this.fontsize,this.align});

  @override
  myText createState() {
    // TODO: implement createState
    return myText(height,text,textColor,backgroundColor: backgroundColor,left:
    left,right: right,top: top,fontsize: fontsize,bottom: bottom,width: width,fontWeight: fontWeight,align: align);
  }

}
class myText extends State<MaterialText>{
  double width,height;
  double left,right,bottom,top;
  String text;
  Color textColor;
  Color backgroundColor;
  FontWeight fontWeight;
  double fontsize;
  Alignment align;
  myText( this.height, this.text, this.textColor,
  {this.backgroundColor, this.left, this.right, this.bottom,
  this.top,this.width,this.fontWeight,this.fontsize,this.align});


  @override
  Widget build(BuildContext context) {
    if(bottom==null)
      bottom=0.0;
    if(top==null)
      top=0.0;
    if(left==null)
      left=0.0;
    if(right==null)
      right=0.0;
    if(backgroundColor==null)
      this.backgroundColor=Colors.white;
    return Container(
      alignment: align==null?Alignment.center: align,
        width: width,
      height: height,

      padding: EdgeInsets.only(left: 5,right: 10),
      margin: EdgeInsets.only(bottom: bottom,left: left,right: right,top: top),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text,style: TextStyle(color: textColor,
          fontSize: fontsize,fontWeight: fontWeight,),),
    )
    ;
  }

}