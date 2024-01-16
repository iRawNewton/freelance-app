import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:freelance_app/presentation/global/category_list/func/switch_category.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/constants/dimens.dart';
import 'package:freelance_app/resources/constants/strings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class CategorySpace extends StatefulWidget {
  const CategorySpace({
    super.key,
    required this.serviceid1,
    required this.iconAsset1,
    required this.services1,
    required this.title1,
    required this.serviceid2,
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
      serviceid1,
      serviceid2;

  @override
  State<CategorySpace> createState() => _CategorySpaceState();
}

class _CategorySpaceState extends State<CategorySpace> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        // first-category
        InkWell(
          onTap: () {
            switchCategoryList(context, widget.serviceid1);
          },
          child: Container(
            height: ScreenSize.height(context) * 0.22,
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
                          child: SvgPicture.network(
                            '$categoryIcon/${widget.iconAsset1}',
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
                  const SizedBox(height: 24.0),
                  Text(
                    widget.services1,
                    style: GoogleFonts.roboto(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.title1,
                    style: GoogleFonts.roboto(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
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
            switchCategoryList(context, widget.serviceid2);
          },
          child: Container(
            height: ScreenSize.height(context) * 0.22,
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
                          child: SvgPicture.network(
                            '$categoryIcon/${widget.iconAsset2}',
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
                  const SizedBox(height: 24.0),
                  Text(
                    widget.services2,
                    style: GoogleFonts.roboto(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w400,
                      color: Colors.black54,
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    widget.title2,
                    style: GoogleFonts.roboto(
                      fontSize: 13.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
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
