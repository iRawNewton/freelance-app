import 'dart:math';

import 'package:image_picker/image_picker.dart';

class PhotoSelectionResult {
  final String fileName;
  final String filePath;

  PhotoSelectionResult(this.fileName, this.filePath);
}

Future<PhotoSelectionResult> selectPhoto() async {
  final picker = ImagePicker();
  final pickedFile = await picker.pickImage(
    source: ImageSource.gallery,
    imageQuality: 80,
  );

  late PhotoSelectionResult result;

  if (pickedFile != null) {
    // Generate a random 5-digit number
    final randomNumber = Random().nextInt(100000);

    // Get the file extension from the picked file's path
    final fileExtension = pickedFile.path.split('.').last;

    // Change the file name
    final newFileName = '$randomNumber.$fileExtension';

    result = PhotoSelectionResult('freelance$newFileName', pickedFile.path);
  } else {
    // Default values if no file was picked
    result = PhotoSelectionResult('', '');
  }

  return result;
}
