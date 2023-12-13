import 'package:flutter/material.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:lottie/lottie.dart';

import '../../models/job_models/job_model.dart';
import '../../resources/widgets/appbar.dart';
import '../../services/job_services/get_job_info.dart';
import '../home/views/job_carousel.dart';

class JobList extends StatefulWidget {
  const JobList({super.key, required this.jobCategory});
  final String jobCategory;

  @override
  State<JobList> createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future getFutureMethodVariable;
  List<JobDetails>? jobInfoList;

  Future<List<JobDetails>?> getFutureMethod(String id) async {
    jobInfoList = await GetJobRemoteServices().getCategoriesList(
      id: id,
      categoryName: 'your_category_name_value',
      categoryImage: 'your_category_image_value',
      serviceId: 'your_service_id_value',
      orderBy: 'your_order_by_value',
    );

//  jobInfoList == null ? :;
    return jobInfoList;

    // Handle the result (jobInfoList) as needed
    // if (jobInfoList != null) {
    //   // Categories were successfully retrieved
    //   debugPrint('Categories: ${jobInfoList[0].jobTitle}');
    // } else {
    //  // Handle the case when there was an error or no data was retrieved
    //   print('Failed to retrieve categories.');
    // }
  }

  @override
  void initState() {
    setState(() {
      getFutureMethodVariable = getFutureMethod(widget.jobCategory);
    });
    // print(jobInfoList![0].companyName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            JobAppBar(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ],
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FutureBuilder(
                    future: getFutureMethodVariable,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: jobInfoList!.length,
                            itemBuilder: (context, index) {
                              if (jobInfoList!.isNotEmpty) {
                                return Center(
                                  child: JobCarousel(
                                    jobId: jobInfoList![index].jobId,
                                    jobTitle: jobInfoList![index].jobTitle,
                                    jobType: jobInfoList![index].jobType,
                                    companyName:
                                        jobInfoList![index].companyName,
                                    jobLocation: jobInfoList![index].location,
                                    salaryMin: jobInfoList![index].salaryMin,
                                    salaryMax: jobInfoList![index].salaryMax,
                                    shortDescription:
                                        jobInfoList![index].shortDescription,
                                    longDescription:
                                        jobInfoList![index].longDescription,
                                    jobRequirements:
                                        jobInfoList![index].jobRequirements,
                                    jobResponsibilities:
                                        jobInfoList![index].jobResponsibilities,
                                    jobQualification:
                                        jobInfoList![index].qualifications,
                                    jobSkills: jobInfoList![index].skills,
                                    jobCategoryName:
                                        jobInfoList![index].categoryName,
                                    jobSubCategoryName:
                                        jobInfoList![index].subcategoryName,
                                  ),
                                );
                              } else {
                                return LottieBuilder.network(
                                    'https://lottie.host/8f17be7d-21de-49de-97dd-8f75340f33b8/9RqToI1j27.json');
                              }
                            },
                          );
                        } else {
                          return Column(
                            children: [
                              LottieBuilder.network(
                                  'https://lottie.host/8f17be7d-21de-49de-97dd-8f75340f33b8/9RqToI1j27.json'),
                              const CustomText(
                                  title: 'Oops! No record found',
                                  size: 14.0,
                                  color: Colors.black87),
                            ],
                          );
                        }
                      } else {
                        return const Center(
                          child: CustomText(
                              title: 'Something went wrong. Please try again',
                              size: 14.0,
                              color: Colors.black87),
                        );
                      }
                    },
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
