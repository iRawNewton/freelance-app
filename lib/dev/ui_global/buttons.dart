import 'package:flutter/material.dart';
import 'package:freelance_app/dev/ui_global/text_widget.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.title,
    required this.textColor,
    required this.onPressed,
  });
  final Color color, textColor;
  final String title;
  final void Function() onPressed;
  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: widget.color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            10.0,
          ),
        ),
      ),
      onPressed: widget.onPressed,
      child: CustomText(
        title: widget.title,
        size: 14.0,
        color: widget.textColor,
      ),
    );
  }
}
