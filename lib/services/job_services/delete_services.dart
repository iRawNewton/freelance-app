import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../resources/constants/strings.dart';

class DeleteRemoteService {
  // ==========================================================
  /* -------------------------------------------------------------------------- */
  /*                               delete service                               */
  /* -------------------------------------------------------------------------- */

  Future deleteService(
    String id,
  ) async {
    const String baseUrl = ConstStrings.baseUrl;
    const String apiUrl = '$baseUrl/delete/delete_service.php';

    // Create query parameters
    final Map<String, String?> headers = {
      'id': id,
    };

    try {
      final http.Response response = await http
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      // Handle exceptions here (e.g., network errors, timeouts, etc.)
      debugPrint('Error: $e');
    }

    return null;
  }

  /* -------------------------------------------------------------------------- */
  /*                                 delete job                                 */
  /* -------------------------------------------------------------------------- */

  Future deleteJob(
    String id,
  ) async {
    const String baseUrl = ConstStrings.baseUrl;
    const String apiUrl = '$baseUrl/delete/delete_job.php';

    // Create query parameters
    final Map<String, String?> headers = {
      'id': id,
    };

    try {
      final http.Response response = await http
          .get(Uri.parse(apiUrl).replace(queryParameters: headers))
          .timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      // Handle exceptions here (e.g., network errors, timeouts, etc.)
      debugPrint('Error: $e');
    }

    return null;
  }
}
