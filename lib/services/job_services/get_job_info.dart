import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:freelance_app/models/job_models/job_model.dart';
import 'package:http/http.dart' as http;

import '../../models/applicant_model_free.dart';
import '../../models/job_models/user_id.dart';

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
      debugPrint('Error: $e');
    }

    return null;
  }

  /* ----------------------------- search job ----------------------------- */
  Future<List<JobDetails>?> getSearchJobList({
    String? id,
    String? categoryName,
    String? categoryImage,
    String? serviceId,
    String? orderBy,
  }) async {
    const String baseUrl = ConstStrings.baseUrl;
    const String apiUrl = '$baseUrl/search/job_search.php';

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
      debugPrint('Error: $e');
    }

    return null;
  }
  /* ----------------------------------- end ---------------------------------- */

  // ^ get job list User

  Future<List<JobDetails>?> getJobListByUser({
    String? id,
    String? orderBy,
  }) async {
    const String baseUrl = ConstStrings.baseUrl;
    const String apiUrl = '$baseUrl/job/get_job_list_byuser.php';

    // Create query parameters
    final Map<String, String?> headers = {
      'id': id,
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
      debugPrint('Error: $e');
    }

    return null;
  }

  Future<List<UserIdModel>?> getUserIdbyEmail({
    String? email,
  }) async {
    const String baseUrl = ConstStrings.baseUrl;
    const String apiUrl = '$baseUrl/users/user_id.php';

    // Create query parameters
    final Map<String, String?> headers = {
      'email': email,
    };

    try {
      final http.Response response = await http
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);

        List<UserIdModel> userIdFromApi =
            jsonResponse.map((data) => UserIdModel.fromJson(data)).toList();

        return userIdFromApi;
      }
    } catch (e) {
      // Handle exceptions here (e.g., network errors, timeouts, etc.)
      debugPrint('Error: $e');
    }

    return null;
  }

  Future<List<ApplicantDataModel>?> getApplicantData({
    String? jobId,
  }) async {
    const String baseUrl = ConstStrings.baseUrl;
    const String apiUrl = '$baseUrl/job/job_applicants.php';

    // Create query parameters
    final Map<String, String?> headers = {
      'job_id': jobId,
    };

    try {
      final http.Response response = await http
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);

        List<ApplicantDataModel> applicantData = jsonResponse
            .map((data) => ApplicantDataModel.fromJson(data))
            .toList();

        return applicantData;
      }
    } catch (e) {
      // Handle exceptions here (e.g., network errors, timeouts, etc.)
      debugPrint('Error: $e');
    }

    return null;
  }

  // only for services
  Future<List<ApplicantFreelancer>?> getServicesApplicantData({
    String? serviceId,
  }) async {
    const String baseUrl = ConstStrings.baseUrl;
    const String apiUrl = '$baseUrl/applicants/service_applicant.php';

    // Create query parameters
    final Map<String, String?> headers = {
      'job_id': serviceId,
    };

    try {
      final http.Response response = await http
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);

        List<ApplicantFreelancer> applicantData = jsonResponse
            .map((data) => ApplicantFreelancer.fromJson(data))
            .toList();

        return applicantData;
      }
    } catch (e) {
      // Handle exceptions here (e.g., network errors, timeouts, etc.)
      debugPrint('Error: $e');
    }

    return null;
  }
}
