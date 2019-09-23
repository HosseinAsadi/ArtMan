import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';



Future<Null> getimage(videourl)async{
  final uint8list = await VideoThumbnail.thumbnailFile(
    video: videourl,
    thumbnailPath: (await getTemporaryDirectory()).path,
    imageFormat: ImageFormat.PNG,
    maxHeightOrWidth: 0, // the original resolution of the video
    quality: 75,
  );
}


