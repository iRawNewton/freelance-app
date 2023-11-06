import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:freelance_app/presentation/job/description/views/job_details_card.dart';
import 'package:freelance_app/presentation/job/drawyer/job_drawer.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/widgets/buttons.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:lottie/lottie.dart';

import '../../../models/job_models/job_model.dart';
import '../../../resources/widgets/appbar.dart';
import '../../../services/job_services/get_job_info.dart';

class JobDescription extends StatefulWidget {
  const JobDescription({super.key});

  @override
  State<JobDescription> createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  String req1 =
      'Candidate must have a Bachelors or Masters degree in Computer. (B.tech, Bsc or BCA/MCA)';
  String req2 =
      'Candidate must have a good working knowledge of Javascript and Jquery.';
  String req3 = 'Good knowledge of HTML and CSS is required.';
  String req4 = 'Experience in Word press is an advantage.';

  // & calling get method
  late Future getFutureMethodVariable;
  List<JobDetails>? categoriesInfo;

  Future<List<JobDetails>?> getFutureMethod() async {
    categoriesInfo = await GetJobRemoteServices().getCategoriesInfo(
      id: 'your_id_value',
      categoryName: 'your_category_name_value',
      categoryImage: 'your_category_image_value',
      serviceId: 'your_service_id_value',
      orderBy: 'your_order_by_value',
    );
    print(categoriesInfo![0].companyName);
    return categoriesInfo;

    // Handle the result (categoriesInfo) as needed
    // if (categoriesInfo != null) {
    //   // Categories were successfully retrieved
    //   debugPrint('Categories: ${categoriesInfo[0].jobTitle}');
    // } else {
    //  // Handle the case when there was an error or no data was retrieved
    //   print('Failed to retrieve categories.');
    // }
  }

  // !
  @override
  void initState() {
    setState(() {
      getFutureMethodVariable = getFutureMethod();
    });
    super.initState();
  }

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
            child: FutureBuilder(
              future: getFutureMethodVariable,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  return ListView.builder(
                    itemCount: categoriesInfo!.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          // ^ job title
                          Container(
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
                                      title: categoriesInfo![index].jobType,
                                      textColor: Colors.white,
                                      titleSize: 12.0,
                                      onPressed: () {},
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),
                                  CustomJobText(
                                    title: categoriesInfo![index].jobTitle,
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
                                        title: categoriesInfo![index].location,
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
                                    title:
                                        categoriesInfo![index].shortDescription,
                                    size: 14.0,
                                    color: const Color(0xffd7dde2),
                                  ),
                                  // ^ apply button
                                  const SizedBox(height: 20.0),
                                  CustomButton(
                                    color: JobCustomColors.green,
                                    title: 'Apply',
                                    textColor: Colors.white,
                                    titleSize: 16.0,
                                    weight: FontWeight.w500,
                                    onPressed: () {},
                                  ),
                                  // ^ department and company
                                  const SizedBox(height: 30.0),

                                  // ^ department
                                  Row(
                                    children: [
                                      const Row(
                                        children: [
                                          Icon(
                                            Icons.work_history,
                                            color: Colors.white,
                                            size: 30.0,
                                          ),
                                          SizedBox(width: 5.0),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomJobText(
                                                title: 'Category',
                                                size: 14.0,
                                                color: Color(0xffF8F9FA),
                                              ),
                                              CustomJobText(
                                                title: 'Software',
                                                size: 16.0,
                                                color: Color(0xffF8F9FA),
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
                                                title: categoriesInfo![index]
                                                    .companyName,
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const CustomJobText(
                                            title: 'Salary',
                                            size: 14.0,
                                            color: Color(0xffF8F9FA),
                                          ),
                                          CustomJobText(
                                            title:
                                                '${categoriesInfo![index].salaryMin} -${categoriesInfo![index].salaryMax}',
                                            size: 16.0,
                                            color: const Color(0xffF8F9FA),
                                            weight: FontWeight.w700,
                                          ),
                                          const SizedBox(height: 20.0),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // ^ ==============================
                          // * job details starts
                          // ^ ==============================

                          const SizedBox(height: 20.0),
                          JobDetailsCard(
                            description: categoriesInfo![index].longDescription,
                            requirements:
                                categoriesInfo![index].jobRequirements,
                            responsiblity:
                                categoriesInfo![index].jobResponsibilities,
                            qualificatonSkill:
                                categoriesInfo![index].qualifications,
                          ),
                        ],
                      );
                    },
                  );
                } else {
                  return Center(
                    child: LottieBuilder.asset(
                      'lib/resources/assets/animations/somethingwentwrong.json',
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
