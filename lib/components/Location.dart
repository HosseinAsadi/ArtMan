class Country {
 final List<Result> result;
 Country._({ this.result});
 factory Country.fromJson(Map jsonMap) {
  return new Country._(
      result : (jsonMap['result'] as List).map((i) => Result.fromJson(i)).toList()
  );
 }
}

class Result {
  final String name;
  final List<String> citynames;
  Result._({this.citynames, this.name});
  factory Result.fromJson(Map jsonMap) {
    return new Result._(
      name: jsonMap['name'],
      citynames: (jsonMap['cities'].cast<String>())
    );
  }
}

class UserData {
  final int result;
  UserData._({ this.result});
  factory UserData.fromJson(Map jsonMap) {
    return new UserData._(
        result : (jsonMap['result'])
    );
  }
}









