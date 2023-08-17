import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelance_app/dev/screens/user/dashboard/views/profile_stats.dart';
import 'package:freelance_app/dev/ui_global/text_widget.dart';
import 'package:freelance_app/res/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/constants/dimens.dart';
import '../../../../res/constants/strings.dart';
import '../../../ui_global/appbar.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const TopAppBar(),
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    title: 'Good Morning, John',
                    size: 20.0,
                    color: CustomColors.primaryTextColor,
                    weight: FontWeight.bold,
                  ),
                  const UserProfileStats(),
                  const UserProfileStats(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
