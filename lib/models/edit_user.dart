// To parse this JSON data, do
//
//     final editUser = editUserFromJson(jsonString);

import 'dart:convert';

List<EditUser> editUserFromJson(String str) =>
    List<EditUser>.from(json.decode(str).map((x) => EditUser.fromJson(x)));

String editUserToJson(List<EditUser> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EditUser {
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
  DateTime registrationTimestamp;
  DateTime lastLoginTimestamp;
  List<EducationQualification> educationQualification;
  List<Experience> experience;

  EditUser({
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
    required this.registrationTimestamp,
    required this.lastLoginTimestamp,
    required this.educationQualification,
    required this.experience,
  });

  factory EditUser.fromJson(Map<String, dynamic> json) => EditUser(
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
        registrationTimestamp: DateTime.parse(json["registration_timestamp"]),
        lastLoginTimestamp: DateTime.parse(json["last_login_timestamp"]),
        educationQualification: List<EducationQualification>.from(
            json["educationQualification"]
                .map((x) => EducationQualification.fromJson(x))),
        experience: List<Experience>.from(
            json["experience"].map((x) => Experience.fromJson(x))),
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
        "registration_timestamp": registrationTimestamp.toIso8601String(),
        "last_login_timestamp": lastLoginTimestamp.toIso8601String(),
        "educationQualification":
            List<dynamic>.from(educationQualification.map((x) => x.toJson())),
        "experience": List<dynamic>.from(experience.map((x) => x.toJson())),
      };
}

class EducationQualification {
  String educationId;
  String userId;
  String institutionName;
  String degreeObtained;
  String fieldOfStudy;
  DateTime startDate;
  DateTime endDate;
  String gradeOrGpa;

  EducationQualification({
    required this.educationId,
    required this.userId,
    required this.institutionName,
    required this.degreeObtained,
    required this.fieldOfStudy,
    required this.startDate,
    required this.endDate,
    required this.gradeOrGpa,
  });

  factory EducationQualification.fromJson(Map<String, dynamic> json) =>
      EducationQualification(
        educationId: json["education_id"],
        userId: json["user_id"],
        institutionName: json["institution_name"],
        degreeObtained: json["degree_obtained"],
        fieldOfStudy: json["field_of_study"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        gradeOrGpa: json["grade_or_gpa"],
      );

  Map<String, dynamic> toJson() => {
        "education_id": educationId,
        "user_id": userId,
        "institution_name": institutionName,
        "degree_obtained": degreeObtained,
        "field_of_study": fieldOfStudy,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "grade_or_gpa": gradeOrGpa,
      };
}

class Experience {
  String experienceId;
  String userId;
  String companyName;
  String jobTitle;
  DateTime startDate;
  dynamic endDate;
  String isCurrent;
  String description;

  Experience({
    required this.experienceId,
    required this.userId,
    required this.companyName,
    required this.jobTitle,
    required this.startDate,
    required this.endDate,
    required this.isCurrent,
    required this.description,
  });

  factory Experience.fromJson(Map<String, dynamic> json) => Experience(
        experienceId: json["experience_id"],
        userId: json["user_id"],
        companyName: json["company_name"],
        jobTitle: json["job_title"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: json["end_date"],
        isCurrent: json["is_current"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "experience_id": experienceId,
        "user_id": userId,
        "company_name": companyName,
        "job_title": jobTitle,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date": endDate,
        "is_current": isCurrent,
        "description": description,
      };
}
