import 'package:http/http.dart' as http;
import '../res/constants/strings.dart';

String baseUrl = ConstStrings.baseUrl;
String apiUrl = '$baseUrl/auth/admin_login.php';

class PutRemoteService {
  Future<String> putUsers(
    username,
    email,
    phone,
    passwordHash,
    firstName,
    lastName,
    languageProficiency,
    residenceCountry,
    residenceState,
    residenceCity,
    userBio,
    profilePictureUrl,
  ) async {
    // Create a map of data to send in the request body

    // Convert the map to JSON
    Map<String, dynamic> data = {
      "username": username,
      "email": email,
      "phone": phone,
      "password_hash": passwordHash,
      "first_name": firstName,
      "last_name": lastName,
      "language_proficiency": languageProficiency,
      "residence_country": residenceCountry,
      "residence_state": residenceState,
      "residence_city": residenceCity,
      "user_bio": userBio,
      "profile_picture_url": profilePictureUrl,
    };

    // send the PUT request
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: data,
    );
    print(response.body);
    if (response.statusCode == 200) {
      // do something
      print(response.body);
    } else {
      // do something
    }
    return '404 Error';
  }
}
