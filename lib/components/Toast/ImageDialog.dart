import 'package:flutter/material.dart';
class ImageDialog extends StatelessWidget {
  String image;
  ImageDialog(this.image);
  @override
  Widget build(BuildContext context) {

      return  Flexible(
        flex: 1,
        child: GestureDetector(
          child:  Image.network(image,fit: BoxFit.fitWidth,),
          onTap: (){
            showDialog(
                context: context,
                builder: (_) => new AlertDialog(
                  contentPadding: EdgeInsets.all(0.0),
                  content: Card(child: Container(height: 400,child:  Image.network(image,fit: BoxFit.fill,),),),
                )
            );
          },
        ),

      );
  }
}

