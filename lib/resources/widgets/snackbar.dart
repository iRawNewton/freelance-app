import 'package:flutter/material.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> customSnackBar(
    context, message, color, textColor) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: CustomText(
        title: message,
        size: 14.0,
        color: textColor,
      ),
      backgroundColor: color,
      duration: const Duration(seconds: 5),
      action: SnackBarAction(
        label: 'Dismiss',
        textColor: textColor,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
    ),
  );
}
