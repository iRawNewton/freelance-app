import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelance_app/home_widget_1.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 70.0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SvgPicture.network(
                'https://demoapus1.com/freeio/wp-content/themes/freeio/images/logo.svg'),
          ),
          leadingWidth: 120.0,
          actions: [
            Text(
              'Login',
              style: GoogleFonts.lato(
                fontSize: 14.0,
                color: Colors.black87,
              ),
            ),
            const SizedBox(width: 25.0),
            const Icon(Icons.menu),
            const SizedBox(width: 8.0),
          ],
        ),
        body: Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          color: Colors.grey.shade200,
          child: Column(
            children: [
              const HomeWidget1(),
              const SizedBox(height: 20.0),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Browse talent by category',
                        style: GoogleFonts.roboto(
                          fontSize: 23.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'Get some Inspirations from 1800+ skills',
                        style: GoogleFonts.roboto(
                          fontSize: 13.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        'All Categories',
                        style: GoogleFonts.roboto(
                          fontSize: 13.0,
                        ),
                      ),
                      Container(
                        child: Column(
                          children: [
                            Container(
                              height: 20.0,
                              width: 20.0,
                              child: Stack(
                                children: [],
                              ),
                            ),
                            Text(
                              '8 Services',
                              style: GoogleFonts.roboto(
                                fontSize: 13.0,
                              ),
                            ),
                            Text(
                              'Development & IT',
                              style: GoogleFonts.roboto(
                                fontSize: 13.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
