import 'dart:async';
import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:freelance_app/models/service_category.dart';
import 'package:http/http.dart' as http;

import '../models/category_model.dart';
import '../models/education_model.dart';
import '../models/experience_model.dart';
import '../models/home_model.dart';
import '../models/product_model.dart';
import '../models/service_posted.dart';
import '../models/service_subcategory.dart';
import '../models/edit_user.dart';
import '../models/users_model.dart';
import '../resources/constants/strings.dart';

class GetRemoteService {
  Future<List<ServiceCategory>?> getCategoriesInfo(
      id, categoryName, categoryImage, serviceId, orderBy) async {
    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/category/serviceCategory.php';

    // Create query parameters
    Map<String, String> headers = {
      // 'id': id,
      // 'category_name': categoryName,
      // 'category_image': categoryImage,
      'service_id': serviceId,
      // 'orderby': orderBy,
    };

    final http.Response response = await http
        .get(Uri.parse(apiUrl).replace(queryParameters: headers))
        .timeout(const Duration(seconds: 30));

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

  Future<List<Users>?> getProfileInfo(String email) async {
    try {
      const String baseUrl = ConstStrings.baseUrl;
      const String apiUrl = '$baseUrl/users/users.php';

      final Map<String, String> headers = {
        'email': email,
      };

      final http.Response response = await http
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30)); // Set a timeout of 30 seconds.

      if (response.statusCode == 200) {
        var jsonResponse = response.body;

        return usersFromJson(jsonResponse);
      } else {
        // Handle non-200 status codes gracefully.
        // print('API request failed with status code: ${response.statusCode}');
        return null;
      }
    } on TimeoutException catch (e) {
      // Handle timeout errors.
      debugPrint('Request timed out: $e');
      return null;
    } catch (e) {
      // Handle other unexpected errors.
      debugPrint('An error occurred: $e');
      return null;
    }
  }

  Future<List<Education>?> getEducationInfo(String email) async {
    try {
      const String baseUrl = ConstStrings.baseUrl;
      const String apiUrl = '$baseUrl/users/education.php';

      final Map<String, String> headers = {
        'email': email,
      };
      final http.Response response = await http
          .get(
            Uri.parse(apiUrl),
            headers: headers,
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return educationFromJson(response.body);
      } else {
        // handle non-200 code here
        return null;
      }
    } on TimeoutException catch (e) {
      // ? Handle timeout errors.
      debugPrint('Request timed out: $e');
      return null;
    } catch (e) {
      // ? Handle other unexpected errors.
      debugPrint('An error occured: $e');
      return null;
    }
  }

  // & experience

  Future<List<Exp>?> getExperienceInfo(String email) async {
    try {
      const String baseUrl = ConstStrings.baseUrl;
      const String apiUrl = '$baseUrl/users/experience.php';

      final Map<String, String> headers = {
        'email': email,
      };
      final http.Response response = await http
          .get(
            Uri.parse(apiUrl),
            headers: headers,
          )
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return expFromJson(response.body);
      } else {
        // handle non-200 code here
        return null;
      }
    } on TimeoutException catch (e) {
      // ? Handle timeout errors.
      debugPrint('Request timed out: $e');
      return null;
    } catch (e) {
      // ? Handle other unexpected errors.
      debugPrint('An error occured: $e');
      return null;
    }
  }

  Future<HomeModel?> getHomeDetails() async {
    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/home/home.php';

    var uri = Uri.parse(apiUrl);

    var response = await http.get(uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      HomeModel homePageData = HomeModel.fromJson(jsonResponse);
      return homePageData;
    }
    return null;
  }

  // & product list based on category
  Future<CategoryModel?> getCategoryProducts(String categoryId) async {
    try {
      // Define constants for URL and headers
      const String baseUrl = ConstStrings.baseUrl;
      const String apiUrl = '$baseUrl/category/product_list.php';
      final Map<String, String> headers = {'id': categoryId};

      // Create and reuse an HTTP client
      final http.Client client = http.Client();

      final http.Response response = await client
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        // Parse and return the response data
        return categoryModelFromJson(response.body);
      } else {
        // Handle non-200 status codes by throwing an exception
        throw Exception(
            'HTTP ${response.statusCode}: ${response.reasonPhrase}');
      }
    } on TimeoutException catch (e) {
      // Handle timeout errors.
      debugPrint('Request timed out: $e');
      throw TimeoutException('Request timed out');
    } catch (e) {
      // Handle other unexpected errors.
      debugPrint('An error occurred: $e');
      throw Exception('An error occurred');
    }
  }

  Future<ProductModel?> getProductInfo(String id) async {
    try {
      const String baseUrl = ConstStrings.baseUrl;
      const String apiUrl = '$baseUrl/product/products.php';

      final Map<String, String> headers = {
        'id': id,
      };

      final http.Response response = await http
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        // print('remote service ${response.body}');
        return productModelFromJson(response.body);
      } else {
        // handle non-200 code here
        return productModelFromJson('');
      }
    } on TimeoutException catch (e) {
      // ? Handle timeout errors.
      debugPrint('Request timed out: $e');
      return productModelFromJson('');
    } catch (e) {
      debugPrint('Error occured:  $e');
      return productModelFromJson('');
    }
  }

  Future<List<EditUser>?> getEditUserDetails(String id) async {
    try {
      const String baseUrl = ConstStrings.baseUrl;
      const String apiUrl = '$baseUrl/users/user_details.php';

      final Map<String, String> headers = {
        'id': id,
      };

      final http.Response response = await http
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final editUser = editUserFromJson(response.body);
        // print('yaha tak ho raha ha');
        return editUser;
        // print('remote service ${response.body}');
        // return null;
      } else {
        // handle non-200 code here
        return null;
      }
    } on TimeoutException catch (e) {
      // ? Handle timeout errors.
      debugPrint('Request timed out: $e');
      return null;
    } catch (e) {
      debugPrint('Error occured:  $e');
      return null;
    }
  }

  // & product list based on user
  Future<CategoryModel?> getProductsFromUser(String categoryId) async {
    try {
      // Define constants for URL and headers
      const String baseUrl = ConstStrings.baseUrl;
      const String apiUrl = '$baseUrl/stats/freelance_stat.php';
      final Map<String, String> headers = {'id': categoryId};

      // Create and reuse an HTTP client
      final http.Client client = http.Client();

      final http.Response response = await client
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        // Parse and return the response data
        return categoryModelFromJson(response.body);
      } else {
        // Handle non-200 status codes by throwing an exception
        throw Exception(
            'HTTP ${response.statusCode}: ${response.reasonPhrase}');
      }
    } on TimeoutException catch (e) {
      // Handle timeout errors.
      debugPrint('Request timed out: $e');
      throw TimeoutException('Request timed out');
    } catch (e) {
      // Handle other unexpected errors.
      debugPrint('An error occurred: $e');
      throw Exception('An error occurred');
    }
  }

