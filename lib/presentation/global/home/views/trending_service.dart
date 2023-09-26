import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/product_desc.dart';
import 'package:freelance_app/resources/constants/strings.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';

import 'package:google_fonts/google_fonts.dart';

import '../../../../resources/constants/dimens.dart';
import '../../../../models/home_model.dart';

class TrendingSection extends StatefulWidget {
  const TrendingSection({super.key, required this.projects});

  final List<Project?> projects;

  @override
  State<TrendingSection> createState() => _TrendingSectionState();
}

class _TrendingSectionState extends State<TrendingSection> {
  final trendingServiceController = PageController(
    initialPage: 0,
  );

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
              'Trending Freelancers',
              style: GoogleFonts.roboto(
                fontSize: 23.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16.0),
            Text(
              'Most viewed and all-time top freelancers',
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
            SizedBox(
              height: 550.0,
              width: double.infinity,
              child: PageView(
                controller: trendingServiceController,
                children: [
                  ListView.builder(
                    // physics: const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: widget.projects.length,

                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.9,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // ^ image, title, review
                              InkWell(
                                onTap: () {
                                  navigateToPage(
                                    context,
                                    ProductDesc(
                                        productId:
                                            widget.projects[index]!.projectId),
                                  );
                                },
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.sizeOf(context).height *
                                              0.35,
                                      width: double.infinity,
                                      child: Card(
                                        color: const Color(0xffF1FCFA),
                                        elevation: 0,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              '$productImage/${widget.projects[index]!.images.gallery1}',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 24.0),
                                    Text(
                                      widget.projects[index]!.categoryName,
                                      style: GoogleFonts.roboto(
                                        fontSize: 14.0,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    const SizedBox(height: 16.0),
                                    SizedBox(
                                      height: 70.0,
                                      child: Text(
                                        widget.projects[index]!.projectTitle,
                                        style: GoogleFonts.roboto(
                                          fontSize: 16.0,
                                          color: Colors.black87,
                                        ),
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
                                              color: Colors.black87,
                                              fontSize: 14.0),
                                        ),
                                        Text(
                                          '(3 Reviews)',
                                          style: GoogleFonts.roboto(
                                              color: Colors.black54,
                                              fontSize: 13.0),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                                      '${widget.projects[index]!.firstName} ${widget.projects[index]!.lastName}',
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
                        ),
                      );
                    },
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
