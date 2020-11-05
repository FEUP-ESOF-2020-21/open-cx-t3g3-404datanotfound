import 'dart:convert';

// these functions are from a userModel template
User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  final String email;
  final String password;

  String displayName;
  String cityOfLiving;
  String academicBackground;
  String currentJob;
  String linkedInURL;
  String bio;
  String interests;
  String imageFile;

  User({  //class constructor
    this.email,
    this.password,
    this.displayName,
    this.cityOfLiving,
    this.academicBackground,
    this.currentJob,
    this.linkedInURL,
    this.bio,
    this.interests,
    this.imageFile
  }); //only email, password, name are mandatory. = Null not necessary, already set by language default


  Map<String, dynamic> toJson() =>
      {
        "email": email,
        "password": password
      };

  factory User.fromJson(Map<String, dynamic> json) =>
      User(
          email: json["email"],
          password: json["password"]
      );

  Map<String, dynamic> toMap() {  //to handle maps
    return {
      'email': email,
      'password': password,
    };
  }
}