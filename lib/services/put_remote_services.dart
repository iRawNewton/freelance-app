import 'dart:convert';

import 'package:http/http.dart' as http;
import '../resources/constants/strings.dart';

String baseUrl = ConstStrings.baseUrl;

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
    String apiUrl = '$baseUrl/auth/user_register.php';

    // extract the flag and country name
    // print(residenceCountry);

    // Split the input string using a space as the delimiter
    List<String> parts = residenceCountry.split(' ');

    String isoCode = parts.sublist(0).first;
    String countryName =
        parts.sublist(1).join(' ').trim(); // Trim leading and trailing spaces
    // Extract the emoji and remove non-uppercase characters

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
      "iso_code": isoCode,
      "residence_country": countryName,
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

    if (response.statusCode == 200) {
      if (jsonDecode(response.body) == 'Data updated successfully') {
        return 'Data updated successfully';
      } else {
        return '404 Error';
      }
    } else {
      return '404 Error';
    }
  }
}
