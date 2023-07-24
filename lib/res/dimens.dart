import 'package:flutter/material.dart';

class ScreenSize {
  static double height(BuildContext context) {
    return MediaQuery.sizeOf(context).height;
  }

  static double width(BuildContext context) {
    return MediaQuery.sizeOf(context).width;
  }
}
