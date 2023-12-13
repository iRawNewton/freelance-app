import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/user/stats/job_posted/applicants_data.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';
import 'package:freelance_app/resources/widgets/appbar.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:gap/gap.dart';

class JobApplicationList extends StatefulWidget {
  const JobApplicationList({super.key});

  @override
  State<JobApplicationList> createState() => _JobApplicationListState();
}

class _JobApplicationListState extends State<JobApplicationList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
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
                  ListTile(
                    leading: const CircleAvatar(),
                    title: const CustomText(
                      title: 'Gaurab Roy',
                      size: 16.0,
                      color: Colors.black,
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        navigateToPage(context, const ApplicantData());
                      },
                      icon: const Icon(
                        Icons.arrow_right,
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}

/*
headerSliverBuilder: (context, innerBoxIsScrolled) => [
            JobAppBar(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ], 
*/ 