/* ----------------------------- search keyword ----------------------------- */
  Future<CategoryModel?> getProductsFromSearchKeyword(
      String searchKeyword) async {
    try {
      // Define constants for URL and headers
      const String baseUrl = ConstStrings.baseUrl;
      const String apiUrl = '$baseUrl/search/search_service.php';
      final Map<String, String> headers = {'id': searchKeyword};

      // Create and reuse an HTTP client
      final http.Client client = http.Client();

      final http.Response response = await client
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));
      if (response.statusCode == 200) {
        // Parse and return the response data
        return categoryModelFromJson(response.body);
      } else {
        // Handle non-200 status codes by throwing an exception
        throw Exception(
            'HTTP ${response.statusCode}: ${response.reasonPhrase}');
      }
    } on TimeoutException catch (e) {
      // Handle timeout errors.
      debugPrint('Request timed out: $e');
      throw TimeoutException('Request timed out');
    } catch (e) {
      // Handle other unexpected errors.
      debugPrint('An error occurred: $e');
      throw Exception('An error occurred');
    }
  }

/* ----------------------------- search keyword ----------------------------- */

  // service list based on user
  Future<List<ServicesPosted>> getServicesPostedFromUser(String userId) async {
    try {
      // Define constants for URL and headers
      const String baseUrl = ConstStrings.baseUrl;
      const String apiUrl = '$baseUrl/stats/services_posted_by_user.php';
      final Map<String, String> headers = {'u_id': userId};

      // Create and reuse an HTTP client
      final http.Client client = http.Client();

      final http.Response response = await client
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        // Parse and return the response data
        return servicesPostedFromJson(response.body);
      } else {
        // Handle non-200 status codes by throwing an exception
        throw Exception(
            'HTTP ${response.statusCode}: ${response.reasonPhrase}');
      }
    } on TimeoutException catch (e) {
      // Handle timeout errors.
      debugPrint('Request timed out: $e');
      throw TimeoutException('Request timed out');
    } catch (e) {
      // Handle other unexpected errors.
      debugPrint('An error occurred: $e');
      throw Exception('An error occurred');
    }
  }

  // apply for any service
  Future<int> applyForService(serviceId, userId, status) async {
    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/applicants/applicants.php';

    var response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'applied_service_id': serviceId,
        'applicant_user_id': userId,
        'application_status': status,
      },
    );

    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }

  // TODO: Working here
  Future serviceApplied(String? id, String? serviceId) async {
    try {
      // Define constants for URL and headers
      const String baseUrl = ConstStrings.baseUrl;
      // change url
      const String apiUrl = '$baseUrl/applicants/service_ifapplied.php';
      final Map<String, String> headers = {
        'user_id': id!,
        'service_id': serviceId!,
      };

      // Create and reuse an HTTP client
      final http.Client client = http.Client();

      final http.Response response = await client
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        // Parse and return the response data

        // return useridModelFromJson(response.body);
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse is List && jsonResponse.isNotEmpty) {
          var total = jsonResponse[0]['total'];

          return total;
        }
        // print(jsonDecode(response.body));
        // return response.body;
      } else {
        // Handle non-200 status codes by throwing an exception
        throw Exception(
            'HTTP ${response.statusCode}: ${response.reasonPhrase}');
      }
    } on TimeoutException catch (e) {
      // Handle timeout errors.
      debugPrint('Request timed out: $e');
      throw TimeoutException('Request timed out');
    } catch (e) {
      // Handle other unexpected errors.
      debugPrint('An error occurred: $e');
      throw Exception('An error occurred');
    }
  }
}
