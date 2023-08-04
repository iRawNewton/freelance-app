import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelance_app/dev/screens/product_desc.dart/widgets/basic_stats.dart';
import 'package:freelance_app/dev/screens/product_desc.dart/widgets/product_title.dart';
import 'package:freelance_app/dev/ui_global/text_widget.dart';
import 'package:freelance_app/res/constants/strings.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui_global/carousel.dart';

class ProductDesc extends StatefulWidget {
  const ProductDesc({super.key});

  @override
  State<ProductDesc> createState() => _ProductDescState();
}

class _ProductDescState extends State<ProductDesc> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
                SliverAppBar(
                  toolbarHeight: 70.0,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: SvgPicture.network(ConstStrings.logoUrl),
                  ),
                  leadingWidth: 120.0,
                  actions: [
                    Text(
                      'Login',
                      style: GoogleFonts.lato(
                        fontSize: 14.0,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(width: 25.0),
                    const Icon(Icons.menu),
                    const SizedBox(width: 8.0),
                  ],
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
                              icon: 'lib/res/assets/icons/event.svg',
                              title: 'Delivery Time',
                              subtitle: '2 Days',
                              size: 30.0,
                            ),
                            SizedBox(width: 40.0),
                            BasicStats(
                              icon: 'lib/res/assets/icons/graph.svg',
                              title: 'English level',
                              subtitle: 'Conversational',
                              size: 25.0,
                            ),
                          ],
                        ),
                        BasicStats(
                          icon: 'lib/res/assets/icons/tracking.svg',
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
                        // FAQ's
                        const Column(
                          children: [
                            ExpansionTile(
                              backgroundColor: Color.fromARGB(0, 139, 226, 219),
                              title: CustomText(
                                title:
                                    'What methods of payments are supported?',
                                size: 16.0,
                                color: Colors.black87,
                              ),
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  child: CustomText(
                                    title:
                                        'At vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident.',
                                    size: 14.0,
                                    color: Colors.black87,
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )),
    ));
  }
}
