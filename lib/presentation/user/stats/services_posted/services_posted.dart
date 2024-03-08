// TODO: Delete March 8
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';
import 'package:freelance_app/resources/widgets/loading_indicator.dart';
import 'package:freelance_app/resources/widgets/snackbar.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:gap/gap.dart';

import '../../../../job/description/backend/job_post_service.dart';
import '../../../../job/description/model/user_idmodel.dart';
import '../../../../models/service_posted.dart';
import '../../../../services/get_remote_services.dart';
import '../../../../services/job_services/delete_services.dart';
import 'service_request.dart';

class ServicePostedList extends StatefulWidget {
  const ServicePostedList({super.key});

  @override
  State<ServicePostedList> createState() => _ServicePostedListState();
}

class _ServicePostedListState extends State<ServicePostedList> {
  Future<dynamic>? futureVariable;
  List<ServicesPosted> getData = [];
  bool isLoading = false;

  Future<List<ServicesPosted>> getInfoofServices() async {
    List<UseridModel> responseId = [];
    responseId = await JobRemoteService()
        .getUserId(FirebaseAuth.instance.currentUser!.email);
    //
    getData = await GetRemoteService()
        .getServicesPostedFromUser(responseId[0].userId);

    return getData;
  }

  /* -------------------------------------------------------------------------- */
  /*                               call delete api                              */
  /* -------------------------------------------------------------------------- */
  final DeleteRemoteService deleteRemoteService = DeleteRemoteService();

  // Define a function to call the remote service
  Future<void> callRemoteService(context, id) async {
    try {
      await deleteRemoteService.deleteService(
        id,
      );
      customSnackBar(
          context, 'Record Delete Successfully', Colors.green, Colors.white);

      setState(() {
        futureVariable = getInfoofServices();
        isLoading = false;
      });
    } catch (error) {
      setState(() {
        isLoading = false;
      });
      customSnackBar(
          context, 'An Error Occured... Try again!', Colors.red, Colors.white);
    }
  }
  /* -------------------------------------------------------------------------- */
  /*                               call delete api                              */
  /* -------------------------------------------------------------------------- */

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
        appBar: AppBar(
          title: const Text('List of Services'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.grey.shade200,
          child: Stack(
            children: [
              Column(
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
                      } else if (snapshot.connectionState ==
                          ConnectionState.done) {
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
                                    // print(getData[index].projectId);
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
                                          const Gap(20.0),
                                          SizedBox(
                                            width: double.infinity,
                                            child: ElevatedButton(
                                              onPressed: () {
                                                setState(() {
                                                  isLoading = true;
                                                });
                                                callRemoteService(
                                                  context,
                                                  getData[index].projectId,
                                                );
                                              },
                                              style: ElevatedButton.styleFrom(
                                                elevation: 0,
                                                backgroundColor: Colors.red,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                              child: const CustomText(
                                                title: 'Delete',
                                                size: 14.0,
                                                color: Colors.white,
                                              ),
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
                          child:
                              Text('Oops some error occured! Try again later.'),
                        );
                      }
                    },
                  ),
                ],
              ),
              isLoading ? const LoadingIndicator() : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}

// TODO: Jan 29, 2024
