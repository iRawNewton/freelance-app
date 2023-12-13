import 'package:http/http.dart' as http;

import '../../../resources/constants/strings.dart';

class JobRemoteService {
  Future<int> applyJob(jobId, userId, status) async {
    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/job/job_applicants.php';

    var response = await http.post(Uri.parse(apiUrl), body: {
      'applied_job_id': jobId,
      'applicant_user_id': userId,
      'application_status': status,
    });

    if (response.statusCode == 200) {
      return response.statusCode;
    } else {
      return response.statusCode;
    }
  }
}
