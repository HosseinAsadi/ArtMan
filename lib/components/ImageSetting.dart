import 'dart:io';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';


class ImageSetting extends StatefulWidget {
  static const routeName = '/ImageSetting';

  @override
  _ImageSettingState createState() => _ImageSettingState();
}

class _ImageSettingState extends State<ImageSetting> {
  File _image;
  bool selectImage=false;
   getImageFile(ImageSource source)async{
    if(_image==null) {
      var image = await ImagePicker.pickImage(source: source);
      setState(() {
        _image = image;
      });
    }
  }
  Future<Null> _cropImage(File imageFile) async {
    if(_image!=null) {
      File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        ratioX: 1.0,
        ratioY: 1.0,
        maxWidth: 512,
        maxHeight: 512,
      );

      var result = await FlutterImageCompress.compressAndGetFile(
        croppedFile.path,
        croppedFile.path,
        quality: 72,
      );

      setState(() {
        _image = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
setState(() {
  getImageFile(ImageSource.gallery);
  _cropImage(_image);
});



    return Scaffold(
        body: Center(
        child:Container(
      child: _image==null?Image.asset("assets/images/profile.png") :Image.file(_image,),
        ),
    ),
    );
  }
}
