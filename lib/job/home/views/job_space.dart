import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/constants/dimens.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../resources/functions/navigate_page.dart';
import '../../job_list/job_list.dart';

class JobSpace extends StatefulWidget {
  const JobSpace({
    super.key,
    required this.categoryid1,
    required this.iconAsset1,
    required this.services1,
    required this.title1,
    required this.categoryid2,
    required this.iconAsset2,
    required this.services2,
    required this.title2,
  });
  final String iconAsset1,
      services1,
      title1,
      iconAsset2,
      services2,
      title2,
      categoryid1,
      categoryid2;

  @override
  State<JobSpace> createState() => _JobSpaceState();
}

class _JobSpaceState extends State<JobSpace> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // first-category
        InkWell(
          onTap: () {
            navigateToPage(
              context,
              JobList(jobCategory: widget.categoryid1),
            );
          },
          child: Container(
            height: ScreenSize.height(context) * 0.22,
            width: ScreenSize.width(context) * 0.4,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 2,
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
                  SizedBox(
                    height: 60.0,
                    width: 65.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                              radius: 20.0,
                              backgroundColor: Colors.grey.shade400),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            'lib/resources/assets/icons/contract.svg',
                            colorFilter: const ColorFilter.mode(
                              JobCustomColors.textColor,
                              BlendMode.srcIn,
                            ),
                            height: 50.0,
                            width: 50.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    widget.services1,
                    style: GoogleFonts.roboto(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: JobCustomColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.title1,
                    style: GoogleFonts.roboto(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: JobCustomColors.textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),

        // second-category

        InkWell(
          onTap: () {
            navigateToPage(
              context,
              JobList(jobCategory: widget.categoryid2),
            );
          },
          child: Container(
            height: ScreenSize.height(context) * 0.22,
            width: ScreenSize.width(context) * 0.4,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 2,
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
                  SizedBox(
                    height: 60.0,
                    width: 65.0,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: CircleAvatar(
                            backgroundColor: Colors.grey.shade400,
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: SvgPicture.asset(
                            'lib/resources/assets/icons/contract.svg',
                            colorFilter: const ColorFilter.mode(
                              JobCustomColors.textColor,
                              BlendMode.srcIn,
                            ),
                            height: 50.0,
                            width: 50.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    widget.services1,
                    style: GoogleFonts.roboto(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: JobCustomColors.textColor,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.title2,
                    style: GoogleFonts.roboto(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: JobCustomColors.textColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class CategoryLoading extends StatefulWidget {
  const CategoryLoading({
    super.key,
  });

  @override
  State<CategoryLoading> createState() => _CategoryLoadingState();
}

class _CategoryLoadingState extends State<CategoryLoading> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // first-category
        Container(
          height: ScreenSize.height(context) * 0.2,
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
                SizedBox(
                  height: 60.0,
                  width: 65.0,
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
                        child: Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: Colors.grey.shade100,
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey.shade100,
                  child: const Card(
                    child: SizedBox(
                      height: 10.0,
                      width: 100.0,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey.shade100,
                  child: const Card(
                    child: SizedBox(
                      height: 10.0,
                      width: 100.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // second-category

        Container(
          height: ScreenSize.height(context) * 0.2,
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
                SizedBox(
                  height: 60.0,
                  width: 65.0,
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
                        child: Shimmer.fromColors(
                            baseColor: Colors.white,
                            highlightColor: Colors.grey.shade100,
                            child: const CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 30.0,
                            )),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24.0),
                Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey.shade100,
                  child: const Card(
                    child: SizedBox(
                      height: 10.0,
                      width: 100.0,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Shimmer.fromColors(
                  baseColor: Colors.white,
                  highlightColor: Colors.grey.shade100,
                  child: const Card(
                    child: SizedBox(
                      height: 10.0,
                      width: 100.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
