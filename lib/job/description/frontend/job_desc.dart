import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:freelance_app/job/description/frontend/views/job_details_card.dart';
import 'package:freelance_app/job/drawyer/job_drawer.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/widgets/buttons.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import '../../../resources/widgets/appbar.dart';

class JobDescription extends StatefulWidget {
  const JobDescription({
    super.key,
    required this.jobId,
    required this.jobTitle,
    required this.jobType,
    required this.companyName,
    required this.jobLocation,
    required this.salaryMin,
    required this.salaryMax,
    required this.shortDescription,
    required this.longDescription,
    required this.jobRequirements,
    required this.jobResponsibilities,
    required this.jobQualification,
    required this.jobSkills,
    required this.jobCategory,
    required this.jobSubCategory,
  });
  final String jobId,
      jobTitle,
      jobType,
      companyName,
      jobLocation,
      salaryMin,
      salaryMax,
      shortDescription,
      longDescription,
      jobRequirements,
      jobResponsibilities,
      jobQualification,
      jobSkills,
      jobCategory,
      jobSubCategory;

  @override
  State<JobDescription> createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const JobDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            JobAppBar(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ],
          body: SizedBox(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ^ job title
                  Hero(
                    tag: 'tag-1',
                    transitionOnUserGestures: true,
                    child: Container(
                      width: double.infinity,
                      color: const Color(0xff081721),
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30.0),

                            // ^ job type | full time| Part time| Remote
                            SizedBox(
                              width: 100.0,
                              height: 30.0,
                              child: CustomButton(
                                color: const Color(0xff7BBD15),
                                title: widget.jobType,
                                textColor: Colors.white,
                                titleSize: 12.0,
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            CustomJobText(
                              title: widget.jobTitle,
                              size: 24.0,
                              color: const Color(0xffd7dde2),
                              weight: FontWeight.bold,
                            ),

                            // ^ location & ratings
                            const SizedBox(height: 10.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.location_on,
                                  color: Color(0xffd7dde2),
                                ),
                                CustomJobText(
                                  title: widget.jobLocation,
                                  size: 14.0,
                                  color: const Color(0xffd7dde2),
                                ),
                                const SizedBox(width: 40.0),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  allowHalfRating: false,
                                  itemCount: 5,
                                  itemSize: 15.0,
                                  itemPadding: const EdgeInsets.symmetric(
                                      horizontal: 2.0),
                                  itemBuilder: (context, _) => const Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                  ),
                                  unratedColor: const Color(0xffd7dde2),
                                  onRatingUpdate: (rating) {
                                    // print(rating);
                                  },
                                ),
                                const CustomJobText(
                                  title: '4.6',
                                  size: 14.0,
                                  color: Color(0xffF8F9FA),
                                ),
                              ],
                            ),

                            // ^ description
                            const SizedBox(height: 20.0),
                            CustomJobText(
                              title: widget.shortDescription,
                              size: 14.0,
                              color: const Color(0xffd7dde2),
                            ),

                            // ^ department and company
                            const SizedBox(height: 30.0),

                            // ^ department
                            Row(
                              children: [
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.work_history,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                    const SizedBox(width: 5.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const CustomJobText(
                                          title: 'Category',
                                          size: 14.0,
                                          color: Color(0xffF8F9FA),
                                        ),
                                        CustomJobText(
                                          title: widget.jobCategory,
                                          size: 16.0,
                                          color: const Color(0xffF8F9FA),
                                          weight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                const SizedBox(width: 20.0),

                                // ^ company
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.corporate_fare_rounded,
                                      color: Colors.white,
                                      size: 30.0,
                                    ),
                                    const SizedBox(width: 5.0),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const CustomJobText(
                                          title: 'Company',
                                          size: 14.0,
                                          color: Color(0xffF8F9FA),
                                        ),
                                        CustomJobText(
                                          title: widget.companyName,
                                          size: 16.0,
                                          color: const Color(0xffF8F9FA),
                                          weight: FontWeight.w700,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),

                            // ^ salary
                            const SizedBox(height: 20.0),
                            Row(
                              children: [
                                const Icon(
                                  Icons.attach_money_rounded,
                                  color: Colors.white,
                                  size: 30.0,
                                ),
                                const SizedBox(width: 5.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const CustomJobText(
                                      title: 'Salary',
                                      size: 14.0,
                                      color: Color(0xffF8F9FA),
                                    ),
                                    CustomJobText(
                                      title:
                                          '${widget.salaryMin} - ${widget.salaryMax}',
                                      size: 16.0,
                                      color: const Color(0xffF8F9FA),
                                      weight: FontWeight.w700,
                                    ),
                                    const SizedBox(height: 20.0),
                                  ],
                                ),
                              ],
                            ),

                            // ^ apply button
                            const SizedBox(height: 10.0),
                            SizedBox(
                              width: MediaQuery.sizeOf(context).width * 0.9,
                              child: CustomButton(
                                color: JobCustomColors.green,
                                title: 'Apply Now',
                                textColor: Colors.white,
                                titleSize: 16.0,
                                weight: FontWeight.w500,
                                onPressed: () {
                                  // TODO: POST BUTTON API
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // ^ ==============================
                  // * job details starts
                  // ^ ==============================

                  const SizedBox(height: 20.0),
                  JobDetailsCard(
                    description: widget.longDescription,
                    requirements: widget.jobRequirements,
                    responsiblity: widget.jobResponsibilities,
                    qualificatonSkill: widget.jobQualification,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
