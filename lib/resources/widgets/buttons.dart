import 'package:flutter/material.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';

class CustomButton extends StatefulWidget {
  const CustomButton({
    super.key,
    required this.color,
    required this.title,
    required this.textColor,
    this.titleSize,
    this.weight,
    required this.onPressed,
  });
  final Color color, textColor;
  final String title;
  final double? titleSize;
  final FontWeight? weight;
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
        size: widget.titleSize ?? 14.0,
        color: widget.textColor,
        weight: widget.weight,
      ),
    );
  }
}
