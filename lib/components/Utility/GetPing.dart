import 'package:art_man/components/Texts/Strings.dart';
import 'package:dart_ping/dart_ping.dart';

Future<String> getping() async {
 Strings strings=new Strings();
 var stream = await ping("${strings.baseurl}", times: 5);

  print("Pinging google.com");
  stream.listen((d) {
   return d.time.inMilliseconds;
  });
}
