import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/experience_model.dart';
import 'package:freelance_app/models/users_model.dart';
import 'package:freelance_app/presentation/user/drawer/user_drawer.dart';
import 'package:freelance_app/presentation/user/stats/freelance_posted/freelance_posted.dart';
import 'package:freelance_app/presentation/user/stats/job_posted/job_posted_byuser.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';
import 'package:freelance_app/resources/widgets/footer.dart';
import 'package:freelance_app/resources/widgets/timeline/experience/exp_timeline_tile.dart';
import 'package:freelance_app/services/get_remote_services.dart';
import 'package:intl/intl.dart';

import '../../../models/education_model.dart';
import '../../../resources/widgets/appbar.dart';
import '../../../resources/widgets/text_widget.dart';
import '../../../resources/widgets/timeline/education/timeline_tile.dart';
import '../dashboard_x/views/profile_stats.dart';
import '../stats/services_posted/services_posted.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Users>? users;
  List<Education>? education;
  List<Exp>? exp;
  String userEmail = FirebaseAuth.instance.currentUser!.email ?? '';

  // & functions ---------------------------------------------------------

  // & get Profile Info
  Future<List<Users>?> getInfo() async {
    if (userEmail.isNotEmpty) {
      users = await GetRemoteService().getProfileInfo(userEmail);
      await getEducationDetails(userEmail);
      await getExpDetails(userEmail);
      return users;
    } else {
      return null;
    }
  }

  // & get education info
  Future<List<Education>?> getEducationDetails(email) async {
    education = await GetRemoteService().getEducationInfo(email);
    return education;
  }

  Future<List<Exp>?> getExpDetails(email) async {
    exp = await GetRemoteService().getExperienceInfo(email);
    return exp;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const UserDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            // ^App Bar
            TopAppBar(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ],
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: FutureBuilder(
              future: getInfo(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: 1,
                        // !fix shrinkwrap
                        // shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // ^ name, username and review
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Column(
                                      children: [
                                        const SizedBox(height: 20.0),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            // ^ image
                                            CircleAvatar(
                                              maxRadius: 50.0,
                                              backgroundColor: Colors.grey,
                                              child: ClipOval(
                                                child: SizedBox(
                                                  width:
                                                      140.0, // Set a fixed width and height
                                                  height: 140.0,
                                                  child: CachedNetworkImage(
                                                    imageUrl:
                                                        'https://shorturl.at/elV34',
                                                    placeholder: (context,
                                                            url) =>
                                                        const CircularProgressIndicator(),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                // ^ name
                                                CustomText(
                                                  title:
                                                      '${users![index].firstName} ${users![index].lastName}',
                                                  size: 16.0,
                                                  color: Colors.black,
                                                  weight: FontWeight.bold,
                                                ),

                                                // ^ username
                                                CustomText(
                                                  title: users![index].username,
                                                  size: 16.0,
                                                  color: Colors.black54,
                                                ),

                                                // ^ review
                                                // TODO: REVIEW NOT DYNAMIC

                                                // const Row(
                                                //   children: [
                                                //     CustomText(
                                                //       title: '★',
                                                //       size: 20.0,
                                                //       color: Color(0xffE1C03F),
                                                //     ),
                                                //     CustomText(
                                                //       title:
                                                //           ' 4.5  (56 Reviews)',
                                                //       size: 16.0,
                                                //       color: Colors.black87,
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                            const SizedBox(),
                                          ],
                                        ),
                                        const SizedBox(height: 20.0),
                                      ],
                                    ),
                                  ),

                                  const SizedBox(height: 20.0),

                                  // ^ about me
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.0),
                                    child: CustomText(
                                      title: 'About Me',
                                      size: 18.0,
                                      color: Colors.black87,
                                      weight: FontWeight.w600,
                                    ),
                                  ),

                                  // ^ bio
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 12.0),
                                    child: CustomText(
                                      title: users![index].userBio,
                                      size: 14.0,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),

                                  // ^ statistics
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.0),
                                    child: CustomText(
                                      title: 'Your stats so far...',
                                      size: 18.0,
                                      color: Colors.black87,
                                      weight: FontWeight.w600,
                                    ),
                                  ),

                                  const SizedBox(height: 20.0),

                                  // ^ stats
                                  Container(
                                    color: CustomColors.accentColor,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 20.0),
                                      child: Column(
                                        children: [
                                          // ^ first stat
                                          UserProfileStats(
                                            onTap1: () {
                                              navigateToPage(
                                                context,
                                                JobPostedByUser(
                                                  userId: users![index].userId,
                                                ),
                                              );
                                            },
                                            onTap2: () {
                                              navigateToPage(
                                                context,
                                                const FreelancePostedByUser(),
                                              );
                                            },
                                            image1: 'contract.svg',
                                            image2: 'checked.svg',
                                            title1: 'Job Posted',
                                            title2: 'Freelance',
                                            stat1: users![index].jobPostsCount,
                                            stat2:
                                                users![index].freelanceProjects,
                                          ),

                                          const SizedBox(height: 15.0),

                                          // ^ second stat
                                          UserProfileStats(
                                            onTap1: () {
                                              navigateToPage(
                                                context,
                                                const ServicePostedList(),
                                              );
                                            },
                                            onTap2: () {},
                                            image1: 'sand-clock.svg',
                                            image2: 'testimonial.svg',
                                            title1: 'Services',
                                            title2: 'Reviews',
                                            stat1:
                                                users![index].serviceProjects,
                                            stat2: '0',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 30.0),

                                  // ^education
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.0),
                                    child: CustomText(
                                      title: 'Education',
                                      size: 16.0,
                                      color: Colors.black87,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),

                                  // ^ Education view
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: CustomColors.accentColor2,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12.0, 28.0, 12.0, 16.0),
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: education!.length,
                                            itemBuilder: (context, index) {
                                              // ^ Education view

                                              return CustomTimelineTile(
                                                iconData: Icons.school,
                                                // isFirst: true,
                                                isFirst:
                                                    (index == 1) ? true : false,
                                                isLast: (index ==
                                                        (education!.length) - 1)
                                                    ? true
                                                    : false,
                                                isPast: true,
                                                instituteName: education![index]
                                                    .institutionName,
                                                degree: education![index]
                                                    .degreeObtained,
                                                year:
                                                    '${DateFormat('MMMM').format(education![index].startDate)} ${DateFormat('yyyy').format(education![index].startDate)} - ${DateFormat('yyyy').format(education![index].endDate)}',
                                                grade:
                                                    'Grade: ${education![index].gradeOrGpa}',
                                                studyField: education![index]
                                                    .fieldOfStudy,
                                              );
                                            }),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),

                                  // ^ exp
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.0),
                                    child: CustomText(
                                      title: 'Experience',
                                      size: 16.0,
                                      color: Colors.black87,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 10.0),

                                  // ^ experience view
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      color: CustomColors.accentColor2,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            12.0, 28.0, 12.0, 16.0),
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            itemCount: exp!.length,
                                            itemBuilder: (context, index) {
                                              // ^ Experience view

                                              return CustomTimelineTileExp(
                                                iconData: Icons.apartment,
                                                // isFirst: true,
                                                isFirst:
                                                    (index == 1) ? true : false,
                                                isLast:
                                                    (index == (exp!.length) - 1)
                                                        ? true
                                                        : false,
                                                isPast: true,
                                                companyName:
                                                    exp![index].companyName,
                                                jobTitle: exp![index].jobTitle,
                                                description:
                                                    exp![index].description,
                                                startDate:
                                                    '${DateFormat('MMMM').format(education![index].startDate)} ${DateFormat('yyyy').format(education![index].startDate)}',
                                                endDate: (exp![index]
                                                            .isCurrent ==
                                                        '1')
                                                    ? 'Currently Working'
                                                    : '${DateFormat('MMMM').format(education![index].startDate)} ${DateFormat('yyyy').format(education![index].startDate)}',
                                              );
                                            }),
                                      ),
                                    ),
                                  ),

                                  // skills
                                  const SizedBox(height: 20.0),
                                  // const CustomText(
                                  //   title: 'Skills',
                                  //   size: 16.0,
                                  //   color: Colors.black87,
                                  //   weight: FontWeight.w600,
                                  // ),
                                  const SizedBox(height: 10.0),
                                  // Skills listview

                                  //
                                  const AppFooter(),
                                ],
                              ),
                            ],
                          );
                        });
                  }
                }

                // !if all condition fails then returning this
                return const SizedBox();
              },
            ),
          ),
        ),
      ),
    );
  }
}
