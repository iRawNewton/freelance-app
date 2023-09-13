import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class AppFooter extends StatefulWidget {
  const AppFooter({super.key});

  @override
  State<AppFooter> createState() => _AppFooterState();
}

class _AppFooterState extends State<AppFooter> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      color: Colors.black87,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text(
                  'Terms of Service',
                  style: GoogleFonts.roboto(
                    fontSize: 14.0,
                    color: Colors.white70,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Privacy Policy',
                    style: GoogleFonts.roboto(
                      fontSize: 14.0,
                      color: Colors.white70,
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Site Map',
                    style: GoogleFonts.roboto(
                      fontSize: 14.0,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              children: [
                Text(
                  'Follow Us',
                  style: GoogleFonts.roboto(
                    fontSize: 16.0,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(width: 10.0),
                SvgPicture.asset(
                  'lib/resources/assets/icons/facebook.svg',
                  height: 18.0,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(width: 10.0),
                SvgPicture.asset(
                  'lib/resources/assets/icons/twitter.svg',
                  height: 18.0,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(width: 10.0),
                SvgPicture.asset(
                  'lib/resources/assets/icons/instagram.svg',
                  height: 18.0,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
                const SizedBox(width: 10.0),
                SvgPicture.asset(
                  'lib/resources/assets/icons/linkedin.svg',
                  height: 18.0,
                  colorFilter:
                      const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
