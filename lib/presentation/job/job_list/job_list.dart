import 'package:flutter/material.dart';

import '../../../models/job_models/job_model.dart';
import '../../../resources/widgets/appbar.dart';
import '../../../services/job_services/get_job_info.dart';
import '../home/views/job_carousel.dart';

class JobList extends StatefulWidget {
  const JobList({super.key});

  @override
  State<JobList> createState() => _JobListState();
}

class _JobListState extends State<JobList> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  late Future getFutureMethodVariable;
  List<JobDetails>? categoriesInfo;

  Future<List<JobDetails>?> getFutureMethod() async {
    categoriesInfo = await GetJobRemoteServices().getCategoriesList(
      id: 'your_id_value',
      categoryName: 'your_category_name_value',
      categoryImage: 'your_category_image_value',
      serviceId: 'your_service_id_value',
      orderBy: 'your_order_by_value',
    );
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

  @override
  void initState() {
    // await getFutureMethod();
    // print(categoriesInfo![0].companyName);
    super.initState();
  }

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
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: getFutureMethod(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: categoriesInfo!.length,
                        itemBuilder: (context, index) {
                          return const Center(
                            child: JobCarousel(
                              jobType: 'Remote',
                              color: Color(0xff0054FF),
                            ),
                          );
                          // return Center(child: Text('data'));
                        },
                      );
                    }
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


// const JobCarousel(
//             jobType: 'Remote',
//             color: Color(0xff0054FF),
//           ),