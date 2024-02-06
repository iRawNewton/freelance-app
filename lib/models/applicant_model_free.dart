// To parse this JSON data, do
//
//     final applicantFreelancer = applicantFreelancerFromJson(jsonString);

import 'dart:convert';

List<ApplicantFreelancer> applicantFreelancerFromJson(String str) =>
    List<ApplicantFreelancer>.from(
        json.decode(str).map((x) => ApplicantFreelancer.fromJson(x)));

String applicantFreelancerToJson(List<ApplicantFreelancer> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApplicantFreelancer {
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
  String id;
  String appliedServiceId;
  String applicantUserId;
  DateTime applicationTimestamp;
  String applicationStatus;

  ApplicantFreelancer({
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
    required this.id,
    required this.appliedServiceId,
    required this.applicantUserId,
    required this.applicationTimestamp,
    required this.applicationStatus,
  });

  factory ApplicantFreelancer.fromJson(Map<String, dynamic> json) =>
      ApplicantFreelancer(
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
        id: json["id"],
        appliedServiceId: json["applied_service_id"],
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
        "id": id,
        "applied_service_id": appliedServiceId,
        "applicant_user_id": applicantUserId,
        "application_timestamp": applicationTimestamp.toIso8601String(),
        "application_status": applicationStatus,
      };
}
