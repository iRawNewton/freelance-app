import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget1 extends StatefulWidget {
  const HomeWidget1({super.key});

  @override
  State<HomeWidget1> createState() => _HomeWidget1State();
}

class _HomeWidget1State extends State<HomeWidget1> {
  // String _selectedItem = 'Option 1'; // Default selected item

  final List<String> _dropdownItems = [
    'Categories',
    'Design & Creative',
    'Digital Marketing',
    'Programming & Tech',
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.49,
      width: MediaQuery.sizeOf(context).width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
              'https://demoapus1.com/freeio/wp-content/uploads/2022/10/slider1.jpg'),
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
                  Text(
                    'Hire the best freelancers for any job, online.',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                    'Millions of people use freeio.com to turn their ideas into reality.',
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 15.0,
                      // fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 5.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                CupertinoIcons.search,
                                color: Colors.black87,
                              ),
                              SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                child: const Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: TextField(
                                    decoration: InputDecoration(
                                      hintText: 'What are you looking for?',
                                      border: InputBorder.none,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.only(left: 30.0),
                            child: DropdownButton<String>(
                              isExpanded: true,
                              elevation: 0,
                              underline: const SizedBox(),
                              value: _dropdownItems[0],
                              // value: _selectedItem,
                              onChanged: (String? newValue) {
                                setState(() {
                                  // _selectedItem = newValue!;
                                });
                              },
                              items: _dropdownItems.map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: const Color(0xFF5BBB7B),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Search',
                                  style: GoogleFonts.roboto(
                                    color: Colors.white,
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Text(
                    'Popular Searches : Designer, Web, IOS, PHP, Senior, Engineer',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 15,
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
