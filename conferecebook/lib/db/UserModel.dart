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

  User({  //class constructor
    this.email = null,
    this.password = null,
    this.displayName = null,
    this.cityOfLiving = null,
    this.academicBackground = null,
    this.currentJob = null,
    this.linkedInURL = null,
    this.bio = null,
  }); //only email, password, name are mandatory

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