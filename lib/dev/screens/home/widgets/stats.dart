import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StatsApp extends StatefulWidget {
  const StatsApp({super.key});

  @override
  State<StatsApp> createState() => _StatsAppState();
}

class _StatsAppState extends State<StatsApp> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '890M',
                    style: GoogleFonts.roboto(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    'Total Freelancer',
                    style: GoogleFonts.roboto(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '750M',
                    style: GoogleFonts.roboto(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    'Positive Review',
                    style: GoogleFonts.roboto(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24.0),
          // second - row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '98M',
                    style: GoogleFonts.roboto(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    'Order received',
                    style: GoogleFonts.roboto(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    '336M',
                    style: GoogleFonts.roboto(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 2.0),
                  Text(
                    'Projects Completed',
                    style: GoogleFonts.roboto(
                      fontSize: 16.0,
                      color: Colors.black87,
                    ),
                  ),
                ],
              )
            ],
          ),
          const SizedBox(height: 24.0),
          const Divider(),
        ],
      ),
    );
  }
}
