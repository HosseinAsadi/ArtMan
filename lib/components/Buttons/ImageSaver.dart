import 'dart:io';

import 'package:art_man/components/Utility/Keys.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ImageSender extends StatefulWidget {
  String text;

  ImageSender(this.text);

  @override
  _ImageSenderState createState() => _ImageSenderState(text);
}

class _ImageSenderState extends State<ImageSender> {
  String text;
  Color color;

  _ImageSenderState(this.text);

  File imageFile;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    color = Colors.lightGreen[400];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      alignment: Alignment.center,
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(3),
      decoration: BoxDecoration(

          color: color,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      child: GestureDetector(
        child: Text(text, style: TextStyle(color: Colors.white, fontSize: 13),),
        onTap: () {
          setState(() {
            _selectGalleryImage();
             Kelid.setter(text, text);
          });
        },
        onTapDown: (Details) {
          setState(() {
            color = Colors.green[800];
          });
        },

      ),
    );
  }



  _selectGalleryImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    print("---------------------------------->  image selected");
    var diractory = await getApplicationDocumentsDirectory();
    var path;
    setState(() {
      path = diractory.path;
    });
    final File newImage = await imageFile.copy('$path/$text.png');
    print("---------------------------------->  image copid");

  }
}
