import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelance_app/presentation/global/checkout/checkout.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/about_us.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/basic.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/basic_stats.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/faqs.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/product_title.dart';
import 'package:freelance_app/presentation/global/product_desc.dart/views/ratings.dart';
import 'package:freelance_app/resources/widgets/footer.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/constants/strings.dart';
import 'package:google_fonts/google_fonts.dart';

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
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const ProductDescTitle(),
                  const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 14.0, vertical: 14.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            BasicStats(
                              icon: 'lib/resources/assets/icons/event.svg',
                              title: 'Delivery Time',
                              subtitle: '2 Days',
                              size: 30.0,
                            ),
                            SizedBox(width: 40.0),
                            BasicStats(
                              icon: 'lib/resources/assets/icons/graph.svg',
                              title: 'English level',
                              subtitle: 'Conversational',
                              size: 25.0,
                            ),
                          ],
                        ),
                        BasicStats(
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
                          child: const CustomCarousel(),
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
                        Text(
                          'Service Description',
                          style: GoogleFonts.roboto(
                            color: Colors.black87,
                            fontSize: 20.0,
                          ),
                        ),
                        const SizedBox(height: 12.0),
                        Text(
                          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet.',
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
                            fontSize: 20.0,
                          ),
                        ),
                        Text(
                          '1. Website Design.',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          '2. Mobile App Design.',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          '3. Brochure Design.',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        Text(
                          '4. Business Card Design.',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 20.0),
                        Text(
                          'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                        const SizedBox(height: 30.0),
                        Text(
                          'App type',
                          style: GoogleFonts.roboto(
                            color: Colors.black87,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'Business, Food & drink,',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'Graphics & design',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Text(
                          'Design tool',
                          style: GoogleFonts.roboto(
                            color: Colors.black87,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'Adobe XD, Figma,',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          'Adobe Photoshop',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 30.0),
                        Text(
                          'Device',
                          style: GoogleFonts.roboto(
                            color: Colors.black87,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        Text(
                          'Mobile, Desktop',
                          style: GoogleFonts.roboto(
                            color: Colors.black54,
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(height: 10.0),
                        const Divider(),
                        const SizedBox(height: 20.0),
                        // FAQ's
                        const Column(
                          children: [
                            ProductFaqs(
                                title:
                                    'What methods of payments are supported?',
                                subtitle:
                                    'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.'),
                            ProductFaqs(
                              title: 'Can I cancel at anytime?',
                              subtitle:
                                  'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.',
                            ),
                          ],
                        ),
                        const SizedBox(height: 30.0),
                        const Divider(),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        height: 50.0,
                        decoration: BoxDecoration(border: Border.all()),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                controller.animateToPage(0,
                                    duration: const Duration(milliseconds: 300),
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
                                    duration: const Duration(milliseconds: 300),
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
                                    duration: const Duration(milliseconds: 300),
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
            ),
          )),
    ));
  }
}
