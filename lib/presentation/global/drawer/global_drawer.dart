import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/auth/screens/login.dart';
import 'package:freelance_app/presentation/global/home/home.dart';
import 'package:freelance_app/presentation/post_product/guideline.dart';
import 'package:freelance_app/presentation/post_product/post_product.dart';
import 'package:freelance_app/presentation/user/edit_profile/personal_info.dart';
import 'package:freelance_app/presentation/user/profile_info/profile_info.dart';
import 'package:freelance_app/res/widgets/drawer_list.dart';
import 'package:freelance_app/res/widgets/text_widget.dart';
import 'package:freelance_app/res/constants/colors.dart';

import '../../../res/functions/navigate_page.dart';

class GlobalDrawer extends StatefulWidget {
  const GlobalDrawer({super.key});

  @override
  State<GlobalDrawer> createState() => _GlobalDrawerState();
}

class _GlobalDrawerState extends State<GlobalDrawer> {
  double _turns = 0.0;
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
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

                // ^ Upload product
                DrawerList(
                  onTap: () {
                    navigateToPage(context, const UploadGuideline());
                  },
                  icon: Icons.upload_file,
                  title: 'Upload Product',
                ),

                // ^Wishlist
                const DrawerList(
                  icon: Icons.favorite_outline,
                  title: 'Wishlist',
                ),

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
