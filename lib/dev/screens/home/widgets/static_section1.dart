import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StaticSectionTwo extends StatelessWidget {
  const StaticSectionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xff1F4B3F),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
          vertical: 20.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Join World\'s Best Marketplace For Workers',
              style: GoogleFonts.roboto(
                color: Colors.white70,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 24.0),
            Text(
              'Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit. Exercitation veniam consequat sunt nostrud amet.',
              style: GoogleFonts.roboto(
                color: Colors.white70,
                fontSize: 14.0,
              ),
            ),
            const SizedBox(height: 14.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.1,
                  child: const Icon(
                    Icons.done,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: Text(
                    'Connect to freelancers with proven business experience',
                    style: GoogleFonts.roboto(
                      color: Colors.white70,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.1,
                  child: const Icon(
                    Icons.done,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: Text(
                    'Get matched with the perfect talent by a customer success manager',
                    style: GoogleFonts.roboto(
                      color: Colors.white70,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.1,
                  child: const Icon(
                    Icons.done,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.8,
                  child: Text(
                    'Unmatched quality of remote, hybrid, and flexible jobs',
                    style: GoogleFonts.roboto(
                      color: Colors.white70,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 14.0),
            Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                height: 50.0,
                child: Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5bbb7b),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    icon: const Icon(
                      Icons.north_east,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Find Talent',
                      style: GoogleFonts.roboto(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14.0),
          ],
        ),
      ),
    );
  }
}
