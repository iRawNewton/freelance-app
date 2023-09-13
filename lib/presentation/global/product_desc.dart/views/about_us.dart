import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../resources/constants/colors.dart';

class AboutUsSection extends StatefulWidget {
  const AboutUsSection({super.key});

  @override
  State<AboutUsSection> createState() => _AboutUsSectionState();
}

class _AboutUsSectionState extends State<AboutUsSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About this service',
            style: GoogleFonts.roboto(
              color: CustomColors.primaryTextColor,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            'Hello, Welcome If you are searching for a Mobile App, game, or Web UI UX designer. Get me hired for your UI/UX design project. I provide high-quality, contemporary screen designs that settle with new UI/UX patterns.',
            style: GoogleFonts.roboto(
              color: CustomColors.secondaryTextColor,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20.0),
          Text(
            'Why me?',
            style: GoogleFonts.roboto(
              color: CustomColors.secondaryTextColor,
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20.0),
          Text(
            'Hello, Welcome If you are searching for a Mobile App, game, or Web UI UX designer. Get me hired for your UI/UX design project. I provide high-quality, contemporary screen designs that settle with new UI/UX patterns.',
            style: GoogleFonts.roboto(
              color: CustomColors.secondaryTextColor,
              fontSize: 16.0,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
