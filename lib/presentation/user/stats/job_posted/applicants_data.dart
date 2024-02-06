import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/experience_model.dart';
import 'package:freelance_app/models/users_model.dart';
import 'package:freelance_app/presentation/user/drawer/user_drawer.dart';
import 'package:freelance_app/resources/widgets/footer.dart';
import 'package:freelance_app/resources/widgets/timeline/experience/exp_timeline_tile.dart';
import 'package:freelance_app/services/get_remote_services.dart';
import 'package:freelance_app/tests/testauth.dart';
import 'package:intl/intl.dart';

import '../../../../models/education_model.dart';
import '../../../../resources/widgets/appbar.dart';
import '../../../../resources/widgets/text_widget.dart';
import '../../../../resources/widgets/timeline/education/timeline_tile.dart';

class ApplicantData extends StatefulWidget {
  const ApplicantData({super.key, required this.userId});
  final String userId;
  @override
  State<ApplicantData> createState() => _ApplicantDataState();
}

class _ApplicantDataState extends State<ApplicantData> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Users>? users;
  List<Education>? education;
  List<Exp>? exp;
  String userEmail = FirebaseAuth.instance.currentUser!.email ?? '';
  Future<List<Users>?>? futureVariable;

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
  void initState() {
    setState(() {
      futureVariable = getInfo();
    });
    super.initState();
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
              future: futureVariable,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator.adaptive(),
                  );
                } else if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                        itemCount: users!.length,
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
                                                      '${users![index].firstName} ${users![0].lastName}',
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
                                  Container(
                                    decoration: const BoxDecoration(
                                        // color: Colors.green.shade100,
                                        ),
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
                                  Container(
                                    decoration: const BoxDecoration(
                                        // color: Colors.green.shade100,
                                        ),
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
                                              endDate: (exp![index].isCurrent ==
                                                      '1')
                                                  ? 'Currently Working'
                                                  : '${DateFormat('MMMM').format(education![index].startDate)} ${DateFormat('yyyy').format(education![index].startDate)}',
                                            );
                                          }),
                                    ),
                                  ),

                                  // skills
                                  const SizedBox(height: 20.0),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.0),
                                    child: CustomText(
                                      title: 'Skills',
                                      size: 16.0,
                                      color: Colors.black87,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  const InlineScrollableX(),
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
