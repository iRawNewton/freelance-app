import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/job/home/views/home_banner.dart';
import 'package:freelance_app/presentation/job/home/views/job_category.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../resources/widgets/appbar.dart';
import '../../global/home/views/category.dart';

class JobHome extends StatefulWidget {
  const JobHome({super.key});

  @override
  State<JobHome> createState() => _JobHomeState();
}

class _JobHomeState extends State<JobHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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
              color: JobCustomColors.primaryBackground,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const JobBannerView(),
                  const SizedBox(height: 10.0),

                  // ^ column for horizontal body padding
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      children: [
                        // ^ trending job title
                        Text(
                          'Trending job categories',
                          style: GoogleFonts.roboto(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: JobCustomColors.textColor2),
                        ),

                        // ^ category cards
                        const SizedBox(height: 24.0),
                        /*
                        f4f4f9 ghost white 
                        b8dbd9 light blue 
                        586f7c payne's gray
                        2f4550 charcoal
                        000000 black
                         */
                        const JobSpace(
                          serviceid1: '1',
                          iconAsset1: 'category[0]!.categoryImage',
                          services1: '8 Services',
                          title1: 'asdfasdfasdf',
                          // ----------
                          serviceid2: '1',
                          iconAsset2: 'category[1]!.categoryImage',
                          services2: '1 Services',
                          title2: 'category[1]!.categoryName',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
