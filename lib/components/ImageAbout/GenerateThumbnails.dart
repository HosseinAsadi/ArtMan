import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';



 getImageThumbnail(videoPathUrl) async {
   final uint8list = await VideoThumbnail.thumbnailFile(
     video: videoPathUrl,
     thumbnailPath:"/storage/emulated/0",//(await getTemporaryDirectory()).path,//*///,//
     imageFormat: ImageFormat.PNG,
     maxHeightOrWidth: 0, // the original resolution of the video
     quality: 75,
   );
}




