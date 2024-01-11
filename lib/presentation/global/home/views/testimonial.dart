import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TestimonialSection extends StatefulWidget {
  const TestimonialSection({super.key});

  @override
  State<TestimonialSection> createState() => _TestimonialSectionState();
}

class _TestimonialSectionState extends State<TestimonialSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Text(
            'Testimonials',
            style: GoogleFonts.roboto(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          Text(
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
            style: GoogleFonts.roboto(
              fontSize: 14.0,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 24.0),
          Image.asset('lib/resources/assets/images/icon-test.png'),
          const SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              '"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."',
              style: GoogleFonts.roboto(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 24.0),
          Text(
            'Ali Tufan',
            style: GoogleFonts.roboto(
              fontSize: 17.0,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
          Text(
            'Project Manager, Apple Inc',
            style: GoogleFonts.roboto(
              fontSize: 14.0,
              color: Colors.black87,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
