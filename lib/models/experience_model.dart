// To parse this JSON data, do
//
//     final exp = expFromJson(jsonString);

import 'dart:convert';

List<Exp> expFromJson(String str) =>
    List<Exp>.from(json.decode(str).map((x) => Exp.fromJson(x)));

String expToJson(List<Exp> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Exp {
  String experienceId;
  String userId;
  String companyName;
  String jobTitle;
  DateTime startDate;
  dynamic endDate;
  String isCurrent;
  String description;

  Exp({
    required this.experienceId,
    required this.userId,
    required this.companyName,
    required this.jobTitle,
    required this.startDate,
    required this.endDate,
    required this.isCurrent,
    required this.description,
  });

  factory Exp.fromJson(Map<String, dynamic> json) => Exp(
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
