import 'package:thumbnails/thumbnails.dart';
import 'package:thumbnails/thumbnails.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class Thumb{

 getImage(videoPathUrl) async {
  var appDocDir = await getApplicationDocumentsDirectory();
  final folderPath = "/storage/emulated/0/download";
  String thumb = await Thumbnails.getThumbnail(
      thumbnailFolder: folderPath,
      videoFile: videoPathUrl,
      imageType: ThumbFormat.JPEG,//this image will store in created folderpath
      quality: 30);
  print(thumb);
  return thumb;
}

}