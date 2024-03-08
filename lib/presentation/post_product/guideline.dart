import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/post_product/post_product.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';

import '../../job/description/backend/job_post_service.dart';
import '../../job/description/model/user_idmodel.dart';

class UploadGuideline extends StatefulWidget {
  const UploadGuideline({super.key});

  @override
  State<UploadGuideline> createState() => _UploadGuidelineState();
}

class _UploadGuidelineState extends State<UploadGuideline> {
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
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              const CustomText(
                title: 'Uploading is simple with Freelance.io',
                size: 18.0,
                color: Colors.black,
              ),
              ElevatedButton(
                onPressed: () {
                  navigateToPage(context, FreelancePost(userId: userId));
                },
                child: const CustomText(
                  title: 'Upload Product',
                  size: 14.0,
                  color: Colors.green,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
