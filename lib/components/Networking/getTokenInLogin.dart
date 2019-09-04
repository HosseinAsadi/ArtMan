import 'dart:convert';

class LoginResulte{
  final Token toke;
  final int result;

  LoginResulte._({ this.toke,this.result});
  factory LoginResulte.fromJson(Map jsonMap) {
    return new LoginResulte._(
        toke : Token.fromJson(jsonMap["jwt_token"]),
      result : (jsonMap['result']),

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