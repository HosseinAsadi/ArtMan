import 'package:dart_ping/dart_ping.dart';

Future<String> getping() async {
 var stream = await ping("google.com", times: 5);

  print("Pinging google.com");
  stream.listen((d) {
   return d.time.inMilliseconds;
  });
}
