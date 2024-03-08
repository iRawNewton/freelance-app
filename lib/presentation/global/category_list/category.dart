import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/models/category_model.dart';
import 'package:freelance_app/presentation/global/category_list/views/products_list.dart';
import 'package:freelance_app/resources/widgets/footer.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:freelance_app/services/get_remote_services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:lottie/lottie.dart';
import '../../../resources/constants/strings.dart';
import '../../../resources/widgets/appbar.dart';
import '../drawer/global_drawer.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key, required this.id});
  final String id;

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  // Initial Selected Value
  String dropdownvalue = 'Sort by (Default)';

  // List of items in our dropdown menu
  var items = [
    'Sort by (Default)',
    'Newest',
    'Oldest',
    'Random',
  ];

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'sPW7nDBqt8w',
  );

  String totalProducts = '';
  List<Project> projectsList = [];
  bool isVisible = true;
  late Future<CategoryModel?> futureVariable;

  Future<CategoryModel?> categoryProductList() async {
    CategoryModel? response =
        await GetRemoteService().getCategoryProducts(widget.id);

    setState(() {
      totalProducts = response!.totalCount;
      projectsList = response.projects;
      (response.totalCount == '0') ? isVisible = false : isVisible = true;
    });

    return response;
  }

  @override
  void initState() {
    setState(() {
      futureVariable = categoryProductList();
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
            color: Colors.white70,
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ^ top card
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            'https://demoapus1.com/freeio-new/wp-content/uploads/2022/09/bg-filter1.jpg'),
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 48.0),
                          Text(
                            'Design & Creative',
                            style: GoogleFonts.roboto(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 14.0),
                          Text(
                            'Give your visitor a smooth online experience with a solid UX design',
                            style: GoogleFonts.roboto(
                              fontSize: 14.0,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 24.0),
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.white70,
                                child: IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.9,
                                          child: Center(
                                            child: YoutubePlayer(
                                              controller: _controller,
                                              showVideoProgressIndicator: true,
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.play_arrow),
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Text(
                                'How CFC Works',
                                style: GoogleFonts.roboto(
                                  fontSize: 14.0,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 48.0),
                        ],
                      ),
                    ),
                  ),

                  // ^ after card
                  const SizedBox(height: 36.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Text(
                        //   'Showing all results',
                        //   style: GoogleFonts.roboto(),
                        // ),
                        // const SizedBox(height: 14.0),

                        // ^ filter and sort button
                        // Row(
                        //   children: [
                        //     SizedBox(
                        //       height: 50.0,
                        //       child: ElevatedButton.icon(
                        //         style: ElevatedButton.styleFrom(
                        //           backgroundColor: const Color(0xffF1FCFA),
                        //           shape: RoundedRectangleBorder(
                        //             borderRadius: BorderRadius.circular(8.0),
                        //           ),
                        //         ),
                        //         onPressed: () {},
                        //         icon: const Icon(
                        //           Icons.filter_list,
                        //           color: Colors.black87,
                        //         ),
                        //         // label: const Text('Filter',style: TextStyle(fontSize: 12.0, color: Colors.black87, )),
                        //         label: Text(
                        //           'Filter',
                        //           style: GoogleFonts.roboto(
                        //             color: Colors.black87,
                        //             fontSize: 14.0,
                        //           ),
                        //         ),
                        //       ),
                        //     ),
                        //     const SizedBox(width: 20.0),
                        //     Container(
                        //       decoration: BoxDecoration(
                        //           border: Border.all(
                        //             width: 1.0,
                        //             color: const Color(0xffE9E9E9),
                        //           ),
                        //           borderRadius: BorderRadius.circular(5.0)),
                        //       child: Padding(
                        //         padding:
                        //             const EdgeInsets.symmetric(horizontal: 8.0),
                        //         child: DropdownButton(
                        //           underline: const SizedBox(),
                        //           // Initial Value
                        //           value: dropdownvalue,
                        //           // Down Arrow Icon
                        //           icon: const Icon(Icons.arrow_drop_down),
                        //           // Array list of items
                        //           items: items.map((String items) {
                        //             return DropdownMenuItem(
                        //               value: items,
                        //               child: Text(
                        //                 items,
                        //                 style: GoogleFonts.roboto(
                        //                   fontSize: 14.0,
                        //                 ),
                        //               ),
                        //             );
                        //           }).toList(),
                        //           // After selecting the desired option,it will
                        //           // change button value to selected value
                        //           onChanged: (String? newValue) {
                        //             setState(() {
                        //               dropdownvalue = newValue!;
                        //             });
                        //           },
                        //         ),
                        //       ),
                        //     ),

                        //     // ElevatedButton(onPressed: () {}, child: child)
                        //   ],
                        // ),
                        const SizedBox(height: 36.0),

                        // ^ category product list

                        Visibility(
                          visible: isVisible,
                          replacement: Center(
                            child: Column(
                              children: [
                                LottieBuilder.asset(
                                    'lib/resources/assets/animations/nothing_found.json'),
                                const CustomText(
                                  title: 'No Data Found...',
                                  size: 16.0,
                                  color: Colors.black87,
                                ),
                              ],
                            ),
                          ),
                          // TODO: FREELANCE FROM HERE
                          child: FutureBuilder(
                            future: futureVariable,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: projectsList.length,
                                  itemBuilder: (context, index) {
                                    // return Text(projectsList[index].categoryName);
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10.0,
                                      ),
                                      child: ProductList(
                                        // $productImage/${projectsList[index].images}
                                        productId:
                                            projectsList[index].projectId,
                                        imgUrl:
                                            '$productImage${projectsList[index].images.gallery1}',
                                        category:
                                            projectsList[index].categoryName,
                                        title: projectsList[index].projectTitle,
                                        user:
                                            '${projectsList[index].firstName} ${projectsList[index].lastName}',
                                        price: '29',
                                      ),
                                    );
                                  },
                                );
                              } else {
                                return const ProductListLoading();
                              }
                            },
                          ),
                        ),

                        const SizedBox(height: 14.0),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14.0),
                  const AppFooter(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
