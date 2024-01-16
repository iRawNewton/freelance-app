import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/basic.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/basic_stats.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/faqs.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';
import 'package:freelance_app/resources/widgets/footer.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:freelance_app/services/get_remote_services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../models/product_model.dart';
import '../../../../../resources/widgets/appbar.dart';
import '../../../../../resources/widgets/carousel.dart';
import '../view_freelance_applicat_data.dart';
import 'prod_desc_title_view.dart';

class ProductPostedDescView extends StatefulWidget {
  const ProductPostedDescView({super.key, required this.productId});

  final String productId;

  @override
  State<ProductPostedDescView> createState() => _ProductPostedDescViewState();
}

class _ProductPostedDescViewState extends State<ProductPostedDescView> {
  PageController controller = PageController();

  // List<ProductModel>? productDetails = [];
  List<Project>? productDetails = [];
  List<Faq>? faq = [];
  List<Package>? package = [];
  bool isLoading = true;

  bool isMultiple = false;
  bool starterV = true;
  bool proV = false;
  bool premiumV = false;

  Color? starterColor;
  Color? proColor;
  Color? premiumColor;

  // & get product info
  Future<ProductModel?> getProductDetails(String id) async {
    ProductModel? response = await GetRemoteService().getProductInfo(id);

    setState(() {
      productDetails = response!.projects;
      faq = response.faq;
      package = response.packages;

      (package![0].type == 'multiple') ? isMultiple = true : isMultiple = false;

      if (productDetails!.isNotEmpty) {
        isLoading = false;
      }
    });

    return response;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            TopAppBar(
              onTap: () {},
            ),
          ],
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: FutureBuilder(
              future: getProductDetails(widget.productId),
              builder: (context, AsyncSnapshot<ProductModel?> snapshot) {
                if (isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProductDescTitleView(
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
                                    subtitle:
                                        productDetails![0].languageProficiency,
                                    size: 25.0,
                                  ),
                                ],
                              ),
                              const BasicStats(
                                icon: 'lib/resources/assets/icons/tracking.svg',
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

                              // ^ FAQs
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

                        // ^ after package part
                        (isMultiple)
                            ? Column(
                                children: [
                                  // ^ package
                                  SizedBox(
                                    height: 50.0,
                                    // decoration: BoxDecoration(border: Border.all()),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        // ^ starter
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.33,
                                          height: 50.0,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: starterColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                starterV = true;
                                                proV = false;
                                                premiumV = false;
                                                starterColor =
                                                    Colors.green.shade50;
                                                proColor = Colors.white;
                                                premiumColor = Colors.white;
                                              });
                                            },
                                            child: const CustomText(
                                              title: 'Starter',
                                              size: 14.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),

                                        // ^ Pro
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.33,
                                          height: 50.0,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: proColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                starterV = false;
                                                proV = true;
                                                premiumV = false;
                                                starterColor = Colors.white;
                                                proColor = Colors.green.shade50;
                                                premiumColor = Colors.white;
                                              });
                                            },
                                            child: const CustomText(
                                              title: 'Pro',
                                              size: 14.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),

                                        // ^ premium
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.33,
                                          height: 50.0,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: premiumColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                            ),
                                            onPressed: () {
                                              setState(() {
                                                starterV = false;
                                                proV = false;
                                                premiumV = true;
                                                starterColor = Colors.white;
                                                proColor = Colors.white;
                                                premiumColor =
                                                    Colors.green.shade50;
                                              });
                                            },
                                            child: const CustomText(
                                              title: 'Premium',
                                              size: 14.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  (starterV)
                                      ? StarterPlan(package: package)
                                      : const SizedBox(),
                                  (proV)
                                      ? ProPlan(
                                          package: package,
                                        )
                                      : const SizedBox(),
                                  (premiumV)
                                      ? PremiumPlan(
                                          package: package,
                                        )
                                      : const SizedBox(),

                                  // ^ button
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            CustomColors.buttonColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        minimumSize: Size(
                                          MediaQuery.sizeOf(context).width *
                                              0.9,
                                          50.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        navigateToPage(
                                            context,
                                            FreelanceApplicationList(
                                              jobId:
                                                  productDetails![0].projectId,
                                            ));
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
                                ],
                              )
                            : Column(
                                children: [
                                  // ^ package
                                  SizedBox(
                                    height: 50.0,
                                    // decoration: BoxDecoration(border: Border.all()),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        // ^ Onetime
                                        SizedBox(
                                          width:
                                              MediaQuery.sizeOf(context).width,
                                          height: 50.0,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: proColor,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(0.0),
                                              ),
                                            ),
                                            onPressed: () {},
                                            child: const CustomText(
                                              title: 'Standard Pay',
                                              size: 16.0,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 20.0),

                                  (starterV)
                                      ? StarterPlan(package: package)
                                      : const SizedBox(),
                                  (proV)
                                      ? ProPlan(
                                          package: package,
                                        )
                                      : const SizedBox(),
                                  (premiumV)
                                      ? PremiumPlan(
                                          package: package,
                                        )
                                      : const SizedBox(),

                                  // ^ button
                                  const SizedBox(height: 30.0),
                                  Directionality(
                                    textDirection: TextDirection.rtl,
                                    child: ElevatedButton.icon(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor:
                                            CustomColors.buttonColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                        minimumSize: Size(
                                          MediaQuery.sizeOf(context).width *
                                              0.9,
                                          50.0,
                                        ),
                                      ),
                                      onPressed: () {
                                        navigateToPage(
                                            context,
                                            FreelanceApplicationList(
                                              jobId:
                                                  productDetails![0].projectId,
                                            ));
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
                                ],
                              ),

                        // ^ after pricing section

                        const SizedBox(height: 30.0),
                        const AppFooter(),
                      ],
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
