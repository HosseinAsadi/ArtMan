import 'dart:convert';

class LoginResulte{
  final Token toke;
  final int result;

  LoginResulte._({ this.toke,this.result});
  factory LoginResulte.fromJson(Map jsonMap) {
    return new LoginResulte._(

      result : (jsonMap['result']),

    );
  }
}
class GETToken{
  final Token toke;


  GETToken._({ this.toke});
  factory GETToken.fromJson(Map jsonMap) {
    return new GETToken._(
      toke : Token.fromJson(jsonMap["jwt_token"]),
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
        status : (jsonMap['status']),

    );
  }
}

Future<LoginResulte> fetchTokenInLogin(response) async {
  LoginResulte userData;
  var list = (json.decode(response.toString()));
  userData = LoginResulte.fromJson(list);
  return userData;
}
Future<GETToken> fetchTToken(response) async {
  GETToken userData;
  var list = (json.decode(response.toString()));
  userData = GETToken.fromJson(list);
  return userData;
}