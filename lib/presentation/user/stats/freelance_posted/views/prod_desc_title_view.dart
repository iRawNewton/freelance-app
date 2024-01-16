import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDescTitleView extends StatefulWidget {
  const ProductDescTitleView({
    super.key,
    required this.title,
    required this.name,
  });

  final String title, name;

  @override
  State<ProductDescTitleView> createState() => _ProductDescTitleViewState();
}

class _ProductDescTitleViewState extends State<ProductDescTitleView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xffF0EFEC),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: GoogleFonts.roboto(
                fontSize: 24.0,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
