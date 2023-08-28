import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/user/dashboard/views/profile_stats.dart';
import 'package:freelance_app/presentation/user/dashboard/views/select_service.dart';
import 'package:freelance_app/presentation/user/drawer/user_drawer.dart';
import 'package:freelance_app/res/ui_global/text_widget.dart';
import 'package:freelance_app/res/constants/colors.dart';
import '../../../../res/ui_global/appbar.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: const UserDrawer(),
        key: _scaffoldKey,
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            TopAppBar(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ],
          body: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.grey.shade100,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12.0,
                vertical: 16.0,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomText(
                      title: 'Welcome,\nJohn Doe',
                      size: 20.0,
                      color: CustomColors.primaryTextColor,
                      // weight: FontWeight.bold,
                    ),
                    const SizedBox(height: 24.0),
                    const UserProfileStats(
                      image1: 'contract.svg',
                      image2: 'checked.svg',
                      title1: 'Posted Projects',
                      title2: 'Completed Projects',
                      stat1: '5',
                      stat2: '0',
                    ),
                    const SizedBox(height: 14.0),
                    const UserProfileStats(
                      image1: 'sand-clock.svg',
                      image2: 'testimonial.svg',
                      title1: 'Proposals',
                      title2: 'Reviews',
                      stat1: '1',
                      stat2: '0',
                    ),
                    const SizedBox(height: 14.0),
                    // const SearchBar(),
                    // post services
                    SizedBox(
                      height: 40.0,
                      width: MediaQuery.sizeOf(context).width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: CustomColors.buttonColor,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const SelectService();
                              });
                        },
                        child: const CustomText(
                          title: 'Post a service',
                          size: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    // view full profile
                    SizedBox(
                      height: 40.0,
                      width: MediaQuery.sizeOf(context).width,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          backgroundColor: CustomColors.buttonColor,
                        ),
                        onPressed: () {},
                        child: const CustomText(
                          title: 'View Full Profile',
                          size: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
