import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/users.dart';
import 'package:freelance_app/presentation/global/drawer/global_drawer.dart';
import 'package:freelance_app/res/constants/colors.dart';
import 'package:freelance_app/services/get_remote_services.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';
import '../../../models/education.dart';
import '../../../res/widgets/appbar.dart';
import '../../../res/widgets/text_widget.dart';
import '../dashboard/views/profile_stats.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Users>? users;
  List<Education>? education;
  String userEmail = FirebaseAuth.instance.currentUser!.email ?? '';

  // & functions ---------------------------------------------------------

  // & get Profile Info
  Future<List<Users>?> getInfo() async {
    if (userEmail.isNotEmpty) {
      users = await GetRemoteService().getProfileInfo(userEmail);
      await getEducationInfo(userEmail);

      return users;
    } else {
      return null;
    }
  }

  // & get education info
  Future<List<Education>?> getEducationInfo(email) async {
    education = await GetRemoteService().getEducationInfo(email);
    return education;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const GlobalDrawer(),
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

                                                // ^ review
                                                // TODO: REVIEW NOT DYNAMIC

                                                const Row(
                                                  children: [
                                                    CustomText(
                                                      title: '★',
                                                      size: 20.0,
                                                      color: Color(0xffE1C03F),
                                                    ),
                                                    CustomText(
                                                      title:
                                                          ' 4.5  (56 Reviews)',
                                                      size: 16.0,
                                                      color: Colors.black87,
                                                    ),
                                                  ],
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

                                  Container(
                                    color: CustomColors.accentColor,
                                    child: const Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 5.0, vertical: 20.0),
                                      child: Column(
                                        children: [
                                          // ^ first stat
                                          UserProfileStats(
                                            image1: 'contract.svg',
                                            image2: 'checked.svg',
                                            title1: 'Posted Projects',
                                            title2: 'Completed Projects',
                                            stat1: '5',
                                            stat2: '0',
                                          ),

                                          SizedBox(height: 15.0),

                                          // ^ second stat
                                          UserProfileStats(
                                            image1: 'sand-clock.svg',
                                            image2: 'testimonial.svg',
                                            title1: 'Proposals',
                                            title2: 'Reviews',
                                            stat1: '1',
                                            stat2: '0',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  const SizedBox(height: 30.0),

                                  // ^ posts
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 12.0),
                                    child: CustomText(
                                      title: 'Posts',
                                      size: 16.0,
                                      color: Colors.black87,
                                      weight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),

                                  // ^ posts data
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Card(
                                          color: Colors.amber.shade50,
                                          child: const SizedBox(
                                            height: 150,
                                            width: 300,
                                          ),
                                        ),
                                        Card(
                                          color: Colors.red.shade50,
                                          child: const SizedBox(
                                            height: 150,
                                            width: 300,
                                          ),
                                        ),
                                        Card(
                                          color: Colors.green.shade50,
                                          child: const SizedBox(
                                            height: 150,
                                            width: 300,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),

                                  // ^education
                                  const CustomText(
                                    title: 'Education',
                                    size: 16.0,
                                    color: Colors.black87,
                                    weight: FontWeight.w600,
                                  ),
                                  const SizedBox(height: 10.0),

                                  // ! this has to be done

                                  // ListView.builder(
                                  //     itemCount: 2,
                                  //     itemBuilder: (context, index) {}),
                                  // ListView.builder(
                                  //     itemCount: education!.length,
                                  //     itemBuilder: (context, index) {
                                  //       return Card(
                                  //         color: Colors.amber.shade50,
                                  //         child: Column(
                                  //           children: [
                                  //             CustomText(
                                  //               title: education![index]
                                  //                   .institutionName,
                                  //               size: 14.0,
                                  //               color: Colors.black87,
                                  //             ),
                                  //             CustomText(
                                  //               title: education![index]
                                  //                   .degreeObtained,
                                  //               size: 14.0,
                                  //               color: Colors.black87,
                                  //             ),
                                  //             CustomText(
                                  //               title:
                                  //                   '${DateFormat('MMMM').format(education![index].startDate)} ${DateFormat('yyyy').format(education![index].startDate)} - ${DateFormat('yyyy').format(education![index].endDate)}',
                                  //               size: 14.0,
                                  //               color: Colors.black87,
                                  //             ),
                                  //           ],
                                  //         ),
                                  //       );
                                  //     }),

                                  // education listview

                                  // Experience
                                  // const SizedBox(height: 20.0),
                                  // const CustomText(
                                  //   title: 'Experience',
                                  //   size: 16.0,
                                  //   color: Colors.black87,
                                  //   weight: FontWeight.w600,
                                  // ),
                                  // const SizedBox(height: 10.0),
                                  // experience listview

                                  // skills
                                  const SizedBox(height: 20.0),
                                  const CustomText(
                                    title: 'Skills',
                                    size: 16.0,
                                    color: Colors.black87,
                                    weight: FontWeight.w600,
                                  ),
                                  const SizedBox(height: 10.0),
                                  // Skills listview

                                  //
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
