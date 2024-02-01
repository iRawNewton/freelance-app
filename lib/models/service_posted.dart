// To parse this JSON data, do
//
//     final servicesPosted = servicesPostedFromJson(jsonString);

import 'dart:convert';

List<ServicesPosted> servicesPostedFromJson(String str) =>
    List<ServicesPosted>.from(
        json.decode(str).map((x) => ServicesPosted.fromJson(x)));

String servicesPostedToJson(List<ServicesPosted> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServicesPosted {
  String firstName;
  String lastName;
  String projectId;
  String userId;
  String projectCategory;
  String projectSubcategory;
  String projectTitle;
  String projectViews;
  String projectMinDeliveryTime;
  String projectDescription;
  String servicesProvided;
  String toolsAndTechnologies;
  String projectServiceId;
  DateTime projectCreatedAt;
  DateTime projectUpdatedAt;

  ServicesPosted({
    required this.firstName,
    required this.lastName,
    required this.projectId,
    required this.userId,
    required this.projectCategory,
    required this.projectSubcategory,
    required this.projectTitle,
    required this.projectViews,
    required this.projectMinDeliveryTime,
    required this.projectDescription,
    required this.servicesProvided,
    required this.toolsAndTechnologies,
    required this.projectServiceId,
    required this.projectCreatedAt,
    required this.projectUpdatedAt,
  });

  factory ServicesPosted.fromJson(Map<String, dynamic> json) => ServicesPosted(
        firstName: json["first_name"],
        lastName: json["last_name"],
        projectId: json["project_id"],
        userId: json["user_id"],
        projectCategory: json["project_category"],
        projectSubcategory: json["project_subcategory"],
        projectTitle: json["project_title"],
        projectViews: json["project_views"],
        projectMinDeliveryTime: json["project_min_delivery_time"],
        projectDescription: json["project_description"],
        servicesProvided: json["services_provided"],
        toolsAndTechnologies: json["tools_and_technologies"],
        projectServiceId: json["project_service_id"],
        projectCreatedAt: DateTime.parse(json["project_created_at"]),
        projectUpdatedAt: DateTime.parse(json["project_updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "project_id": projectId,
        "user_id": userId,
        "project_category": projectCategory,
        "project_subcategory": projectSubcategory,
        "project_title": projectTitle,
        "project_views": projectViews,
        "project_min_delivery_time": projectMinDeliveryTime,
        "project_description": projectDescription,
        "services_provided": servicesProvided,
        "tools_and_technologies": toolsAndTechnologies,
        "project_service_id": projectServiceId,
        "project_created_at": projectCreatedAt.toIso8601String(),
        "project_updated_at": projectUpdatedAt.toIso8601String(),
      };
}
