import 'package:freelance_app/models/service_category.dart';
import 'package:http/http.dart' as http;

import '../res/constants/strings.dart';

class GetRemoteService {
  Future<List<ServiceCategory>?> getServiceInfo(
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
      var json = response.body;
      return serviceCategoryFromJson(json);
    }
    return null;
  }
}
