
class TeachersList {
  final List<Teachers> result;
  TeachersList._({ this.result});
  factory TeachersList.fromJson(Map jsonMap) {
    return new TeachersList._(
        result : (jsonMap['result'] as List).map((i) => Teachers.fromJson(i)).toList()
    );
  }
}
class Teachers{
  final String firstname;
  final String country;
  final String city;
  final String about;
  final String profilephoto;
  final String biografi;
  final String username;
  final String phone;
  Teachers._({this.phone,this.username, this.firstname,this.country,this.about,this.city,this.profilephoto,this.biografi});
  factory Teachers.fromJson(Map jsonMap) {
    return new Teachers._(
      firstname : jsonMap['first_name'],
      country : jsonMap['country'],
      city : (jsonMap['city']),
      about : (jsonMap['about']),
      profilephoto : (jsonMap['profile_photo']),
      biografi : (jsonMap['bio']),
      username : (jsonMap['username']),
      phone : (jsonMap['phone']),

    );
  }
}