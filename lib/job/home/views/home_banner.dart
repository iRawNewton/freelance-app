import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/search/job/frontend/service_list.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:freelance_app/resources/widgets/textfields.dart';

import '../../../models/service_category.dart';
import '../../../services/get_remote_services.dart';

class JobBannerView extends StatefulWidget {
  const JobBannerView({super.key});

  @override
  State<JobBannerView> createState() => _JobBannerViewState();
}

class _JobBannerViewState extends State<JobBannerView> {
  // String _selectedItem = 'Option 1'; // Default selected item
  final TextEditingController _searchKeyword = TextEditingController();

  List<ServiceCategory>? serviceCategory = [];

  // get category
  // get category
  getCategory() async {
    List<ServiceCategory>? response =
        await GetRemoteService().getCategoriesInfo('', '', '', '', '');

    setState(() {
      serviceCategory = response;
    });
  }

  @override
  void initState() {
    getCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.49,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('lib/resources/assets/icons/job_banner02.webp'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            const SizedBox(height: 40.0),
            const CustomJobText(
              title: 'Find a perfect candidate with',
              size: 26.0,
              color: Color(0xffFEFEFE),
              textAlign: TextAlign.center,
              weight: FontWeight.bold,
            ),
            const CustomJobText(
              title: 'CFC',
              size: 26.0,
              color: Color(0xff03A84E),
              textAlign: TextAlign.center,
              weight: FontWeight.bold,
            ),
            const SizedBox(height: 20.0),
            const CustomJobText(
              title:
                  'Find great job for build your bright career. Have many job in this platform.',
              size: 14.0,
              color: Color(0xffFEFEFE),
              textAlign: TextAlign.center,
              weight: FontWeight.w500,
            ),
            const Spacer(),
            MyCustomJobTextField(
              controller: _searchKeyword,
              inputType: TextInputType.name,
              icon: Icons.work_outline,
              iconColor: Colors.black54,
              fontsize: 14.0,
              fontstyle: 'roboto',
              // labeltext: 'Job title or keywords',
              hinttext: 'Job title or keywords',
            ),
            const SizedBox(height: 10.0),
            SizedBox(
              height: 60.0,
              width: MediaQuery.sizeOf(context).width * 0.95,
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll(Color(0xff03A84E)),
                  shape: MaterialStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                onPressed: () {
                  navigateToPage(
                    context,
                    JobSearchResult(searchKeyword: _searchKeyword),
                  );
                },
                child: const Icon(Icons.search, color: Colors.white),
              ),
            ),
            const SizedBox(height: 15.0),
          ],
        ),
      ),
    );
  }
}
