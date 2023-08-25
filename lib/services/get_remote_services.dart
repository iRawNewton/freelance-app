import 'dart:convert';

import 'package:freelance_app/models/service_category.dart';
import 'package:http/http.dart' as http;

import '../models/service_subcategory.dart';
import '../models/users.dart';
import '../res/constants/strings.dart';

class GetRemoteService {
  Future<List<ServiceCategory>?> getCategoriesInfo(
      id, categoryName, categoryImage, serviceId, orderBy) async {
    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/category/serviceCategory.php';

    // Create query parameters
    Map<String, String> headers = {
      'id': id,
      'category_name': categoryName,
      'category_image': categoryImage,
      'service_id': serviceId,
      'orderby': orderBy,
    };

    var response = await http.get(Uri.parse(apiUrl), headers: headers);
    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<ServiceCategory> serviceCategories =
          jsonResponse.map((data) => ServiceCategory.fromJson(data)).toList();
      return serviceCategories;
    }
    return null;
  }

  Future<List<ServiceSubcategory>?> getSubserviceInfo({
    String? subcategoryId,
    String? subcategoryName,
    String? subCategoryImage,
    String? parentCategoryId,
    String? orderBy,
  }) async {
    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/category/serviceSubCategory.php';

    Map<String, String> queryParameters = {
      if (subcategoryId != null) 'subcategory_id': subcategoryId,
      if (subcategoryName != null) 'subcategory_name': subcategoryName,
      if (subCategoryImage != null) 'sub_category_image': subCategoryImage,
      if (parentCategoryId != null) 'parent_category_id': parentCategoryId,
      if (orderBy != null) 'orderby': orderBy,
    };

    var uri = Uri.parse(apiUrl).replace(queryParameters: queryParameters);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      List<ServiceSubcategory> serviceSubcategories = jsonResponse
          .map((data) => ServiceSubcategory.fromJson(data))
          .toList();
      return serviceSubcategories;
    }
    return null;
  }

  Future<List<Users>?> getUserInfo(email) async {
    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/auth/user_register.php';

    // Create query parameters
    Map<String, String> headers = {
      'email': email,
    };

    var response = await http.get(Uri.parse(apiUrl), headers: headers);
    if (response.statusCode == 200) {
      var json = response.body;
      return usersFromJson(json);
    }
    return null;
  }
}
