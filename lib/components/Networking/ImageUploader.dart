import 'dart:convert';
import 'dart:io';
import 'package:art_man/components/Texts/Strings.dart';
import 'package:art_man/components/Utility/SharedPreferences.dart';
import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:http_parser/http_parser.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';


class Uploader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(

      theme: new ThemeData.dark(),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File imageFile;
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  bool uploaded=false;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('تنظیم پروفایل'),
      ),
      body:Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/background.png"),
              fit: BoxFit.cover,
            ),
          ),
          child:new Column(
        children: <Widget>[
          _buildPreviewImage(),
          _buildButtons(),
        ],
      )),
    );
  }

  Widget _buildPreviewImage() {
    return Expanded(
        child:Center(
      child:
      new Card(
        elevation: 5.0,
        shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.all(
            new Radius.circular(4.0),
          ),
        ),
        child: new Container(

           height: 400,
          child: imageFile == null
              ? new Image.asset('assets/images/profile.png', color: Colors.black26,fit: BoxFit.fitWidth, )
              : new Image.file(imageFile, fit: BoxFit.cover),
        ),
      ),
        ));
  }

  Widget _buildButtons() {
    return new Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new IconButton(
            icon: Icon(Icons.camera_alt,color: Colors.white),
            onPressed: _takePhoto,
            tooltip: 'گرفتن عکس',
          ),
          new IconButton(
            icon:uploaded?Icon(Icons.check_circle,color: Colors.green,): Icon(Icons.file_upload,color: Colors.white,),
            onPressed:uploaded? null:_uploadImage,
            tooltip: 'آپلود عکس',
          ),
          new IconButton(
            icon: Icon(Icons.image,color: Colors.white),
            onPressed: _selectGalleryImage,
            tooltip: 'انتخاب از گالری',
          ),
        ],
      ),
    );
  }

  _takePhoto() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _cropImage();
    });

  }

  Future<Null> _cropImage() async {
    if(imageFile!=null) {
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
        imageFile = result;
      });

    }
  }

  _uploadImage() async {
    Strings strings=new Strings();
    SharedPrefrences sharedPrefrences=new SharedPrefrences();
    String username = await sharedPrefrences.getusername();
    String user = await sharedPrefrences.gettype();

    var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();

    var uri = Uri.parse("${strings.baseurl}/$user/profileImage/$username");

    var request = new http.MultipartRequest("PUT", uri);
    var multipartFile = new http.MultipartFile('file', stream, length,
        filename: basename(imageFile.path),
        contentType:  MediaType('image', 'png'));

    request.files.add(multipartFile);
    var response = await request.send();
    print(response.statusCode);
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    setState(() {
      uploaded=true;

    });
  }
  _selectGalleryImage() async {
    imageFile = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _cropImage();
    });


  }
}
