import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/job/home/views/home_banner.dart';
import 'package:freelance_app/presentation/job/home/views/job_carousel.dart';
import 'package:freelance_app/presentation/job/home/views/job_category.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../resources/widgets/appbar.dart';
import '../description/job_desc.dart';

class JobHome extends StatefulWidget {
  const JobHome({super.key});

  @override
  State<JobHome> createState() => _JobHomeState();
}

class _JobHomeState extends State<JobHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) => [
                  JobAppBar(
                    onTap: () => _scaffoldKey.currentState?.openDrawer(),
                  ),
                ],
            body: Container(
              height: double.infinity,
              width: double.infinity,
              color: const Color.fromARGB(255, 222, 221, 221),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    JobBannerView(controller: controller),
                    const SizedBox(height: 10.0),

                    // ^ column for horizontal body padding
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20.0),
                          // ************************************
                          // ^ Popular Categories
                          // ************************************

                          // ^ popular category
                          Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Popular categories',
                              style: GoogleFonts.roboto(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: JobCustomColors.textColor),
                            ),
                          ),
                          const Row(
                            children: [
                              Expanded(child: Divider()),
                              SizedBox(width: 20.0),
                              Text('x'),
                              SizedBox(width: 20.0),
                              Expanded(child: Divider()),
                            ],
                          ),

                          // ^ height space
                          const SizedBox(height: 25.0),

                          const JobSpace(
                            serviceid1: '1',
                            iconAsset1: 'category[0]!.categoryImage',
                            services1: '8 Services',
                            title1: 'Accounts/Finance',
                            // ----------
                            serviceid2: '2',
                            iconAsset2: 'category[1]!.categoryImage',
                            services2: '1 Services',
                            title2: 'Health & Fitness',
                          ),

                          // ^ height space
                          const SizedBox(height: 25.0),

                          const JobSpace(
                            serviceid1: '1',
                            iconAsset1: 'category[0]!.categoryImage',
                            services1: '8 Services',
                            title1: 'IT & Consulting',
                            // ----------
                            serviceid2: '2',
                            iconAsset2: 'category[1]!.categoryImage',
                            services2: '1 Services',
                            title2: 'Telecommunication',
                          ),

                          // ^ height space
                          const SizedBox(height: 25.0),

                          const JobSpace(
                            serviceid1: '1',
                            iconAsset1: 'category[0]!.categoryImage',
                            services1: '8 Services',
                            title1: 'IT & Consulting',
                            // ----------
                            serviceid2: '2',
                            iconAsset2: 'category[1]!.categoryImage',
                            services2: '1 Services',
                            title2: 'Telecommunication',
                          ),

                          // ^ height space
                          const SizedBox(height: 25.0),

                          // ************************************
                          // ^ Recent Job Openings
                          // ************************************

                          // ^ jobs list
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              'Recent Job Openings',
                              style: GoogleFonts.roboto(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500,
                                  color: JobCustomColors.textColor),
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    navigateToPage(
                                        context, const JobDescription());
                                  },
                                  child: const JobCarousel(
                                    jobType: 'Full-time',
                                    color: JobCustomColors.green,
                                  ),
                                ),
                                const JobCarousel(
                                  jobType: 'Part-time',
                                  color: Color(0xffFF7E00),
                                ),
                                const JobCarousel(
                                  jobType: 'Remote',
                                  color: Color(0xff0054FF),
                                ),
                              ],
                            ),
                          ),

                          // ^ height space
                          const SizedBox(height: 25.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
