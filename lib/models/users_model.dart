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
  String passwordHash;
  String firstName;
  String lastName;
  String phone;
  String languageProficiency;
  String isoCode;
  String residenceCountry;
  String residenceState;
  String residenceCity;
  String userBio;
  String profilePictureUrl;
  String freelanceProjects;
  String serviceProjects;
  String jobPostsCount;

  Users({
    required this.userId,
    required this.username,
    required this.email,
    required this.passwordHash,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.languageProficiency,
    required this.isoCode,
    required this.residenceCountry,
    required this.residenceState,
    required this.residenceCity,
    required this.userBio,
    required this.profilePictureUrl,
    required this.freelanceProjects,
    required this.serviceProjects,
    required this.jobPostsCount,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        userId: json["user_id"],
        username: json["username"],
        email: json["email"],
        passwordHash: json["password_hash"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        languageProficiency: json["language_proficiency"],
        isoCode: json["iso_code"],
        residenceCountry: json["residence_country"],
        residenceState: json["residence_state"],
        residenceCity: json["residence_city"],
        userBio: json["user_bio"],
        profilePictureUrl: json["profile_picture_url"],
        freelanceProjects: json["freelanceProjects"],
        serviceProjects: json["serviceProjects"],
        jobPostsCount: json["jobPostsCount"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "email": email,
        "password_hash": passwordHash,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "language_proficiency": languageProficiency,
        "iso_code": isoCode,
        "residence_country": residenceCountry,
        "residence_state": residenceState,
        "residence_city": residenceCity,
        "user_bio": userBio,
        "profile_picture_url": profilePictureUrl,
        "freelanceProjects": freelanceProjects,
        "serviceProjects": serviceProjects,
        "jobPostsCount": jobPostsCount,
      };
}
