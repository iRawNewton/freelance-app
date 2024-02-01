// list of services
import 'package:flutter/material.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';

import '../../../../models/service_posted.dart';
import '../../../../services/get_remote_services.dart';
import 'service_request.dart';

class ServicePostedList extends StatefulWidget {
  const ServicePostedList({super.key});

  @override
  State<ServicePostedList> createState() => _ServicePostedListState();
}

class _ServicePostedListState extends State<ServicePostedList> {
  Future<dynamic>? futureVariable;
  List<ServicesPosted> getData = [];

  Future<List<ServicesPosted>> getInfoofServices() async {
    getData = await GetRemoteService().getServicesPostedFromUser('18');

    // print(getData[0].firstName);

    return getData;
  }

  // Future<HomeModel?> getHomeInfo() async {
  //   homeData = (await GetRemoteService().getHomeDetails())!;

  //   setState(() {
  //     category = homeData.category;
  //     projects = homeData.projects;
  //     serviceCategory = homeData.serviceCategory;
  //   });
  //   return homeData;
  // }

  @override
  void initState() {
    setState(() {
      futureVariable = getInfoofServices();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey.shade200,
          child: Column(
            children: [
              FutureBuilder(
                future: futureVariable,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: Text(
                        'Loading Data',
                      ),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: getData.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 12.0),
                            child: InkWell(
                              onTap: () {
                                navigateToPage(
                                    context,
                                    ServiceApplicants(
                                      serviceId: getData[index].projectId,
                                    ));
                              },
                              child: Card(
                                elevation: 0,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 12.0, horizontal: 8.0),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: CustomText(
                                          title:
                                              '${index + 1}. Service Title: ${getData[index].projectTitle}',
                                          size: 18.0,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          CustomText(
                                            title:
                                                '-${getData[index].firstName}',
                                            size: 14.0,
                                            color: Colors.black54,
                                          ),
                                          CustomText(
                                            title:
                                                ' ${getData[index].lastName}',
                                            size: 14.0,
                                            color: Colors.black54,
                                          ),
                                        ],
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: CustomText(
                                          title:
                                              'Services: ${getData[index].servicesProvided}',
                                          size: 14.0,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: CustomText(
                                          title:
                                              'Tools And Technologies: ${getData[index].toolsAndTechnologies}',
                                          size: 14.0,
                                          color: Colors.black87,
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: CustomText(
                                          title:
                                              'Description: ${getData[index].projectDescription}',
                                          size: 14.0,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: Text('No Data found'),
                      );
                    }
                  } else {
                    return const Center(
                      child: Text('Oops some error occured! Try again later.'),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// TODO: Jan 29, 2024