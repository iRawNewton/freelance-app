import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../resources/constants/dimens.dart';
import '../../../../resources/constants/strings.dart';

class StaticSectionOne extends StatefulWidget {
  const StaticSectionOne({super.key});

  @override
  State<StaticSectionOne> createState() => _StaticSectionOneState();
}

class _StaticSectionOneState extends State<StaticSectionOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xfffbf7ed),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 24.0),
            Text(
              'A whole world of freelance talent at your fingertips',
              style: GoogleFonts.roboto(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            // proof-of-quality
            const SizedBox(height: 24.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  '$iconLocation/badge.svg',
                  colorFilter: const ColorFilter.mode(
                      CustomColors.primaryColor, BlendMode.srcIn),
                  height: 30.0,
                  width: ScreenSize.width(context) * 0.15,
                ),
                const SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Proof of quality',
                      style: GoogleFonts.roboto(
                        fontSize: 15.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: ScreenSize.width(context) * 0.75,
                      child: Text(
                        'Check any pro\'s work samples, client reviews, and identity verification.',
                        style: GoogleFonts.roboto(
                          fontSize: 13.0,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            // no-cost
            const SizedBox(height: 24.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  '$iconLocation/save-money.svg',
                  colorFilter: const ColorFilter.mode(
                      CustomColors.primaryColor, BlendMode.srcIn),
                  height: 30.0,
                  width: ScreenSize.width(context) * 0.15,
                ),
                const SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'No cost until you hire',
                      style: GoogleFonts.roboto(
                        fontSize: 15.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: ScreenSize.width(context) * 0.75,
                      child: Text(
                        'Check any pro\'s work samples, client reviews, and identity verification.',
                        style: GoogleFonts.roboto(
                          fontSize: 13.0,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            // safe-and-secure
            const SizedBox(height: 24.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(
                  '$iconLocation/security.svg',
                  colorFilter: const ColorFilter.mode(
                      CustomColors.primaryColor, BlendMode.srcIn),
                  height: 30.0,
                  width: ScreenSize.width(context) * 0.15,
                ),
                const SizedBox(width: 15.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'safe and secure',
                      style: GoogleFonts.roboto(
                        fontSize: 15.0,
                        color: Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(
                      width: ScreenSize.width(context) * 0.75,
                      child: Text(
                        'Check any pro\'s work samples, client reviews, and identity verification.',
                        style: GoogleFonts.roboto(
                          fontSize: 13.0,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(height: 28.0),
          ],
        ),
      ),
    );
  }
}
