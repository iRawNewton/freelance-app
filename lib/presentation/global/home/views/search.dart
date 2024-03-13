import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/service_category.dart';
import '../../../../services/get_remote_services.dart';
import '../../../search/service/frontend/service_list.dart';

class HomeWidget1 extends StatefulWidget {
  const HomeWidget1({super.key});

  @override
  State<HomeWidget1> createState() => _HomeWidget1State();
}

class _HomeWidget1State extends State<HomeWidget1> {
  final TextEditingController _search = TextEditingController();
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
          image: AssetImage('lib/resources/assets/images/slider1.jpg'),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
              child: Column(
                children: [
                  const SizedBox(height: 10.0),
                  // ^ title
                  Text(
                    'Hire the best freelancers for any job, online.',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),

                  // ^ sub title
                  Text(
                    'Millions of people use freeio.com to turn their ideas into reality.',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 15.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),

                  // ^ card
                  const SizedBox(height: 40.0),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                                color: Colors.black87,
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: TextField(
                                    controller: _search,
                                    decoration: const InputDecoration(
                                      hintText: 'What are you looking for?',
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

                          // ^ search button
                          Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: SizedBox(
                              width: MediaQuery.sizeOf(context).width,
                              height: 40.0,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    backgroundColor: const Color(0xFF5BBB7B),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    navigateToPage(
                                        context,
                                        ServiceSearchResult(
                                          searchKeyword: _search.text,
                                        ));
                                  },
                                  child: Text(
                                    'Search',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                    ),
                                  )),
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
