import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/global/drawer/global_drawer.dart';
import 'package:freelance_app/presentation/global/home/views/blog.dart';
import 'package:freelance_app/presentation/global/home/views/category.dart';
import 'package:freelance_app/presentation/global/home/views/search.dart';
import 'package:freelance_app/presentation/global/home/views/service_circle.dart';
import 'package:freelance_app/presentation/global/home/views/services.dart';
import 'package:freelance_app/presentation/global/home/views/static_section.dart';
import 'package:freelance_app/presentation/global/home/views/static_section1.dart';
import 'package:freelance_app/presentation/global/home/views/stats.dart';
import 'package:freelance_app/presentation/global/home/views/testimonial.dart';
import 'package:freelance_app/presentation/global/home/views/trending_service.dart';
import 'package:freelance_app/resources/widgets/appbar.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:freelance_app/services/get_remote_services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../models/home_model.dart';

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
  List<Category?> serviceCategory = [];
  List<Project?> projects = [];

  Future<Object?>? futureVariable;

  Future<HomeModel?> getHomeInfo() async {
    homeData = (await GetRemoteService().getHomeDetails())!;

    setState(() {
      category = homeData.category;
      projects = homeData.projects;
      serviceCategory = homeData.serviceCategory;
    });
    return homeData;
  }

  @override
  void initState() {
    setState(() {
      futureVariable = getHomeInfo();
    });

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

                  // ^ services
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        CustomText(
                          title: 'Trending Services',
                          size: 16.0,
                          color: Colors.black87,
                        ),
                        Icon(Icons.arrow_right_alt_outlined)
                      ],
                    ),
                  ),
                  ServiceCircle(serviceCategory: serviceCategory),

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
                                    fontWeight: FontWeight.w500,
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
                                CategorySpace(
                                  serviceid1: category[0]!.categoryId,
                                  iconAsset1: category[0]!.categoryImage,
                                  services1: '8 Services',
                                  title1: category[0]!.categoryName,
                                  // ----------
                                  serviceid2: category[1]!.categoryId,
                                  iconAsset2: category[1]!.categoryImage,
                                  services2: '1 Services',
                                  title2: category[1]!.categoryName,
                                ),
                                // second-category
                                const SizedBox(height: 24.0),
                                CategorySpace(
                                  serviceid1: category[2]!.categoryId,
                                  iconAsset1: category[2]!.categoryImage,
                                  services1: '8 Services',
                                  title1: category[2]!.categoryName,
                                  // ----------
                                  serviceid2: category[3]!.categoryId,
                                  iconAsset2: category[3]!.categoryImage,
                                  services2: '1 Services',
                                  title2: category[3]!.categoryName,
                                ),
                                // third-category
                                const SizedBox(height: 24.0),
                                CategorySpace(
                                  serviceid1: category[4]!.categoryId,
                                  iconAsset1: category[4]!.categoryImage,
                                  services1: '0 Services',
                                  title1: category[4]!.categoryName,
                                  // ----------
                                  serviceid2: category[5]!.categoryId,
                                  iconAsset2: category[5]!.categoryImage,
                                  services2: '0 Services',
                                  title2: category[5]!.categoryName,
                                ),
                                // fourth-category
                                const SizedBox(height: 24.0),
                                CategorySpace(
                                  serviceid1: category[6]!.categoryId,
                                  iconAsset1: category[6]!.categoryImage,
                                  services1: '1 Services',
                                  title1: category[6]!.categoryName,
                                  // ----------
                                  serviceid2: category[7]!.categoryId,
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

                  // ^ trending freelancers
                  TrendingSection(projects: projects),

                  // ^ services

                  // ^ need something done
                  const ServicesPage(),
                  const SizedBox(height: 24.0),
                  const StaticSectionOne(),
                  SizedBox(
                    child: Image.asset('lib/resources/assets/images/h1.jpg'),
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
