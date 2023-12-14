// To parse this JSON data, do
//
//     final userIdModel = userIdModelFromJson(jsonString);

import 'dart:convert';

List<UserIdModel> userIdModelFromJson(String str) => List<UserIdModel>.from(
    json.decode(str).map((x) => UserIdModel.fromJson(x)));

String userIdModelToJson(List<UserIdModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserIdModel {
  String userId;

  UserIdModel({
    required this.userId,
  });

  factory UserIdModel.fromJson(Map<String, dynamic> json) => UserIdModel(
        userId: json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
      };
}

// To parse this JSON data, do
//
//     final applicantDataModel = applicantDataModelFromJson(jsonString);

List<ApplicantDataModel> applicantDataModelFromJson(String str) =>
    List<ApplicantDataModel>.from(
        json.decode(str).map((x) => ApplicantDataModel.fromJson(x)));

String applicantDataModelToJson(List<ApplicantDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApplicantDataModel {
  String userId;
  String username;
  String email;
  String firstName;
  String lastName;
  String phone;
  String residenceCountry;
  String residenceState;
  String residenceCity;
  String profilePictureUrl;
  String jaId;
  String appliedJobId;
  String applicantUserId;
  DateTime applicationTimestamp;
  String applicationStatus;

  ApplicantDataModel({
    required this.userId,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.residenceCountry,
    required this.residenceState,
    required this.residenceCity,
    required this.profilePictureUrl,
    required this.jaId,
    required this.appliedJobId,
    required this.applicantUserId,
    required this.applicationTimestamp,
    required this.applicationStatus,
  });

  factory ApplicantDataModel.fromJson(Map<String, dynamic> json) =>
      ApplicantDataModel(
        userId: json["user_id"],
        username: json["username"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        residenceCountry: json["residence_country"],
        residenceState: json["residence_state"],
        residenceCity: json["residence_city"],
        profilePictureUrl: json["profile_picture_url"],
        jaId: json["JA_id"],
        appliedJobId: json["applied_job_id"],
        applicantUserId: json["applicant_user_id"],
        applicationTimestamp: DateTime.parse(json["application_timestamp"]),
        applicationStatus: json["application_status"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "username": username,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "residence_country": residenceCountry,
        "residence_state": residenceState,
        "residence_city": residenceCity,
        "profile_picture_url": profilePictureUrl,
        "JA_id": jaId,
        "applied_job_id": appliedJobId,
        "applicant_user_id": applicantUserId,
        "application_timestamp": applicationTimestamp.toIso8601String(),
        "application_status": applicationStatus,
      };
}
