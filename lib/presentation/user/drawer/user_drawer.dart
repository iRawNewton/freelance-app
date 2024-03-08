import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/auth/screens/login.dart';
import 'package:freelance_app/presentation/global/home/home.dart';
import 'package:freelance_app/presentation/post_product/guideline.dart';
import 'package:freelance_app/presentation/user/edit_profile/personal_info.dart';
import 'package:freelance_app/presentation/user/profile_info/profile_info.dart';
import 'package:freelance_app/resources/widgets/drawer_list.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:freelance_app/resources/constants/colors.dart';

import '../../../job/description/backend/job_post_service.dart';
import '../../../job/description/model/user_idmodel.dart';
import '../../../resources/functions/navigate_page.dart';
import '../../../job/upload/job_upload.dart';
import '../../post_service/post_service.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({super.key});

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  double _turns = 0.0;
  double _turnsU = 0.0; // for upload product
  String userId = '';

  getUserId() async {
    //get user id
    List<UseridModel> responseId = [];
    responseId = await JobRemoteService()
        .getUserId(FirebaseAuth.instance.currentUser!.email);
    setState(() {
      userId = responseId[0].userId;
    });
  }

  @override
  void initState() {
    getUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: CustomColors.accentColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20.0),

                // ^Profile info if login
                FirebaseAuth.instance.currentUser != null
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // ^Profile Picture

                          CircleAvatar(
                            maxRadius: 40.0,
                            backgroundColor: Colors.grey,
                            child: ClipOval(
                              child: SizedBox(
                                width: 140.0, // Set a fixed width and height
                                height: 140.0,
                                child: CachedNetworkImage(
                                  imageUrl: 'https://shorturl.at/elV34',
                                  placeholder: (context, url) =>
                                      const CircularProgressIndicator(),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          //
                          const SizedBox(height: 10.0),

                          // ^Name & Email

                          Theme(
                            data: Theme.of(context).copyWith(
                              dividerColor: Colors.transparent,
                            ),
                            child: ExpansionTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  //^ name

                                  CustomText(
                                    title: FirebaseAuth.instance.currentUser
                                            ?.displayName ??
                                        '',
                                    size: 18.0,
                                    color: CustomColors.primaryTextColor,
                                    weight: FontWeight.bold,
                                  ),

                                  //^ email

                                  CustomText(
                                    title: FirebaseAuth
                                            .instance.currentUser?.email ??
                                        '',
                                    size: 14.0,
                                    color: CustomColors.secondaryTextColor,
                                  ),
                                ],
                              ),

                              // ^trailing animation

                              trailing: AnimatedRotation(
                                turns: _turns,
                                duration: const Duration(milliseconds: 100),
                                child: const Icon(
                                  Icons.arrow_right,
                                  color: Colors.black87,
                                ),
                              ),
                              children: const [],
                              onExpansionChanged: (value) {
                                setState(() {
                                  if (_turns == 0.0) {
                                    _turns = 0.25;
                                  } else {
                                    _turns = 0.0;
                                  }
                                });
                              },
                            ),
                          ),

                          // ^divider
                          const Divider(),
                        ],
                      )
                    : const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: 'Freelance.io',
                            size: 24.0,
                            color: Colors.black87,
                          ),

                          // ^divider
                          Divider(),
                        ],
                      ),

                // ^HOME
                DrawerList(
                  icon: Icons.home,
                  title: 'Home',
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                      (Route<dynamic> route) => false,
                    );
                  },
                ),

                // ^Profile
                DrawerList(
                  icon: Icons.person,
                  title: 'Profile',
                  onTap: () {
                    FirebaseAuth.instance.currentUser != null
                        ? navigateToPage(context, const UserProfile())
                        : navigateToPage(context, const LoginPage());
                  },
                ),

                // ^ Edit Profile
                FirebaseAuth.instance.currentUser != null
                    ? DrawerList(
                        icon: Icons.edit,
                        title: 'Edit Profile',
                        onTap: () {
                          navigateToPage(context, const PersonalInfo());
                        },
                      )
                    : const SizedBox(),

                // ^ Upload product
                // DrawerList(
                //   onTap: () {
                //     navigateToPage(context, const UploadGuideline());
                //   },
                //   icon: Icons.upload_file,
                //   title: 'Upload Product',
                // ),
                // ! fix
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    title: const CustomText(
                      title: 'Seller',
                      size: 14.0,
                      color: Colors.black87,
                    ),
                    leading: const Icon(Icons.upload_file),
                    trailing: AnimatedRotation(
                      turns: _turnsU,
                      duration: const Duration(milliseconds: 100),
                      child: const Icon(
                        Icons.chevron_right,
                        color: Colors.black87,
                      ),
                    ),
                    onExpansionChanged: (value) {
                      setState(() {
                        if (_turnsU == 0.0) {
                          _turnsU = 0.25;
                        } else {
                          _turnsU = 0.0;
                        }
                      });
                    },
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: DrawerList(
                          onTap: () {
                            navigateToPage(context, const UploadGuideline());
                          },
                          icon: Icons.person_outline,
                          title: 'Freelance',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: DrawerList(
                          onTap: () {
                            if (userId.isNotEmpty && userId != '') {
                              navigateToPage(
                                  context, ServicePost(userId: userId));
                            }
                          },
                          icon: Icons.cleaning_services_outlined,
                          title: 'Service',
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0),
                        child: DrawerList(
                          onTap: () {
                            if (userId.isNotEmpty && userId != '') {
                              navigateToPage(context, JobPost(userId: userId));
                            }
                          },
                          icon: Icons.work_outline,
                          title: 'Job',
                        ),
                      ),
                    ],
                  ),
                ),

                // ^Wishlist
                // const DrawerList(
                //   icon: Icons.favorite_outline,
                //   title: 'Wishlist',
                // ),

                // ^Logout
                FirebaseAuth.instance.currentUser != null
                    ? DrawerList(
                        icon: Icons.logout,
                        title: 'Logout',
                        onTap: () {
                          FirebaseAuth.instance.signOut().then((value) {
                            navigateToPage(context, const HomePage());
                          });
                        },
                      )
                    : DrawerList(
                        icon: Icons.logout,
                        title: 'Login',
                        onTap: () {
                          navigateToPage(context, const LoginPage());
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
