import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../../../models/job_models/job_model.dart';
import '../../../../resources/widgets/appbar.dart';
import '../../../../services/job_services/get_job_info.dart';
import 'job_list.dart';

class JobPostedByUser extends StatefulWidget {
  const JobPostedByUser({super.key, required this.userId});
  final String userId;

  @override
  State<JobPostedByUser> createState() => _JobPostedByUserState();
}

class _JobPostedByUserState extends State<JobPostedByUser> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future getFutureMethodVariable;
  List<JobDetails>? jobList;

  Future<List<JobDetails>?> getFutureMethod(String id) async {
    jobList = await GetJobRemoteServices().getJobListByUser(
      id: id,
      orderBy: 'your_order_by_value',
    );
    return jobList;

    // Handle the result (jobList) as needed
    // if (jobList != null) {
    //   // Categories were successfully retrieved
    //   debugPrint('Categories: ${jobList[0].jobTitle}');
    // } else {
    //  // Handle the case when there was an error or no data was retrieved
    //   print('Failed to retrieve categories.');
    // }
  }

  @override
  void initState() {
    // await getFutureMethod();
    // print(jobList![0].companyName);
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
                    future: getFutureMethod('18'),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: jobList!.length,
                          itemBuilder: (context, index) {
                            return Center(
                              child: JobByUser(
                                jobId: jobList![index].jobId,
                                jobTitle: jobList![index].jobTitle,
                                jobType: jobList![index].jobType,
                                companyName: jobList![index].companyName,
                                jobLocation: jobList![index].location,
                                salaryMin: jobList![index].salaryMin,
                                salaryMax: jobList![index].salaryMax,
                                shortDescription:
                                    jobList![index].shortDescription,
                                longDescription:
                                    jobList![index].longDescription,
                                jobRequirements:
                                    jobList![index].jobRequirements,
                                jobResponsibilities:
                                    jobList![index].jobResponsibilities,
                                jobQualification:
                                    jobList![index].qualifications,
                                jobSkills: jobList![index].skills,
                                jobCategoryName: jobList![index].categoryName,
                                jobSubCategoryName:
                                    jobList![index].subcategoryName,
                              ),
                            );
                            // return Center(child: Text('data'));
                          },
                        );
                      }
                    },
                  ),
                  const Gap(20),

                  // CustomButton(
                  //   color: JobCustomColors.green,
                  //   title: 'View all applicants',
                  //   textColor: Colors.white,
                  //   onPressed: () {
                  //     navigateToPage(context, const JobApplicationList());
                  //   },
                  // )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
