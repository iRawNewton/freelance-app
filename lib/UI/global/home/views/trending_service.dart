import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../res/constants/dimens.dart';

class TrendingSection extends StatefulWidget {
  const TrendingSection({super.key});

  @override
  State<TrendingSection> createState() => _TrendingSectionState();
}

class _TrendingSectionState extends State<TrendingSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.width(context),
      decoration: BoxDecoration(
        color: const Color(0xffF1FCFA),
        borderRadius: BorderRadiusDirectional.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15.0,
          vertical: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24.0),
            Text(
              'Trending Services',
              style: GoogleFonts.roboto(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Most viewed and all-time top-selling services',
              style: GoogleFonts.roboto(
                fontSize: 15.0,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16.0),
            Row(
              children: [
                Text(
                  'All Services',
                  style: GoogleFonts.roboto(
                    fontSize: 15.0,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 10.0),
                const Icon(
                  Icons.arrow_right_alt_outlined,
                  color: Colors.black87,
                ),
              ],
            ),
            const SizedBox(height: 24.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CachedNetworkImage(
                  imageUrl:
                      'https://demoapus1.com/freeio/wp-content/uploads/2022/11/service12-495x370.jpg',
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: 24.0),
                Text(
                  'Development & IT',
                  style: GoogleFonts.roboto(
                    fontSize: 14.0,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Web Development, with HTML, CSS, JavaScript and PHP',
                  style: GoogleFonts.roboto(
                    fontSize: 18.0,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    const Icon(
                      Icons.star_rounded,
                      color: Colors.amber,
                    ),
                    Text(
                      '4.0 ',
                      style: GoogleFonts.roboto(
                          color: Colors.black87, fontSize: 14.0),
                    ),
                    Text(
                      '(3 Reviews)',
                      style: GoogleFonts.roboto(
                          color: Colors.black54, fontSize: 13.0),
                    ),
                  ],
                ),
                const Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10.0,
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.account_circle_rounded,
                      ),
                      Text(
                        ' Agent Pakulla',
                        style: GoogleFonts.roboto(
                          color: Colors.black54,
                          fontSize: 14.0,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'Starting at: ',
                        style: GoogleFonts.roboto(
                          color: Colors.black54,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        '\$29',
                        style: GoogleFonts.roboto(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
