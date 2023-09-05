import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../res/constants/strings.dart';

class ImageUpload {
  Future<String> uploadImage(File imageFile, String newFileName) async {
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
}
