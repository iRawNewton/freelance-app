// import 'package:intl/intl.dart';
// DateTime now = DateTime.now();
// String formattedTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(now);
import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freelance_app/resources/functions/convert.dart';
import 'package:freelance_app/services/upload_image.dart';
import 'package:http/http.dart' as http;
import 'package:freelance_app/resources/constants/strings.dart';

String baseUrl = ConstStrings.baseUrl;
String apiUrl = '$baseUrl/auth/admin_login.php';

class PostRemoteService {
  // & auth
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

  // & post products
  Future<String> postProducts(
    userId,
    projectCategory,
    projectSubcategory,
    projectTitle,
    projectMinDelivery,
    projctDescription,
    servicesProvided,
    toolsTechUsed,
    faqs,
    galleryImage,
    galleryFile,
    planType,
    singlePriceDesc,
    singlePrice,
    singleFeatures,
    starterPriceDesc,
    starterPrice,
    starterFeatures,
    proPriceDesc,
    proPrice,
    proFeatures,
    premiumPriceDesc,
    premiumPrice,
    premiumFeatures,
  ) async {
    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/product/products.php';

    List que = [
      'What services do you offer as a freelancer?',
      'What is your typical turnaround time for projects',
      'How do you handle revisions and feedback?',
      'What sets you apart from other freelancers?',
      'Can you share samples of your previous work?'
    ];

// Convert the lists to JSON arrays.
    String faqsAns = jsonEncode(faqs);
    String faqsQue = jsonEncode(que);
    String imageText = jsonEncode(galleryImage);

    var imageResult = '';

    var response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'user_id': userId,
        'project_category': projectCategory,
        'project_subcategory': projectSubcategory,
        'project_title': projectTitle,
        'project_min_delivery_time': projectMinDelivery,
        'project_description': projctDescription,
        'services_provided': servicesProvided,
        'tools_and_technologies': toolsTechUsed,
        'project_service_id': '1',
        'faqsQ': faqsQue,
        'faqsA': faqsAns,
        'imageText': imageText,
        'planType': planType,
        'singlePriceDesc': singlePriceDesc,
        'singlePrice': singlePrice,
        'singleFeatures': singleFeatures,
        'starterPriceDesc': starterPriceDesc,
        'starterPrice': starterPrice,
        'starterFeatures': starterFeatures,
        'proPriceDesc': proPriceDesc,
        'proPrice': proPrice,
        'proFeatures': proFeatures,
        'premiumPriceDesc': premiumPriceDesc,
        'premiumPrice': premiumPrice,
        'premiumFeatures': premiumFeatures,
      },
    );

    int imageCount =
        galleryImage.where((element) => element.toString().isNotEmpty).length;

    if (response.statusCode == 200) {
      for (int i = 0; i < imageCount; i++) {
        String fileName = galleryImage[i];
        File file = galleryFile[i];

        if (fileName.isNotEmpty) {
          var response = await ImageUpload().uploadProductImage(file, fileName);

          if (response == '"Image uploaded successfully"') {
            imageResult = 'Product Upload Successful';
          }
        }
      }

      if (imageResult == 'Product Upload Successful') {
        return 'Successfully uploaded';
      } else {
        return 'Failed to upload';
      }
    } else {
      return 'Failed to upload';
    }
  }

  // & post Services
  Future<String> postServices(
    userId,
    projectCategory,
    projectSubcategory,
    projectTitle,
    projectMinDelivery,
    projctDescription,
    servicesProvided,
    toolsTechUsed,
    faqs,
    galleryImage,
    galleryFile,
    planType,
    singlePriceDesc,
    singlePrice,
    singleFeatures,
    starterPriceDesc,
    starterPrice,
    starterFeatures,
    proPriceDesc,
    proPrice,
    proFeatures,
    premiumPriceDesc,
    premiumPrice,
    premiumFeatures,
  ) async {
    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/product/products.php';

    List que = [
      'How long have you been providing this service?',
      'What sets your service apart from competitiors?',
      'How far in advance should I book your service?',
      'What safety measures or protocols do you follow?',
      'Can you provide references or examples of your work?'
    ];

// Convert the lists to JSON arrays.
    String faqsAns = jsonEncode(faqs);
    String faqsQue = jsonEncode(que);
    String imageText = jsonEncode(galleryImage);

    var imageResult = '';

    var response = await http.post(
      Uri.parse(apiUrl),
      body: {
        'user_id': userId,
        'project_category': projectCategory,
        'project_subcategory': projectSubcategory,
        'project_title': projectTitle,
        'project_min_delivery_time': projectMinDelivery,
        'project_description': projctDescription,
        'services_provided': servicesProvided,
        'tools_and_technologies': toolsTechUsed,
        'project_service_id': '2',
        'faqsQ': faqsQue,
        'faqsA': faqsAns,
        'imageText': imageText,
        'planType': planType,
        'singlePriceDesc': singlePriceDesc,
        'singlePrice': singlePrice,
        'singleFeatures': singleFeatures,
        'starterPriceDesc': starterPriceDesc,
        'starterPrice': starterPrice,
        'starterFeatures': starterFeatures,
        'proPriceDesc': proPriceDesc,
        'proPrice': proPrice,
        'proFeatures': proFeatures,
        'premiumPriceDesc': premiumPriceDesc,
        'premiumPrice': premiumPrice,
        'premiumFeatures': premiumFeatures,
      },
    );

    int imageCount =
        galleryImage.where((element) => element.toString().isNotEmpty).length;

    if (response.statusCode == 200) {
      for (int i = 0; i < imageCount; i++) {
        String fileName = galleryImage[i];
        File file = galleryFile[i];

        if (fileName.isNotEmpty) {
          var response = await ImageUpload().uploadProductImage(file, fileName);
          if (response == '"Image uploaded successfully"') {
            imageResult = 'Product Upload Successful';
          }
        }
      }

      if (imageResult == 'Product Upload Successful') {
        return 'Successfully uploaded';
      } else {
        return 'Failed to upload';
      }
    } else {
      return 'Failed to upload';
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
