import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// Need something done?

import 'package:google_fonts/google_fonts.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../resources/constants/dimens.dart';
import '../../../../resources/constants/strings.dart';

class ServicesPage extends StatefulWidget {
  const ServicesPage({super.key});

  @override
  State<ServicesPage> createState() => _ServicesPageState();
}

class _ServicesPageState extends State<ServicesPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white70,
      child: Column(
        children: [
          const SizedBox(height: 14.0),
          Text(
            'Need something done?',
            style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: Colors.black87),
          ),
          const SizedBox(height: 8.0),
          Text(
            'Most viewed and all-time top-selling services',
            style: GoogleFonts.roboto(fontSize: 16.0, color: Colors.black87),
          ),
          // *****************
          Row(
            children: [
              Container(
                // height: ScreenSize.height(context) * 0.2,
                width: ScreenSize.width(context) * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      // offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60.0,
                        width: 65.0,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: SvgPicture.asset(
                                '$iconLocation/maid_service.svg',
                                colorFilter: const ColorFilter.mode(
                                  CustomColors.primaryColor,
                                  BlendMode.srcIn,
                                ),
                                height: 50.0,
                                width: 50.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Maid Service',
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Professional cleaning services for homes, including tasks like cleaning, dusting, vacuuming, and organizing.',
                        style: GoogleFonts.roboto(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ],
                  ),
                ),
              ),
              // second-row
              Container(
                // height: ScreenSize.height(context) * 0.2,
                width: ScreenSize.width(context) * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      // offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60.0,
                        width: 65.0,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: SvgPicture.asset(
                                '$iconLocation/laundry_service.svg',
                                colorFilter: const ColorFilter.mode(
                                  CustomColors.primaryColor,
                                  BlendMode.srcIn,
                                ),
                                height: 50.0,
                                width: 50.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Laundry Service',
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Service that offers washing, drying, and folding of clothes, often with pickup and delivery options.',
                        style: GoogleFonts.roboto(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // second column
          Row(
            children: [
              Container(
                // height: ScreenSize.height(context) * 0.2,
                width: ScreenSize.width(context) * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      // offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60.0,
                        width: 65.0,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: SvgPicture.asset(
                                '$iconLocation/Interior_Design_Consultation.svg',
                                colorFilter: const ColorFilter.mode(
                                  CustomColors.primaryColor,
                                  BlendMode.srcIn,
                                ),
                                height: 50.0,
                                width: 50.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Interior Design Consultation ',
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Consultation and design services to help clients plan and decorate their living spaces.',
                        style: GoogleFonts.roboto(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // second-row
              Container(
                // height: ScreenSize.height(context) * 0.2,
                width: ScreenSize.width(context) * 0.5,
                decoration: BoxDecoration(
                  color: Colors.white38,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.white,
                      spreadRadius: 1,
                      // offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15.0,
                    vertical: 20.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60.0,
                        width: 65.0,
                        child: Stack(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: SvgPicture.asset(
                                '$iconLocation/ac_services.svg',
                                colorFilter: const ColorFilter.mode(
                                  CustomColors.primaryColor,
                                  BlendMode.srcIn,
                                ),
                                height: 50.0,
                                width: 50.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'AC Cleaning and Maintenance',
                        style: GoogleFonts.roboto(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        'Maintenance and cleaning of air conditioning systems to improve their efficiency and air quality.',
                        style: GoogleFonts.roboto(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
