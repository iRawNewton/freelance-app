import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/user/stats/job_posted/applicants_data.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';
import 'package:freelance_app/resources/widgets/appbar.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:gap/gap.dart';

import '../../../../models/applicant_model_free.dart';
import '../../../../services/job_services/get_job_info.dart';

class ServiceApplicants extends StatefulWidget {
  const ServiceApplicants({super.key, required this.serviceId});
  final String serviceId;

  @override
  State<ServiceApplicants> createState() => _ServiceApplicantsState();
}

class _ServiceApplicantsState extends State<ServiceApplicants> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<ApplicantFreelancer>? applicantData;

  late Future getFutureMethodVariable;

  // ^ get applicant data
  Future<List<ApplicantFreelancer>?> getIdofUser(String id) async {
    applicantData = await GetJobRemoteServices().getServicesApplicantData(
      serviceId: id,
    );
    // print(applicantData![0].applicantUserId);
    return applicantData;
  }

  @override
  void initState() {
    setState(() {
      getFutureMethodVariable = getIdofUser(widget.serviceId);
    });

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
          body: Container(
            height: double.infinity,
            decoration: const BoxDecoration(),
            child: Column(
              children: [
                const Gap(10),
                const CustomText(
                  title: 'List of all applicants',
                  size: 24.0,
                  color: Colors.black,
                  weight: FontWeight.bold,
                ),

                // users list
                FutureBuilder(
                  future: getFutureMethodVariable,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.connectionState ==
                        ConnectionState.done) {
                      if (snapshot.hasData) {
                        if (applicantData!.isNotEmpty) {
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: applicantData!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  leading: const Icon(Icons.person),
                                  title: CustomText(
                                    title:
                                        '${applicantData![index].firstName} ${applicantData![index].lastName}',
                                    size: 16.0,
                                    color: Colors.black,
                                  ),
                                  trailing: IconButton(
                                    onPressed: () {
                                      navigateToPage(
                                        context,
                                        ApplicantData(
                                          userId: applicantData![index].userId,
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.arrow_right,
                                    ),
                                  ),
                                );
                              });
                        } else {
                          return const Center(
                            child: CustomText(
                                title: 'No products found',
                                size: 14.0,
                                color: Colors.black87),
                          );
                        }
                      } else {
                        return const Center(
                          child: CustomText(
                              title: 'No products found',
                              size: 14.0,
                              color: Colors.black87),
                        );
                      }
                    } else {
                      return const Center(
                        child: CustomText(
                          title: 'Something went wrong. Please try again.',
                          size: 14.0,
                          color: Colors.black87,
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
