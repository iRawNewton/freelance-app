// To parse this JSON data, do
//
//     final homeModel = homeModelFromJson(jsonString);

import 'dart:convert';

HomeModel homeModelFromJson(String str) => HomeModel.fromJson(json.decode(str));

String homeModelToJson(HomeModel data) => json.encode(data.toJson());

class HomeModel {
  List<Category> category;
  List<Category> serviceCategory;
  List<Project> projects;

  HomeModel({
    required this.category,
    required this.serviceCategory,
    required this.projects,
  });

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        category: List<Category>.from(
            json["category"].map((x) => Category.fromJson(x))),
        serviceCategory: List<Category>.from(
            json["serviceCategory"].map((x) => Category.fromJson(x))),
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": List<dynamic>.from(category.map((x) => x.toJson())),
        "serviceCategory":
            List<dynamic>.from(serviceCategory.map((x) => x.toJson())),
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
