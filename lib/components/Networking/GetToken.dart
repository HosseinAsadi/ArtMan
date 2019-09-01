
import 'dart:convert';

class Resulte{
  final Token toke;
  Resulte._({ this.toke});
  factory Resulte.fromJson(Map jsonMap) {
    return new Resulte._(
        toke : Token.fromJson(jsonMap["token_jwt"])
    );
  }
}
class Token{
  final int status;
  final String token;
  Token._({ this.token,this.status});
  factory Token.fromJson(Map jsonMap) {
    return new Token._(
        token : (jsonMap['token']),
        status : (jsonMap['status'])
    );
  }
}

Future<Resulte> fetchToken(response) async {
    Resulte userData;
    var list = (json.decode(response.toString()));
    userData = Resulte.fromJson(list);
    return userData;
  }
