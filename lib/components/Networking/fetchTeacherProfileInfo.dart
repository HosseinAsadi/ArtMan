class UserProfile {
  final List<Profile> result;
  UserProfile._({ this.result});
  factory UserProfile.fromJson(Map jsonMap) {
    return new UserProfile._(
        result : (jsonMap['result'] as List).map((i) => Profile.fromJson(i)).toList()
    );
  }
}

class Profile{
  final String firstname;
  final String country;
  final String city;
  final String about;
  final String profilephoto;
  final String biografi;
  final List<String> users_id;
  Profile._({this.users_id, this.firstname,this.country,this.about,this.city,this.profilephoto,this.biografi});
  factory Profile.fromJson(Map jsonMap) {
    return new Profile._(
      firstname : jsonMap['first_name'],
      country : jsonMap['country'],
      city : (jsonMap['city']),
      about : (jsonMap['about']),
      profilephoto : (jsonMap['profile_photo']),
      biografi : (jsonMap['bio']),
      users_id : (jsonMap['users_id'].cast<String>()),
    );
  }
}

