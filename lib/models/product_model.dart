// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ProductModel productModelFromJson(String str) =>
    ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
  List<Project> projects;
  List<Faq> faq;
  List<Package> packages;

  ProductModel({
    required this.projects,
    required this.faq,
    required this.packages,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
        faq: List<Faq>.from(json["faq"].map((x) => Faq.fromJson(x))),
        packages: List<Package>.from(
            json["packages"].map((x) => Package.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
        "faq": List<dynamic>.from(faq.map((x) => x.toJson())),
        "packages": List<dynamic>.from(packages.map((x) => x.toJson())),
      };
}

class Faq {
  String faqId;
  String projectId;
  String questionText;
  String answerText;
  DateTime createdAt;

  Faq({
    required this.faqId,
    required this.projectId,
    required this.questionText,
    required this.answerText,
    required this.createdAt,
  });

  factory Faq.fromJson(Map<String, dynamic> json) => Faq(
        faqId: json["faq_id"],
        projectId: json["project_id"],
        questionText: json["question_text"],
        answerText: json["answer_text"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "faq_id": faqId,
        "project_id": projectId,
        "question_text": questionText,
        "answer_text": answerText,
        "created_at": createdAt.toIso8601String(),
      };
}

class Package {
  String packagesId;
  String type;
  String name;
  String description;
  String price;
  String featureId;
  String featureDescription;

  Package({
    required this.packagesId,
    required this.type,
    required this.name,
    required this.description,
    required this.price,
    required this.featureId,
    required this.featureDescription,
  });

  factory Package.fromJson(Map<String, dynamic> json) => Package(
        packagesId: json["packages_id"],
        type: json["type"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        featureId: json["feature_id"],
        featureDescription: json["feature_description"],
      );

  Map<String, dynamic> toJson() => {
        "packages_id": packagesId,
        "type": type,
        "name": name,
        "description": description,
        "price": price,
        "feature_id": featureId,
        "feature_description": featureDescription,
      };
}

class Project {
  String projectId;
  String userId;
  String firstName;
  String lastName;
  String languageProficiency;
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

  Project({
    required this.projectId,
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.languageProficiency,
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
        languageProficiency: json["language_proficiency"],
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
        "language_proficiency": languageProficiency,
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
