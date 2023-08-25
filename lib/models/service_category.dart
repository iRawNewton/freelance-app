// To parse this JSON data, do
//
//     final serviceCategory = serviceCategoryFromJson(jsonString);

import 'dart:convert';

List<ServiceCategory> serviceCategoryFromJson(String str) =>
    List<ServiceCategory>.from(
        json.decode(str).map((x) => ServiceCategory.fromJson(x)));

String serviceCategoryToJson(List<ServiceCategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceCategory {
  String categoryId;
  String categoryName;
  String categoryImage;
  String serviceId;

  ServiceCategory({
    required this.categoryId,
    required this.categoryName,
    required this.categoryImage,
    required this.serviceId,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) =>
      ServiceCategory(
        categoryId: json["category_id"],
        categoryName: json["category_name"],
        categoryImage: json["category_image"],
        serviceId: json["service_id"],
      );

  Map<String, dynamic> toJson() => {
        "category_id": categoryId,
        "category_name": categoryName,
        "category_image": categoryImage,
        "service_id": serviceId,
      };
}
