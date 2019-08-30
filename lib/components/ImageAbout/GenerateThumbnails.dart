import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';



 getImageThumbnail(videoPathUrl) async {
   final uint8list = await VideoThumbnail.thumbnailFile(
     video: videoPathUrl,
     thumbnailPath:(await getTemporaryDirectory()).path,//*///"/storage/emulated/0",//
     imageFormat: ImageFormat.WEBP,
     maxHeightOrWidth: 0, // the original resolution of the video
     quality: 75,
   );
}




