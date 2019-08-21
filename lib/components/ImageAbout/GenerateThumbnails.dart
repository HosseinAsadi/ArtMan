import 'package:thumbnails/thumbnails.dart';
import 'package:path_provider/path_provider.dart';

class Thumb{

 getImage(videoPathUrl) async {
  var appDocDir = await getApplicationDocumentsDirectory();
  final folderPath =appDocDir.path;// "/storage/emulated/0/download";
  String thumb = await Thumbnails.getThumbnail(
      thumbnailFolder: folderPath,
      videoFile: videoPathUrl,
      imageType: ThumbFormat.JPEG,//this image will store in created folderpath
      quality: 30);
  print("++++++++++++++++++++++++++++++++++++++++++++++++++++++"+thumb);
  return thumb;
}

}