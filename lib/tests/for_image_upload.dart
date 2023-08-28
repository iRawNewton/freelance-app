import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<String> uploadLogo(
  List<File?> imageFiles,
  List<String?> newFileNames,
) async {
  var uri = Uri.parse('https://app.listafrica.org/API/gallery_upload.php');
  var request = http.MultipartRequest("POST", uri);

  for (int i = 0; i < imageFiles.length; i++) {
    File? imageFile = imageFiles[i];
    String? newFileName = newFileNames[i];

    if (imageFile != null) {
      var stream = http.ByteStream(imageFile.openRead().cast());
      var length = await imageFile.length();

      var multipartFile = http.MultipartFile(
        'file${i + 1}', // 'file1', 'file2', ...
        stream,
        length,
        filename: newFileName,
      );

      request.files.add(multipartFile);
    }
  }

  var response = await request.send();
  if (response.statusCode == 200) {
    var responseBody = await response.stream.transform(utf8.decoder).join();
    return responseBody;
  } else {
    throw Exception(
        'Failed to upload images. Status code: ${response.statusCode}');
  }
}


// List<File?> imageFiles = [imageFile1, imageFile2, imageFile3, ...];
// List<String?> newFileNames = [newFileName1, newFileName2, newFileName3, ...];

// await uploadLogo(imageFiles, newFileNames);
