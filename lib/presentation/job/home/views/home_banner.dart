import 'dart:ui';

// import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/service_category.dart';
import '../../../../services/get_remote_services.dart';

class JobBannerView extends StatefulWidget {
  const JobBannerView({super.key});

  @override
  State<JobBannerView> createState() => _JobBannerViewState();
}

class _JobBannerViewState extends State<JobBannerView> {
  // String _selectedItem = 'Option 1'; // Default selected item
  // final TextEditingController _category = TextEditingController();

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
          image: AssetImage('lib/resources/assets/icons/job_banner.webp'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            color: Colors.black.withOpacity(0.7),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  // ^ title
                  Text(
                    'Discover top talent and find the perfect job opportunities, all in one place.',
                    style: GoogleFonts.openSans(
                      color: JobCustomColors.textColor,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // ^ sub title
                  Text(
                    'Countless job seekers trust JobFinderApp to transform their career aspirations into reality.',
                    style: GoogleFonts.openSans(
                      color: JobCustomColors.textColor,
                      fontSize: 15.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),

                  // ^ card
                  const SizedBox(height: 40.0),
                  Container(
                    decoration: BoxDecoration(
                      color: JobCustomColors.secondaryBackground,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 15.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.search,
                                color: JobCustomColors.textColor,
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'What are you looking for?',
                                      hintStyle: TextStyle(
                                          color: JobCustomColors.textColor),
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),

                          // ^ category
                          // ! currently hidden
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 20.0),
                          //   child: DropdownButtonFormField2<String>(
                          //     hint: const Text(
                          //       'Choose category',
                          //       style: TextStyle(fontSize: 14.0),
                          //     ),
                          //     items: serviceCategory?.map((category) {
                          //           return DropdownMenuItem<String>(
                          //             value: category.categoryId,
                          //             child: Text(category.categoryName),
                          //           );
                          //         }).toList() ??
                          //         [],
                          //     // validator: (value) {
                          //     //   if (value == null) {
                          //     //     return 'Please select any one option.';
                          //     //   }
                          //     //   return null;
                          //     // },
                          //     onChanged: (value) {
                          //       //Do something when selected item is changed.
                          //       setState(() {
                          //         _category.text = value.toString();
                          //       });
                          //     },
                          //     buttonStyleData: ButtonStyleData(
                          //       height: 50.0,
                          //       decoration: BoxDecoration(
                          //         border: Border.all(
                          //           width: 0,
                          //           color: Colors.transparent,
                          //         ),
                          //       ),
                          //     ),
                          //     iconStyleData: const IconStyleData(
                          //       icon: Icon(
                          //         Icons.arrow_drop_down,
                          //         color: Colors.black45,
                          //       ),
                          //       iconSize: 24.0,
                          //     ),
                          //     dropdownStyleData: DropdownStyleData(
                          //       decoration: BoxDecoration(
                          //         border: Border.all(),
                          //         borderRadius: BorderRadius.circular(10.0),
                          //       ),
                          //     ),
                          //     menuItemStyleData: const MenuItemStyleData(
                          //       padding: EdgeInsets.symmetric(horizontal: 16),
                          //     ),
                          //   ),
                          // ),

                          // const SizedBox(height: 10.0),

                          // ^ search button
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              height: 40.0,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: JobCustomColors.accentColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                onPressed: () {},
                                child: const CustomText(
                                  title: 'Search',
                                  size: 16.0,
                                  color: JobCustomColors.textColor2,
                                  weight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  // ^ Popular searches
                  Text(
                    'Popular Searches : Designer, Web, IOS, PHP, Senior, Engineer',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 15.0,
                      letterSpacing: 1.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
