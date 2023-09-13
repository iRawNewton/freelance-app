// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

List<CategoryModel> categoryModelFromJson(String str) =>
    List<CategoryModel>.from(
        json.decode(str).map((x) => CategoryModel.fromJson(x)));

String categoryModelToJson(List<CategoryModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryModel {
  String projectId;
  String userId;
  String firstName;
  String lastName;
  String projectCategory;
  String categoryName;
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
  List<String> images;

  CategoryModel({
    required this.projectId,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.projectCategory,
    required this.categoryName,
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
    required this.images,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        projectId: json["project_id"],
        userId: json["user_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        projectCategory: json["project_category"],
        categoryName: json["category_name"],
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
        images: List<String>.from(json["images"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "user_id": userId,
        "first_name": firstName,
        "last_name": lastName,
        "project_category": projectCategory,
        "category_name": categoryName,
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
        "images": List<dynamic>.from(images.map((x) => x)),
      };
}
