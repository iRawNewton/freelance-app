// TODO: 1 FEB BACKEND
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../resources/constants/strings.dart';
import '../model/user_idmodel.dart';

class JobRemoteService {
  Future<int> applyJob(jobId, userId, status) async {
    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/job/job_applicants.php';

    var response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'applied_job_id': jobId,
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

  Future jobApplied(String? id, String? jobId) async {
    try {
      // Define constants for URL and headers
      const String baseUrl = ConstStrings.baseUrl;
      // change url
      const String apiUrl = '$baseUrl/job/if_jobapplied.php';
      final Map<String, String> headers = {
        'user_id': id!,
        'job_id': jobId!,
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

  Future getUserId(String? emailId) async {
    try {
      // Define constants for URL and headers
      const String baseUrl = ConstStrings.baseUrl;
      const String apiUrl = '$baseUrl/users/get_user_id.php';
      final Map<String, String> headers = {'email_id': emailId!};

      // Create and reuse an HTTP client
      final http.Client client = http.Client();

      final http.Response response = await client
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        // Parse and return the response data

        return useridModelFromJson(response.body);
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
