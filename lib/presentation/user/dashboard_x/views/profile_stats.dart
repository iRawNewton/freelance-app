import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../resources/constants/dimens.dart';
import '../../../../resources/constants/strings.dart';

class UserProfileStats extends StatefulWidget {
  const UserProfileStats({
    super.key,
    required this.image1,
    required this.image2,
    required this.title1,
    required this.title2,
    required this.stat1,
    required this.stat2,
    required this.onTap1,
    required this.onTap2,
  });
  final String image1, image2, title1, title2, stat1, stat2;
  // final Function()? onTap;
  final void Function()? onTap1, onTap2;

  @override
  State<UserProfileStats> createState() => _UserProfileStatsState();
}

class _UserProfileStatsState extends State<UserProfileStats> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // first-category
        InkWell(
          onTap: widget.onTap1,
          child: Material(
            elevation: 3,
            child: Container(
              // height: ScreenSize.height(context) * 0.2,
              width: ScreenSize.width(context) * 0.4,
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
                  vertical: 15.0,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 18.0),
                    SizedBox(
                      height: 50.0,
                      width: 75.0,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.orange.shade50,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: SvgPicture.asset(
                              '$iconLocation/${widget.image1}',
                              colorFilter: const ColorFilter.mode(
                                CustomColors.primaryColor,
                                BlendMode.srcIn,
                              ),
                              height: 60.0,
                              width: 60.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      widget.title1,
                      style: GoogleFonts.roboto(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      widget.stat1,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.primaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        // second-category
        InkWell(
          onTap: widget.onTap2,
          child: Material(
            elevation: 3,
            child: Container(
              // height: ScreenSize.height(context) * 0.2,
              width: ScreenSize.width(context) * 0.4,
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
                  vertical: 15.0,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 18.0),
                    SizedBox(
                      height: 50.0,
                      width: 75.0,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.bottomRight,
                            child: CircleAvatar(
                              backgroundColor: Colors.orange.shade50,
                            ),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: SvgPicture.asset(
                              '$iconLocation/${widget.image2}',
                              colorFilter: const ColorFilter.mode(
                                CustomColors.primaryColor,
                                BlendMode.srcIn,
                              ),
                              height: 60.0,
                              width: 60.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Text(
                      widget.title2,
                      style: GoogleFonts.roboto(
                        fontSize: 12.0,
                        fontWeight: FontWeight.w400,
                        color: CustomColors.primaryTextColor,
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      widget.stat2,
                      style: GoogleFonts.roboto(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w500,
                        color: CustomColors.primaryTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
