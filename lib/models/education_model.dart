// To parse this JSON data, do
//
//     final education = educationFromJson(jsonString);

import 'dart:convert';

List<Education> educationFromJson(String str) =>
    List<Education>.from(json.decode(str).map((x) => Education.fromJson(x)));

String educationToJson(List<Education> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Education {
  String educationId;
  String userId;
  String institutionName;
  String degreeObtained;
  String fieldOfStudy;
  DateTime startDate;
  DateTime endDate;
  String gradeOrGpa;

  Education({
    required this.educationId,
    required this.userId,
    required this.institutionName,
    required this.degreeObtained,
    required this.fieldOfStudy,
    required this.startDate,
    required this.endDate,
    required this.gradeOrGpa,
  });

  factory Education.fromJson(Map<String, dynamic> json) => Education(
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
