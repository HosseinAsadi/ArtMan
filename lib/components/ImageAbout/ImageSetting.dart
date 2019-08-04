import 'dart:convert';
import 'dart:io';
import 'package:art_man/components/ImageAbout/ImageUploader.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';



class ImageSetting extends StatefulWidget {
  static const routeName = '/ImageSetting';

  @override
  _ImageSettingState createState() => _ImageSettingState();
}

class _ImageSettingState extends State<ImageSetting> {
  final scaffoldKey = new GlobalKey<ScaffoldState>();

  static const baseUrl = 'http://192.168.20.231:3000';

  File imageFile;
  bool selectImage=false;
   getImageFile(ImageSource source)async{
    if(imageFile==null) {
      var image = await ImagePicker.pickImage(source: source);
      setState(() {
        imageFile = image;
      });
    }
  }
  Future<Null> _cropImage(File imageFile) async {
    if(imageFile!=null) {
      File croppedFile = await ImageCropper.cropImage(
        sourcePath: imageFile.path,
        ratioX: 1.0,
        ratioY: 1.0,
        maxWidth: 512,
        maxHeight: 512,
      );

     /* var result = await FlutterImageCompress.compressAndGetFile(
        croppedFile.path,
        croppedFile.path,
        quality: 72,
      );

      setState(() {
        imageFile = result;
      });*/
      final Directory Path = await getTemporaryDirectory();
      //final Directory Path = await getApplicationDocumentsDirectory();
      String path  = Path.path;
      final File newImage = await imageFile.copy('$path/${DateTime.now()}.png');
      setState(() {
        imageFile = newImage;
      });

     }
  }
  _uploadImage() async {
    if (imageFile == null) {
      return print('Please select image');
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return new Center(
          child: new CircularProgressIndicator(),
        );
      },
      barrierDismissible: false,
    );

    try {
      final url = Uri.parse('$baseUrl/teachers/profileImage/sepehr');
      final fileName = path.basename(imageFile.path);
      final bytes = await compute(compress, imageFile.readAsBytesSync());

      var request = http.MultipartRequest('PUT', url)
        ..files.add(
          new http.MultipartFile.fromBytes(
            'image',
            bytes,
            filename: fileName,
          ),
        );

      var response = await request.send();
      var decoded = await response.stream.bytesToString().then(json.decode);

      Navigator.pop(context);
      if (response.statusCode == HttpStatus.OK) {
        print('Image uploaded, imageUrl = $baseUrl/${decoded['path']}');
      } else {
        print('Image failed: ${decoded['message']}');
      }
    } catch (e) {
      Navigator.pop(context);
      print('Image failed: $e');
    }
  }
  @override
  Widget build(BuildContext context) {

setState(() {
  getImageFile(ImageSource.gallery);
  _cropImage(imageFile);
  _uploadImage();
});


    return new Scaffold(
      key: scaffoldKey,
        body: Center(
        child:Container(
      child: imageFile==null?Image.asset("assets/images/profile.png") :Image.file(imageFile,),
        ),
    ),
    );

  }
}
