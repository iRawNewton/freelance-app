import 'package:flutter/material.dart';
import 'package:freelance_app/job/description/frontend/job_desc.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';

import '../../../resources/constants/colors.dart';
import '../../../resources/widgets/buttons.dart';
import '../../../resources/widgets/text_widget.dart';

class JobCarousel extends StatefulWidget {
  const JobCarousel({
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
    required this.jobCategoryName,
    required this.jobSubCategoryName,
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
      jobCategoryName,
      jobSubCategoryName;

  @override
  State<JobCarousel> createState() => _JobCarouselState();
}

class _JobCarouselState extends State<JobCarousel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ^ height space
            const SizedBox(height: 25.0),
            Container(
              // height: 200.0,
              width: MediaQuery.sizeOf(context).width * 0.9,
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
                padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 0.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // ^ logo & country name
                      Row(
                        children: [
                          Container(
                            height: 80.0,
                            width: 80.0,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                color: Colors.grey.shade300,
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: SizedBox(
                                child: Image.network(
                                    'https://htmldemo.net/finate/finate/assets/img/companies/1.webp'),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 14.0),
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomJobText(
                                    title: widget.companyName,
                                    size: 18.0,
                                    color: JobCustomColors.textColor,
                                    weight: FontWeight.w500,
                                  ),
                                  const SizedBox(height: 5.0),
                                  CustomJobText(
                                    title: widget.jobLocation,
                                    size: 14.0,
                                    color: const Color(0xff656565),
                                    weight: FontWeight.w500,
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),

                      // ^ height space
                      const SizedBox(height: 20.0),

                      // ^ title & type
                      CustomJobText(
                        title: widget.jobTitle,
                        size: 18.0,
                        color: JobCustomColors.textColor,
                        weight: FontWeight.w600,
                      ),
                      CustomJobText(
                        title: widget.jobType,
                        size: 14.0,
                        color: (widget.jobType == 'Full-time')
                            ? const Color(0xff03A504)
                            : (widget.jobType == 'Part-time')
                                ? const Color(0xff5A54FF)
                                : (widget.jobType == 'Freelancer')
                                    ? const Color(0xff26A9E1)
                                    : const Color(0xffD20001),
                        weight: FontWeight.w500,
                      ),

                      // ^ skills
                      const SizedBox(height: 20.0),
                      CustomJobText(
                        title: widget.jobSkills,
                        size: 14.0,
                        color: JobCustomColors.textColor3,
                        weight: FontWeight.w500,
                      ),
                      //  todo:
                      // ^ price and button
                      const SizedBox(height: 15.0),
                      Row(
                        children: [
                          CustomJobText(
                            title: '\$ ${widget.salaryMin}',
                            size: 16.0,
                            color: JobCustomColors.textColor,
                            weight: FontWeight.w600,
                          ),
                          CustomJobText(
                            title: ' - ${widget.salaryMax}',
                            size: 16.0,
                            color: JobCustomColors.textColor,
                            weight: FontWeight.w600,
                          ),
                          const CustomJobText(
                            title: '/month',
                            size: 14.0,
                            color: JobCustomColors.textColor,
                          ),
                          const Spacer(),
                          CustomButton(
                            color: JobCustomColors.green,
                            title: 'See More',
                            textColor: Colors.white,
                            onPressed: () {
                              navigateToPage(
                                context,
                                JobDescription(
                                  jobId: widget.jobId,
                                  jobTitle: widget.jobTitle,
                                  jobType: widget.jobType,
                                  companyName: widget.companyName,
                                  jobLocation: widget.jobLocation,
                                  salaryMin: widget.salaryMin,
                                  salaryMax: widget.salaryMax,
                                  shortDescription: widget.shortDescription,
                                  longDescription: widget.longDescription,
                                  jobRequirements: widget.jobRequirements,
                                  jobResponsibilities:
                                      widget.jobResponsibilities,
                                  jobQualification: widget.jobQualification,
                                  jobSkills: widget.jobSkills,
                                  jobCategory: widget.jobCategoryName,
                                  jobSubCategory: widget.jobSubCategoryName,
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
