import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';

generateUsername(String email) {
  // Extract username from email
  String emailId = email.split('@')[0];

  // Generate a random 6-digit number
  int randomNumber = Random().nextInt(900000) + 100000;

  // Combine username and random number
  return ('$emailId$randomNumber');
}

generateSHA256String(String password) {
  // Convert the string to a list of bytes
  List<int> inputBytes = utf8.encode(password);

  // Create a SHA-256 hash
  Digest digest = sha256.convert(inputBytes);

  // Convert the digest to a hex string
  return (digest.toString());
}

bool emailValidityChecker(String email) {
  final emailRegExp = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
  return emailRegExp.hasMatch(email);
}

bool passwordValidChecker(String password) {
  // Regular expression to match password criteria
  final passwordRegExp = RegExp(
    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$',
  );

  return passwordRegExp.hasMatch(password);
}
