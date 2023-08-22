// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

List<Users> usersFromJson(String str) =>
    List<Users>.from(json.decode(str).map((x) => Users.fromJson(x)));

String usersToJson(List<Users> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Users {
  String userId;
  String username;
  String email;
  String firstName;
  String lastName;
  String languageProficiency;
  String residenceCountry;
  String residenceState;
  String residenceCity;
  String userBio;
  String profilePictureUrl;

  Users({
    required this.userId,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.languageProficiency,
    required this.residenceCountry,
    required this.residenceState,
    required this.residenceCity,
    required this.userBio,
    required this.profilePictureUrl,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        userId: json["user_id"],
        username: json["username"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        languageProficiency: json["language_proficiency"],
        residenceCountry: json["residence_country"],
        residenceState: json["residence_state"],
        residenceCity: json["residence_city"],
        userBio: json["user_bio"],
        profilePictureUrl: json["profile_picture_url"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "language_proficiency": languageProficiency,
        "residence_country": residenceCountry,
        "residence_state": residenceState,
        "residence_city": residenceCity,
        "user_bio": userBio,
        "profile_picture_url": profilePictureUrl,
      };
}
