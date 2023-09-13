import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../resources/constants/strings.dart';

class ImageUpload {
  // & profile picture upload
  Future<String> uploadLogoImage(File imageFile, String newFileName) async {
    var stream = http.ByteStream(imageFile.openRead().cast());
    var length = await imageFile.length();

    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/uploads/profile_pic_upload.php';

    var uri = Uri.parse(apiUrl);
    var request = http.MultipartRequest("POST", uri);

    var multipartFile = http.MultipartFile(
      'file',
      stream,
      length,
      filename: newFileName,
    );

    request.files.add(multipartFile);
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.transform(utf8.decoder).join();

      return responseBody;
    } else {
      throw Exception(
          'Failed to upload image. Status code: ${response.statusCode}');
    }
  }

  // & product image upload
  Future<String> uploadProductImage(File imageFile, String newFileName) async {
    var stream = http.ByteStream(imageFile.openRead().cast());
    var length = await imageFile.length();

    String baseUrl = ConstStrings.baseUrl;
    String apiUrl = '$baseUrl/uploads/product_pic_upload.php';

    var uri = Uri.parse(apiUrl);
    var request = http.MultipartRequest("POST", uri);

    var multipartFile = http.MultipartFile(
      'file',
      stream,
      length,
      filename: newFileName,
    );

    request.files.add(multipartFile);
    var response = await request.send();

    if (response.statusCode == 200) {
      var responseBody = await response.stream.transform(utf8.decoder).join();

      return responseBody;
    } else {
      throw Exception(
          'Failed to upload image. Status code: ${response.statusCode}');
    }
  }

  // Future<String> uploadProductImagesTest(
  //     List<File> imageFiles, List<String> fileNames) async {
  //   String baseUrl = ConstStrings.baseUrl;
  //   String apiUrl = '$baseUrl/uploads/product_pic_upload.php';
  //   var uri = Uri.parse(apiUrl);
  //   var request = http.MultipartRequest("POST", uri);
  //   // Iterate through the list of files and file names
  //   for (int i = 0; i < imageFiles.length; i++) {
  //     var imageFile = imageFiles[i];
  //     var fileName = fileNames[i];
  //     var stream = http.ByteStream(imageFile.openRead().cast());
  //     var length = await imageFile.length();
  //     var multipartFile = http.MultipartFile(
  //       'files[]', // Use 'files[]' to represent an array of files in PHP.
  //       stream,
  //       length,
  //       filename: fileName,
  //     );
  //     request.files.add(multipartFile);
  //   }
  //   var response = await request.send();
  //   print(response.statusCode);
  //   if (response.statusCode == 200) {
  //     // var responseBody = await response.stream.transform(utf8.decoder).join();
  //     // List<String> uploadedFileUrls = responseBody
  //     //     .split(','); // Assuming the server returns comma-separated URLs.
  //     // return uploadedFileUrls;
  //     return '';
  //   } else {
  //     throw Exception(
  //         'Failed to upload images. Status code: ${response.statusCode}');
  //   }
  // }
}
