import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatefulWidget {
  const CustomText({
    super.key,
    required this.title,
    required this.size,
    required this.color,
    this.weight,
    this.textAlign,
  });
  final String title;
  final double size;
  final Color color;
  final FontWeight? weight;
  final TextAlign? textAlign;
  @override
  State<CustomText> createState() => _CustomTextState();
}

class _CustomTextState extends State<CustomText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.title,
      style: GoogleFonts.roboto(
        fontSize: widget.size,
        color: widget.color,
        fontWeight: widget.weight ?? FontWeight.normal,
      ),
      textAlign: widget.textAlign,
    );
  }
}
