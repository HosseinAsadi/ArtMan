import 'dart:io';

import 'package:async/async.dart';
import 'package:dio/dio.dart';
import 'package:path/path.dart';
 class ImageUploader {
   static upload(_image, url) {
     Dio dio = new Dio();
     FormData formdata = new FormData(); // just like JS
     formdata.add("photos", new UploadFileInfo(_image, basename(_image.path)));
     dio.post(url, data: formdata, options: Options(
         method: 'POST',
         responseType: ResponseType.plain // or ResponseType.JSON
     ))
         .then((response) => print("kkkkkkkkkkkkkkkkk " + response.toString()))
         .catchError((error) =>
         print("erroooooo====================: " + error));
     /*Upload( imageFile) async {
     var stream = new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
     var length = await imageFile.length();

     var uri = Uri.parse(uploadURL);

     var request = new http.MultipartRequest("POST", uri);
     var multipartFile = new http.MultipartFile('file', stream, length,
         filename: basename(imageFile.path));
     //contentType: new MediaType('image', 'png'));

     request.files.add(multipartFile);
     var response = await request.send();
     print(response.statusCode);
     response.stream.transform(utf8.decoder).listen((value) {
       print(value);
     });
   }*/
     /*FormData formData = new FormData.from({
   "name": "wendux",
   "file1": new UploadFileInfo(new File("./upload.jpg"), "upload1.jpg")
 });
 response = await dio.post("/info", data: formData)
}*/
   }
 }
