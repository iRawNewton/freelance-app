// import 'dart:convert';

// import 'package:freelance_app/models/job_models/job_model.dart';
// import 'package:http/http.dart' as http;

// import '../../resources/constants/strings.dart';

// class GetJobRemoteServices {
//   Future<List<JobDetails>?> getCategoriesInfo(
//       id, categoryName, categoryImage, serviceId, orderBy) async {
//     String baseUrl = ConstStrings.baseUrl;
//     String apiUrl = '$baseUrl/job/get_job.php';

//     // Create query parameters
//     Map<String, String> headers = {
//       // 'id': id,
//       // 'category_name': categoryName,
//       // 'category_image': categoryImage,
//       // 'service_id': serviceId,
//       // 'orderby': orderBy,
//     };

//     final http.Response response = await http
//         .get(Uri.parse(apiUrl).replace(queryParameters: headers))
//         .timeout(const Duration(seconds: 30));

//     if (response.statusCode == 200) {
//       List<dynamic> jsonResponse = jsonDecode(response.body);

//       List<JobDetails> serviceCategories =
//           jsonResponse.map((data) => JobDetails.fromJson(data)).toList();

//       return serviceCategories;
//     }
//     return null;
//   }
// }

import 'dart:convert';

import 'package:freelance_app/models/job_models/job_model.dart';
import 'package:http/http.dart' as http;

import '../../resources/constants/strings.dart';

class GetJobRemoteServices {
  // ^ get categories info
  Future<List<JobDetails>?> getCategoriesInfo({
    String? id,
    String? categoryName,
    String? categoryImage,
    String? serviceId,
    String? orderBy,
  }) async {
    const String baseUrl = ConstStrings.baseUrl;
    const String apiUrl = '$baseUrl/job/get_job.php';

    // Create query parameters
    final Map<String, String?> headers = {
      'id': id,
      'category_name': categoryName,
      'category_image': categoryImage,
      'service_id': serviceId,
      'orderby': orderBy,
    };

    try {
      final http.Response response = await http
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);

        List<JobDetails> serviceCategories =
            jsonResponse.map((data) => JobDetails.fromJson(data)).toList();

        return serviceCategories;
      }
    } catch (e) {
      // Handle exceptions here (e.g., network errors, timeouts, etc.)
      // print('Error: $e');
    }

    return null;
  }

  // ^ get category list

  Future<List<JobDetails>?> getCategoriesList({
    String? id,
    String? categoryName,
    String? categoryImage,
    String? serviceId,
    String? orderBy,
  }) async {
    const String baseUrl = ConstStrings.baseUrl;
    const String apiUrl = '$baseUrl/job/get_job_list.php';

    // Create query parameters
    final Map<String, String?> headers = {
      'id': id,
      'category_name': categoryName,
      'category_image': categoryImage,
      'service_id': serviceId,
      'orderby': orderBy,
    };

    try {
      final http.Response response = await http
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);

        List<JobDetails> serviceCategories =
            jsonResponse.map((data) => JobDetails.fromJson(data)).toList();

        return serviceCategories;
      }
    } catch (e) {
      // Handle exceptions here (e.g., network errors, timeouts, etc.)
      print('Error: $e');
    }

    return null;
  }
}
