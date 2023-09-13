import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/post_product/post_product.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';

class UploadGuideline extends StatefulWidget {
  const UploadGuideline({super.key});

  @override
  State<UploadGuideline> createState() => _UploadGuidelineState();
}

class _UploadGuidelineState extends State<UploadGuideline> {
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
                  // TODO: make the user id dynamic
                  navigateToPage(context, const FreelancePost(userId: '18'));
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
