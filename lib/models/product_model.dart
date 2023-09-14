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

  ProductModel({
    required this.projects,
    required this.faq,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        projects: List<Project>.from(
            json["projects"].map((x) => Project.fromJson(x))),
        faq: List<Faq>.from(json["faq"].map((x) => Faq.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "projects": List<dynamic>.from(projects.map((x) => x.toJson())),
        "faq": List<dynamic>.from(faq.map((x) => x.toJson())),
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
  Images images;

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
        images: Images.fromJson(json["images"]),
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
        "images": images.toJson(),
      };
}

class Images {
  String gallery1;
  String gallery2;
  String gallery3;
  String gallery4;
  String gallery5;

  Images({
    required this.gallery1,
    required this.gallery2,
    required this.gallery3,
    required this.gallery4,
    required this.gallery5,
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
