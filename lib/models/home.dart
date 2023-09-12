// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  List<Category> category;
  List<Project> projects;

  HomeModel({
    required this.category,
    required this.projects,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
      };
}

class Category {
  String categoryId;
  String categoryName;
  String categoryImage;
  String serviceId;
  DateTime createdAt;

  Category({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.serviceId,
    required this.createdAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        serviceId: json["service_id"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_image": categoryImage,
        "service_id": serviceId,
        "created_at": createdAt.toIso8601String(),
      };
}

class Project {
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

  Project({
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

  factory Project.fromJson(Map<String, dynamic> json) => Project(
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
