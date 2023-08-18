import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/dev/screens/user/profile_info/personal_info.dart';
import 'package:freelance_app/dev/ui_global/drawer_list.dart';
import 'package:freelance_app/dev/ui_global/text_widget.dart';
import 'package:freelance_app/res/constants/colors.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({super.key});

  @override
  State<UserDrawer> createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
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
                const SizedBox(height: 10.0),
                Theme(
                  data: Theme.of(context).copyWith(
                    dividerColor: Colors.transparent,
                  ),
                  child: ExpansionTile(
                    title: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          title: 'John Doe',
                          size: 18.0,
                          color: CustomColors.primaryTextColor,
                          weight: FontWeight.bold,
                        ),
                        CustomText(
                          title: 'johndoe@gmail.com',
                          size: 14.0,
                          color: CustomColors.secondaryTextColor,
                        ),
                      ],
                    ),
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
                const Divider(),
                const DrawerList(
                  icon: Icons.home,
                  title: 'Home',
                ),
                const DrawerList(
                  icon: Icons.dashboard,
                  title: 'Dashboard',
                ),
                DrawerList(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PersonalInfo(),
                      ),
                    );
                  },
                  icon: Icons.edit,
                  title: 'Edit Profile',
                ),
                const DrawerList(
                  icon: Icons.favorite_outline,
                  title: 'Wishlist',
                ),
                const DrawerList(
                  icon: Icons.logout,
                  title: 'Logout',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
