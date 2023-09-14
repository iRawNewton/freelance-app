import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDescTitle extends StatefulWidget {
  const ProductDescTitle({
    super.key,
    required this.title,
    required this.name,
  });

  final String title, name;

  @override
  State<ProductDescTitle> createState() => _ProductDescTitleState();
}

class _ProductDescTitleState extends State<ProductDescTitle> {
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
            Row(
              children: [
                const Icon(
                  Icons.account_circle_rounded,
                  size: 35.0,
                ),
                const SizedBox(width: 10.0),
                Text(
                  widget.name,
                  style: GoogleFonts.roboto(
                    color: Colors.black54,
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(width: 20.0),
                const Icon(
                  Icons.star_rounded,
                  color: Colors.amber,
                  size: 20.0,
                ),
                Text(
                  '4.0',
                  style:
                      GoogleFonts.roboto(color: Colors.black87, fontSize: 14.0),
                ),
                const SizedBox(width: 5.0),
                Text(
                  '(54) reviews',
                  style:
                      GoogleFonts.roboto(color: Colors.black54, fontSize: 13.0),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            const Row(
              children: [
                Icon(
                  Icons.preview_outlined,
                  color: Colors.black87,
                  size: 30,
                ),
                SizedBox(width: 10.0),
                Text('3249 Views')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
