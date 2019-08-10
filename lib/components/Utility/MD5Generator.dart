
import 'dart:convert';
import 'package:art_man/components/Keys.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart' as crypto;
class Hasher {

 static GenerateMd5() {
    String data = Kelid.getter("password").toString();
    print("+++++++++++++++++++++++++++++++++" + data);
    var content = new Utf8Encoder().convert(data);
    var md5 = crypto.md5;
    var digest = md5.convert(content);
    return hex.encode(digest.bytes);
  }
}