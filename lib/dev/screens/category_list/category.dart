import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:freelance_app/dev/screens/category_list/widgets/products_list.dart';
import 'package:freelance_app/dev/screens/product_desc.dart/product_desc.dart';
import 'package:freelance_app/dev/ui_global/footer.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../ui_global/appbar.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  // Initial Selected Value
  String dropdownvalue = 'Sort by (Default)';

  // List of items in our dropdown menu
  var items = [
    'Sort by (Default)',
    'Newest',
    'Oldest',
    'Random',
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            const TopAppBar(),
          ],
          body: Container(
            color: Colors.white70,
            height: double.infinity,
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                            'https://demoapus1.com/freeio/wp-content/uploads/2022/09/bg-filter1.jpg'),
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
                                  onPressed: () {},
                                  icon: const Icon(Icons.play_arrow),
                                ),
                              ),
                              const SizedBox(width: 20.0),
                              Text(
                                'How Freeio Works',
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
                  const SizedBox(height: 36.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Showing all 8 results',
                          style: GoogleFonts.roboto(),
                        ),
                        const SizedBox(height: 14.0),
                        Row(
                          children: [
                            SizedBox(
                              height: 50.0,
                              child: ElevatedButton.icon(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffF1FCFA),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.filter_list,
                                  color: Colors.black87,
                                ),
                                // label: const Text('Filter',style: TextStyle(fontSize: 12.0, color: Colors.black87, )),
                                label: Text(
                                  'Filter',
                                  style: GoogleFonts.roboto(
                                    color: Colors.black87,
                                    fontSize: 14.0,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20.0),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    width: 1.0,
                                    color: const Color(0xffE9E9E9),
                                  ),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: DropdownButton(
                                  underline: const SizedBox(),
                                  // Initial Value
                                  value: dropdownvalue,
                                  // Down Arrow Icon
                                  icon: const Icon(Icons.arrow_drop_down),
                                  // Array list of items
                                  items: items.map((String items) {
                                    return DropdownMenuItem(
                                      value: items,
                                      child: Text(
                                        items,
                                        style: GoogleFonts.roboto(
                                          fontSize: 14.0,
                                        ),
                                      ),
                                    );
                                  }).toList(),
                                  // After selecting the desired option,it will
                                  // change button value to selected value
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      dropdownvalue = newValue!;
                                    });
                                  },
                                ),
                              ),
                            ),

                            // ElevatedButton(onPressed: () {}, child: child)
                          ],
                        ),
                        const SizedBox(height: 36.0),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const ProductDesc()));
                          },
                          child: const ProductList(
                            imgUrl:
                                'https://demoapus1.com/freeio/wp-content/uploads/2022/11/service12-495x370.jpg',
                            category: 'Development & IT',
                            title:
                                'Web Development, with HTML, CSS, JavaScript and PHP',
                            ratings: '4',
                            reviews: '54',
                            user: 'Agent Pakulla',
                            price: '29',
                          ),
                        ),
                        const SizedBox(height: 14.0),
                        const ProductList(
                          imgUrl:
                              'https://demoapus1.com/freeio/wp-content/uploads/2022/11/service10-768x576.jpg',
                          category: 'Development & IT',
                          title:
                              'Flexibility & Customization with CMS vs PHP framework',
                          ratings: '5',
                          reviews: '13',
                          user: 'Thomas Powell',
                          price: '99',
                        ),
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
