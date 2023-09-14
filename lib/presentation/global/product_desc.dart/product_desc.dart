import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/global/checkout/checkout.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/about_us.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/basic.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/basic_stats.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/faqs.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/product_title.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/ratings.dart';
import 'package:freelance_app/resources/widgets/footer.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/services/get_remote_services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../models/product_model.dart';
import '../../../resources/widgets/appbar.dart';
import '../../../resources/widgets/carousel.dart';

class ProductDesc extends StatefulWidget {
  const ProductDesc({super.key, required this.productId});

  final String productId;

  @override
  State<ProductDesc> createState() => _ProductDescState();
}

class _ProductDescState extends State<ProductDesc> {
  PageController controller = PageController();

  // List<ProductModel>? productDetails = [];
  List<Project>? productDetails = [];
  List<Faq>? faq = [];

  ProductData? productData = ProductData(
    productDetails: [], // Initialize productDetails with your data
    faq: [], // Initialize faq with your data
  );

  // & get product info
  Future<ProductModel?> getProductDetails() async {
    ProductModel? response = await GetRemoteService().getProductInfo();
    print(response);
    setState(() {
      productDetails = response!.projects;
      faq = response.faq;
    });
    // ProductModel? response;

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                TopAppBar(
                  onTap: () {
                    getProductDetails();
                  },
                ),
              ],
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: FutureBuilder(
                future: getProductDetails(),
                builder: (context, AsyncSnapshot<ProductModel?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProductDescTitle(
                            name:
                                '${productDetails![0].firstName} ${productDetails![0].lastName}',
                            title: productDetails![0].projectTitle,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14.0, vertical: 14.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    BasicStats(
                                      icon:
                                          'lib/resources/assets/icons/event.svg',
                                      title: 'Delivery Time',
                                      subtitle: productDetails![0]
                                          .projectMinDeliveryTime,
                                      size: 30.0,
                                    ),
                                    const SizedBox(width: 40.0),
                                    BasicStats(
                                      icon:
                                          'lib/resources/assets/icons/graph.svg',
                                      title: 'English level',
                                      subtitle: productDetails![0]
                                          .languageProficiency,
                                      size: 25.0,
                                    ),
                                  ],
                                ),
                                const BasicStats(
                                  icon:
                                      'lib/resources/assets/icons/tracking.svg',
                                  title: 'Location',
                                  subtitle: 'New York',
                                  size: 27.0,
                                ),
                                // BasicStats(),
                              ],
                            ),
                          ),
                          Container(
                            width: double.infinity,
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Container(
                                  color: Colors.white70,
                                  child: CustomCarousel(images: productDetails),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // ^ service description label
                                Text(
                                  'Service Description',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black87,
                                    fontSize: 20.0,
                                  ),
                                ),

                                // ^ service description label
                                const SizedBox(height: 12.0),
                                Text(
                                  productDetails![0].projectDescription,
                                  style: GoogleFonts.roboto(
                                    color: Colors.black54,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                                const SizedBox(height: 16.0),
                                Text(
                                  'Services I Provide',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black87,
                                    fontSize: 18.0,
                                  ),
                                ),
                                Text(
                                  productDetails![0].servicesProvided,
                                  style: GoogleFonts.roboto(
                                    color: Colors.black54,
                                    fontSize: 14.0,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),

                                // const SizedBox(height: 30.0),
                                // Text(
                                //   'App type',
                                //   style: GoogleFonts.roboto(
                                //     color: Colors.black87,
                                //     fontSize: 14.0,
                                //   ),
                                // ),
                                // const SizedBox(height: 10.0),
                                // Text(
                                //   'Business, Food & drink,',
                                //   style: GoogleFonts.roboto(
                                //     color: Colors.black54,
                                //     fontSize: 14.0,
                                //   ),
                                // ),
                                // Text(
                                //   'Graphics & design',
                                //   style: GoogleFonts.roboto(
                                //     color: Colors.black54,
                                //     fontSize: 14.0,
                                //   ),
                                // ),
                                // const SizedBox(height: 30.0),

                                // ^ design tool
                                const SizedBox(height: 10.0),
                                Text(
                                  'Design tool',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black87,
                                    fontSize: 18.0,
                                  ),
                                ),

                                Text(
                                  productDetails![0].toolsAndTechnologies,
                                  style: GoogleFonts.roboto(
                                    color: Colors.black54,
                                    fontSize: 16.0,
                                  ),
                                ),

                                const SizedBox(height: 10.0),
                                Text(
                                  'Device Type',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black87,
                                    fontSize: 18.0,
                                  ),
                                ),

                                Text(
                                  'Mobile, Desktop',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black54,
                                    fontSize: 16.0,
                                  ),
                                ),
                                const SizedBox(height: 10.0),
                                const Divider(),
                                const SizedBox(height: 20.0),
                                Text(
                                  'FAQs',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black87,
                                    fontSize: 18.0,
                                  ),
                                ),
                                // FAQ's
                                Column(
                                  children: [
                                    ListView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        itemCount: faq!.length,
                                        itemBuilder: (context, index) {
                                          return ProductFaqs(
                                              title: faq![index].questionText,
                                              subtitle: faq![index].answerText);
                                        }),
                                  ],
                                ),
                                const SizedBox(height: 30.0),
                              ],
                            ),
                          ),
                          Column(
                            children: [
                              Container(
                                height: 50.0,
                                decoration: BoxDecoration(border: Border.all()),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.animateToPage(0,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeInOut);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Basic'),
                                      ),
                                    ),
                                    const SizedBox(
                                        height: 50.0, child: VerticalDivider()),
                                    InkWell(
                                      onTap: () {
                                        controller.animateToPage(1,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeInOut);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Standard'),
                                      ),
                                    ),
                                    const SizedBox(
                                        height: 50.0, child: VerticalDivider()),
                                    InkWell(
                                      onTap: () {
                                        controller.animateToPage(2,
                                            duration: const Duration(
                                                milliseconds: 300),
                                            curve: Curves.easeInOut);
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Text('Premium'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                height: 250.0,
                                child: PageView(
                                  controller: controller,
                                  children: const [
                                    BasicPlan(),
                                    StandardPlan(),
                                    PremiumPlan(),
                                  ],
                                ),
                              ),
                              Directionality(
                                textDirection: TextDirection.rtl,
                                child: ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: CustomColors.buttonColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    minimumSize: Size(
                                      MediaQuery.sizeOf(context).width * 0.9,
                                      50.0,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const Checkout(),
                                      ),
                                    );
                                  },
                                  icon: const Directionality(
                                    textDirection: TextDirection.ltr,
                                    child: Icon(
                                      Icons.trending_flat,
                                      color: Colors.white,
                                    ),
                                  ),
                                  label: Text(
                                    'Continue',
                                    style: GoogleFonts.roboto(
                                      color: Colors.white,
                                      fontSize: 15.0,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              const AboutUsSection(),
                              const SizedBox(height: 10.0),
                              const RatingsSection(),
                              const SizedBox(height: 30.0),
                              const AppFooter(),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    // TODO: no data lottie
                    return const SizedBox();
                  }
                }),
          )),
    ));
  }
}

class ProductData {
  List<Project>? productDetails;
  List<Faq>? faq;

  ProductData({
    this.productDetails,
    this.faq,
  });
}
