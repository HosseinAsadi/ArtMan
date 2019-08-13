class profilInfo {
  final List<information> result;
  profilInfo._({ this.result});
  factory profilInfo.fromJson(Map jsonMap) {
    return new profilInfo._(
        result : (jsonMap['result'] as List).map((i) => information.fromJson(i)).toList()
    );
  }
}

class information{
  final String firstname;
  final String country;
  final String city;
  final String about;
  final String profilephoto;
  information._({ this.firstname,this.country,this.about,this.city,this.profilephoto});
  factory information.fromJson(Map jsonMap) {
    return new information._(
      firstname : jsonMap['first_name'],
      country : jsonMap['country'],
      city : (jsonMap['city']),
      about : (jsonMap['about']),
      profilephoto : (jsonMap['profile_photo']),
    );
  }
}