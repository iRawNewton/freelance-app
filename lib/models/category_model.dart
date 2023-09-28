// To parse this JSON data, do
//
//     final categoryModel = categoryModelFromJson(jsonString);

import 'dart:convert';

CategoryModel categoryModelFromJson(String str) =>
    CategoryModel.fromJson(json.decode(str));

String categoryModelToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel {
  String totalCount;
  List<Project> projects;

  CategoryModel({
    required this.totalCount,
    required this.projects,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        totalCount: json["total_count"],
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_count": totalCount,
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
      };
}

class Project {
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
  Images images;

  Project({
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

  factory Project.fromJson(Map<String, dynamic> json) => Project(
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
        images: Images.fromJson(json["images"]),
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
        "images": images.toJson(),
      };
}

class Images {
  String gallery1;
  String? gallery2;
  String? gallery3;
  String? gallery4;
  String? gallery5;

  Images({
    required this.gallery1,
    this.gallery2,
    this.gallery3,
    this.gallery4,
    this.gallery5,
  });

  factory Images.fromJson(Map<String, dynamic> json) => Images(
        gallery1: json["gallery_1"],
        gallery2: json["gallery_2"],
        gallery3: json["gallery_3"],
        gallery4: json["gallery_4"],
        gallery5: json["gallery_5"],
      );

  Map<String, dynamic> toJson() => {
        "gallery_1": gallery1,
        "gallery_2": gallery2,
        "gallery_3": gallery3,
        "gallery_4": gallery4,
        "gallery_5": gallery5,
      };
}
