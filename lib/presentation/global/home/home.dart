import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:freelance_app/presentation/global/category_list/category.dart';
import 'package:freelance_app/presentation/global/drawer/global_drawer.dart';
import 'package:freelance_app/presentation/global/home/views/blog.dart';
import 'package:freelance_app/presentation/global/home/views/category.dart';
import 'package:freelance_app/presentation/global/home/views/search.dart';
import 'package:freelance_app/presentation/global/home/views/services.dart';
import 'package:freelance_app/presentation/global/home/views/static_section.dart';
import 'package:freelance_app/presentation/global/home/views/static_section1.dart';
import 'package:freelance_app/presentation/global/home/views/stats.dart';
import 'package:freelance_app/presentation/global/home/views/testimonial.dart';
import 'package:freelance_app/presentation/global/home/views/trending_service.dart';
import 'package:freelance_app/res/widgets/appbar.dart';
import 'package:freelance_app/services/get_remote_services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/home.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool dataVisible = false;
  late HomeModel homeData;
  final trendingServiceController =
      PageController(initialPage: 0, viewportFraction: 1.0);

  List<Category?> category = [];
  List<Project?> projects = [];

  Future<HomeModel?> getHomeInfo() async {
    homeData = (await GetRemoteService().getHomeDetails())!;
    setState(() {
      category = homeData.category;
      projects = homeData.projects;
    });

    // print(homeData.projects[0].images.gallery1);
    return homeData;
  }

  @override
  void initState() {
    getHomeInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        drawer: const GlobalDrawer(),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            TopAppBar(
              onTap: () => _scaffoldKey.currentState?.openDrawer(),
            ),
          ],
          body: Container(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            color: Colors.grey.shade200,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // ^ Search what you're looking for
                  const HomeWidget1(),
                  const SizedBox(height: 20.0),

                  // ^ browse talent by category
                  FutureBuilder(
                    future: getHomeInfo(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Browse talent by category',
                                  style: GoogleFonts.roboto(
                                    fontSize: 23.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                Text(
                                  'Get some Inspirations from 1800+ skills',
                                  style: GoogleFonts.roboto(
                                    fontSize: 13.0,
                                  ),
                                ),
                                Text(
                                  'All Categories',
                                  style: GoogleFonts.roboto(
                                    fontSize: 13.0,
                                  ),
                                ),
                                // first-category
                                const SizedBox(height: 24.0),
                                InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const CategoryPage(),
                                      ),
                                    );
                                  },
                                  child: CategorySpace(
                                    iconAsset1: category[0]!.categoryImage,
                                    services1: '8 Services',
                                    title1: category[0]!.categoryName,
                                    // ----------
                                    iconAsset2: category[1]!.categoryImage,
                                    services2: '1 Services',
                                    title2: category[1]!.categoryName,
                                  ),
                                ),
                                // second-category
                                const SizedBox(height: 24.0),
                                CategorySpace(
                                  iconAsset1: category[2]!.categoryImage,
                                  services1: '8 Services',
                                  title1: category[2]!.categoryName,
                                  // ----------
                                  iconAsset2: category[3]!.categoryImage,
                                  services2: '1 Services',
                                  title2: category[3]!.categoryName,
                                ),
                                // third-category
                                const SizedBox(height: 24.0),
                                CategorySpace(
                                  iconAsset1: category[4]!.categoryImage,
                                  services1: '0 Services',
                                  title1: category[4]!.categoryName,
                                  // ----------
                                  iconAsset2: category[5]!.categoryImage,
                                  services2: '0 Services',
                                  title2: category[5]!.categoryName,
                                ),
                                // fourth-category
                                const SizedBox(height: 24.0),
                                CategorySpace(
                                  iconAsset1: category[6]!.categoryImage,
                                  services1: '1 Services',
                                  title1: category[6]!.categoryName,
                                  // ----------
                                  iconAsset2: category[7]!.categoryImage,
                                  services2: '4 Services',
                                  title2: category[7]!.categoryName,
                                ),
                                const SizedBox(height: 24.0),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // first-category
                                SizedBox(height: 24.0),
                                CategoryLoading(),
                                // second-category
                                SizedBox(height: 24.0),
                                CategoryLoading(),
                                // third-category
                                SizedBox(height: 24.0),
                                CategoryLoading(),
                                // fourth-category
                                SizedBox(height: 24.0),
                                CategoryLoading(),
                                SizedBox(height: 24.0),
                                // ! TrendingSection(),
                                // ! SizedBox(height: 24.0),
                              ],
                            ),
                          ),
                        );
                      }
                    },
                  ),

                  // ^ trending service

                  // ! ********************
                  // SizedBox(
                  //   height: 500,
                  //   width: double.infinity,
                  //   child: PageView(
                  //     controller: trendingServiceController,
                  //     children: [
                  //       FutureBuilder(
                  //         builder: (context, snapshot) {
                  //           if (snapshot.hasData) {
                  //             return ListView.builder(
                  //                 shrinkWrap: true,
                  //                 itemCount: projects.length,
                  //                 itemBuilder: (context, index) {
                  //                   return const TrendingSection();
                  //                 });
                  //           } else {
                  //             return const Text('data');
                  //           }
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 750.0,
                  //   width: double.infinity,
                  //   child: PageView(
                  //     controller: trendingServiceController,
                  //     children: [
                  //       ListView.builder(
                  //         // physics: const NeverScrollableScrollPhysics(),
                  //         scrollDirection: Axis.horizontal,
                  //         shrinkWrap: true,
                  //         itemCount: projects.length,
                  //         itemBuilder: (context, index) {
                  //           return TrendingSection();
                  //         },
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  TrendingSection(projects: projects),

                  // ! ********************
                  // const TrendingSection(),
                  // const SizedBox(height: 24.0),

                  // ^ need something done
                  const ServicesPage(),
                  const SizedBox(height: 24.0),
                  const StaticSectionOne(),
                  SizedBox(
                    child: CachedNetworkImage(
                        imageUrl:
                            'https://demoapus1.com/freeio/wp-content/uploads/2022/09/h1.jpg'),
                  ),
                  const SizedBox(height: 24.0),
                  const StatsApp(),
                  const SizedBox(height: 24.0),
                  const TestimonialSection(),
                  const SizedBox(height: 24.0),
                  const StaticSectionTwo(),
                  const SizedBox(height: 24.0),
                  const BlogSection(),
                  const SizedBox(height: 24.0),
                  Container(
                    color: const Color(0xffffede8),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 24.0),
                          Text(
                            'Find the talent needed to get your business growing.',
                            style: GoogleFonts.roboto(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          Text(
                            'Advertise your jobs to millions of monthly users and search 15.8 million CVs',
                            style: GoogleFonts.roboto(
                                fontSize: 14.0, color: Colors.black87),
                          ),
                          const SizedBox(height: 24.0),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: SizedBox(
                              height: 50.0,
                              child: Directionality(
                                textDirection: TextDirection.rtl,
                                child: ElevatedButton.icon(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: const Color(0xff1f4b3f),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.north_east,
                                    color: Colors.white,
                                  ),
                                  label: Text(
                                    'Find Talent',
                                    style: GoogleFonts.roboto(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30.0),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
