import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BlogSection extends StatelessWidget {
  const BlogSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our Blog',
              style: GoogleFonts.roboto(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              'See how you can up your career status',
              style: GoogleFonts.roboto(
                fontSize: 14.0,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 14.0),
            Row(
              children: [
                Text(
                  'All Blog',
                  style: GoogleFonts.roboto(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 10.0),
                const Icon(Icons.trending_flat)
              ],
            ),
            const SizedBox(height: 14.0),
            Container(
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26.withOpacity(0),
                    offset: const Offset(0.0, 4.0),
                    blurRadius: 6.0,
                    spreadRadius: 0.0,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    ),
                    child: Image.asset('lib/resources/assets/images/blog.jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10.0),
                        Text(
                          'November 7, 2022',
                          style: GoogleFonts.roboto(
                            fontSize: 15.0,
                            color: Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Diamond Manor Apartment in the New York and Service',
                          style: GoogleFonts.roboto(
                            fontSize: 18.0,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'Bringing the culture of sharing to everyone',
                          style: GoogleFonts.roboto(
                            fontSize: 15.0,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 14.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
