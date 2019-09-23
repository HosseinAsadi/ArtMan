import 'package:art_man/components/Lists/AnalyzeAnswerList.dart';
import 'package:art_man/components/Utility/GetTeachersList.dart';
import 'package:flutter/material.dart';
class ImageDialog extends StatelessWidget {
  String image;
  ImageDialog(this.image);
  @override
  Widget build(BuildContext context) {

      return  Flexible(
       flex: 100,
        child: GestureDetector(

          child:  Container(margin: EdgeInsets.all(2), child:Image.network(image) ,),
          onTap: (){
            showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  contentPadding: EdgeInsets.all(0.0),
                  content: Card(child: Container(child:  Image.network(image,),),),
                )
            );
          },
        ),

      );
  }
}

