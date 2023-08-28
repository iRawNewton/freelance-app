import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

Future<String> uploadLogo(
  File imageFile1,
  File? imageFile2,
  File? imageFile3,
  File? imageFile4,
  File? imageFile5,
  String newFileName1,
  String? newFileName2,
  String? newFileName3,
  String? newFileName4,
  String? newFileName5,
) async {
  var stream1 = http.ByteStream(imageFile1.openRead().cast());
  var length1 = await imageFile1.length();
  var stream2 =
      imageFile2 != null ? http.ByteStream(imageFile2.openRead().cast()) : null;
  var length2 = imageFile2 != null ? await imageFile2.length() : null;
  var stream3 =
      imageFile3 != null ? http.ByteStream(imageFile3.openRead().cast()) : null;
  var length3 = imageFile3 != null ? await imageFile3.length() : null;
  var stream4 =
      imageFile4 != null ? http.ByteStream(imageFile4.openRead().cast()) : null;
  var length4 = imageFile4 != null ? await imageFile4.length() : null;
  var stream5 =
      imageFile5 != null ? http.ByteStream(imageFile5.openRead().cast()) : null;
  var length5 = imageFile5 != null ? await imageFile5.length() : null;

  var uri = Uri.parse('https://app.listafrica.org/API/gallery_upload.php');
  var request = http.MultipartRequest("POST", uri);

  var multipartFile1 = http.MultipartFile(
    'file1',
    stream1,
    length1,
    filename: newFileName1,
  );
  request.files.add(multipartFile1);

  if (stream2 != null && length2 != null) {
    var multipartFile2 = http.MultipartFile(
      'file2',
      stream2,
      length2,
      filename: newFileName2,
    );
    request.files.add(multipartFile2);
  }

  if (stream3 != null && length3 != null) {
    var multipartFile3 = http.MultipartFile(
      'file3',
      stream3,
      length3,
      filename: newFileName3,
    );
    request.files.add(multipartFile3);
  }

  if (stream4 != null && length4 != null) {
    var multipartFile4 = http.MultipartFile(
      'file4',
      stream4,
      length4,
      filename: newFileName4,
    );
    request.files.add(multipartFile4);
  }

  if (stream5 != null && length5 != null) {
    var multipartFile5 = http.MultipartFile(
      'file5',
      stream5,
      length5,
      filename: newFileName5,
    );
    request.files.add(multipartFile5);
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
// }