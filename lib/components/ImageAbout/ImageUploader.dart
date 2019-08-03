import 'dart:io';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
 class ImageUploader {
   Future  upload(_image, url) async {
     Dio dio = new Dio();
     FormData formdata = new FormData();
     await formdata.add("photos", new UploadFileInfo(_image, basename(_image.path)));
     dio.post(url, data: formdata, options: Options(
         method: 'POST',
         responseType: ResponseType.plain
     ))
         .then((response) => print("kkkkkkkkkkkkkkkkk " + response.toString()))
         .catchError((error) =>
         print("erroooooo====================: " + error));

   }
 }
