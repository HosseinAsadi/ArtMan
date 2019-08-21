class StdProfile {
  final List<Profilestd> result;
  StdProfile._({ this.result});
  factory StdProfile.fromJson(Map jsonMap) {
    return new StdProfile._(
        result : (jsonMap['result'] as List).map((i) => Profilestd.fromJson(i)).toList()
    );
  }
}

class Profilestd{
  final String firstname;
  final String country;
  final String city;
  final String username;
  final String about;
  final String profilephoto;
  final String biografi;
  final List<myTeachers> MyTeachers;
  Profilestd._({this.username,this.MyTeachers, this.firstname,this.country,this.about,this.city,this.profilephoto,this.biografi});
  factory Profilestd.fromJson(Map jsonMap) {
    return new Profilestd._(
      firstname : jsonMap['first_name'],
      country : jsonMap['country'],
      city : (jsonMap['city']),
      about : (jsonMap['about']),
      profilephoto : (jsonMap['profile_photo']),
      biografi : (jsonMap['bio']),
      username : (jsonMap['username']),
      MyTeachers :  (jsonMap['teachers_id'] as List).map((i) => myTeachers.fromJson(i)).toList()
    );
  }
}

class myTeachers{
  final String username;
  var access;
  myTeachers._({ this.username,this.access});
  factory myTeachers.fromJson(Map jsonMap) {
    return new myTeachers._(
      username: (jsonMap['username']),
      access: (jsonMap['access']),
    );
  }
}