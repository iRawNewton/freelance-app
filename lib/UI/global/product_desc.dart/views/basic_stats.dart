import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicStats extends StatefulWidget {
  const BasicStats({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.size,
  });

  final String icon, title, subtitle;
  final double size;

  @override
  State<BasicStats> createState() => _BasicStatsState();
}

class _BasicStatsState extends State<BasicStats> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 53.0,
                  width: 40.0,
                  child: Stack(
                    children: [
                      const Align(
                        alignment: Alignment.bottomRight,
                        child: CircleAvatar(
                          backgroundColor: Color(0xfffbf7ed),
                          radius: 15.0,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: SvgPicture.asset(
                          widget.icon,
                          height: widget.size,
                          colorFilter: const ColorFilter.mode(
                              Color(0xff1f4b3f), BlendMode.srcIn),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8.0),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.roboto(
                    color: Colors.black87,
                    fontSize: 16.0,
                  ),
                ),
                Text(
                  widget.subtitle,
                  style: GoogleFonts.roboto(
                    color: Colors.black87,
                    fontSize: 15.0,
                  ),
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}
