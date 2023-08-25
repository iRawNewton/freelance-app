// import 'package:intl/intl.dart';
// DateTime now = DateTime.now();
// String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelance_app/models/users.dart';
import 'package:freelance_app/res/constants/convert.dart';
import 'package:http/http.dart' as http;
import 'package:freelance_app/res/constants/strings.dart';

String baseUrl = ConstStrings.baseUrl;
String apiUrl = '$baseUrl/auth/admin_login.php';

class PostRemoteService {
  // auth
  Future<String> signUp(
    String email,
    String password,
  ) async {
    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/auth/user_register.php';

    String username = generateUsername(email);
    String hashPassword = generateSHA256String(password);

    // Send the POST request
    var response = await http.post(Uri.parse(apiUrl), body: {
      'username': username,
      'email': email,
      'password_hash': hashPassword,
    });
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      if (jsonResponse == 'Data inserted successfully') {
        // create account on firebase
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        return 'Data inserted successfully';
      } else {
        return 'Dublicate data';
      }
    } else {
      return 'Error occurred';
    }
  }

// --------------------------------------------------------
  // ********************
  Future postCategory(
    String categoryName,
    String categoryIcon,
    String status,
  ) async {
    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/auth/admin_login.php';

    // DateTime now = DateTime.now();
    // String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);

    // Send the POST request
    var response = await http.post(Uri.parse(apiUrl), body: {
      'username': categoryName,
      'email': categoryIcon,
      'phone': '987456',
      'password_hash': categoryName,
      'full_name': categoryName,
      'profile_picture': 'google.com',
      'role': 'admin',
    });

    if (response.statusCode == 200) {
      // print('object');
      // final jsonResponse = jsonDecode(response.body);
      // final message = jsonResponse['message'];
      // return message.toString();
    } else {
      return 'Error occurred';
    }
  }

  Future<void> putCategory(String email, String username) async {
    // Create a map of data to send in the request body

    // Convert the map to JSON
    Map<String, dynamic> data = {
      'id': '3',
      "username": "admin123",
      "email": "new@example.com",
      "phone": "1234567890",
      "password_hash": "newpassword",
      "full_name": "New Admin",
      "profile_picture": "profile.jpg",
      "role": "admin",
      "is_active": '1',
    };

    // Send the PUT request
    final response = await http.put(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: data,
    );

    // handle response
    if (response.statusCode == 200) {
      // print(response.body);
    } else {
      // Error handling
    }
  }

  Future<void> deleteAdminData() async {
    // body
    Map<String, dynamic> data = {
      "id": "3",
    };

    // calling delete api
    final response = await http.delete(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/x-www-form-urlencoded"},
      body: data,
    );

    // handle response
    if (response.statusCode == 200) {
      // print("Admin data deleted successfully");
      // print(json.decode(response.body));
    } else {}
  }
}
