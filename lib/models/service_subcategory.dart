// To parse this JSON data, do
//
//     final serviceSubcategory = serviceSubcategoryFromJson(jsonString);

import 'dart:convert';

List<ServiceSubcategory> serviceSubcategoryFromJson(String str) =>
    List<ServiceSubcategory>.from(
        json.decode(str).map((x) => ServiceSubcategory.fromJson(x)));

String serviceSubcategoryToJson(List<ServiceSubcategory> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceSubcategory {
  String subcategoryId;
  String subcategoryName;
  String subCategoryImage;
  String parentCategoryId;

  ServiceSubcategory({
    required this.subcategoryId,
    required this.subcategoryName,
    required this.subCategoryImage,
    required this.parentCategoryId,
  });

  factory ServiceSubcategory.fromJson(Map<String, dynamic> json) =>
      ServiceSubcategory(
        subcategoryId: json["subcategory_id"],
        subcategoryName: json["subcategory_name"],
        subCategoryImage: json["sub_category_image"],
        parentCategoryId: json["parent_category_id"],
      );

  Map<String, dynamic> toJson() => {
        "subcategory_id": subcategoryId,
        "subcategory_name": subcategoryName,
        "sub_category_image": subCategoryImage,
        "parent_category_id": parentCategoryId,
      };
}
