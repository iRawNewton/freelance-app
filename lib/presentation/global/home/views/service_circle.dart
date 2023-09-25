import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelance_app/presentation/global/category_list/category.dart';
import 'package:freelance_app/resources/functions/navigate_page.dart';
import '../../../../models/home_model.dart';
import '../../../../resources/constants/colors.dart';

class ServiceCircle extends StatefulWidget {
  const ServiceCircle({super.key, required this.serviceCategory});

  final List<Category?> serviceCategory;

  @override
  State<ServiceCircle> createState() => _ServiceCircleState();
}

class _ServiceCircleState extends State<ServiceCircle> {
  String link =
      'https://freelancer-app.kyptronixllp.co.in/assets/images/category';

  @override
  Widget build(BuildContext context) {
    var x = MediaQuery.of(context).size.width;

    return SizedBox(
      width: x,
      height: 120.0,
      child: ListView.builder(
        itemCount: widget.serviceCategory.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              navigateToPage(context,
                  CategoryPage(id: widget.serviceCategory[index]!.categoryId));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 7.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    minRadius: 37.0,
                    backgroundColor: Colors.grey.shade400,
                    child: CircleAvatar(
                      backgroundColor: CustomColors.accentColor2,
                      minRadius: 35.0,
                      child: SizedBox(
                        height: 40.0,
                        child: Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: SvgPicture.network(
                            '$link/${widget.serviceCategory[index]!.categoryImage}',
                            colorFilter: const ColorFilter.mode(
                              CustomColors.primaryColor,
                              BlendMode.srcIn,
                            ),
                            height: 50.0,
                            width: 50.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5.0),
                  Text(
                    widget.serviceCategory[index]!.categoryName,
                    style: TextStyle(
                      fontSize: x * 0.03,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Navigator.push(
                        //   context,
                        //   MaterialPageRoute(
                        //     builder: (context) => ProductPage(
                        //       categoryId: category![index].id,
                        //       name: category![index].categoryName,
                        //     ),
                        //   ),
                        // );


   // color: Colors.grey.shade100,
      // * original future builder
      // child: FutureBuilder(
      //   builder: (BuildContext context, AsyncSnapshot snapshot) {
      //     if (1 == 1) {
      //       return ListView.builder(
      //           scrollDirection: Axis.horizontal,
      //           shrinkWrap: true,
      //           itemCount: 5,
      //           itemBuilder: (conetxt, index) {
      //             return InkWell(
      //               onTap: () {
      //                 // Navigator.push(
      //                 //   context,
      //                 //   MaterialPageRoute(
      //                 //     builder: (context) => ProductPage(
      //                 //       categoryId: category![index].id,
      //                 //       name: category![index].categoryName,
      //                 //     ),
      //                 //   ),
      //                 // );
      //               },
      //               child: Padding(
      //                 padding: const EdgeInsets.symmetric(
      //                   horizontal: 10.0,
      //                   vertical: 7.0,
      //                 ),
      //                 child: Column(
      //                   mainAxisAlignment: MainAxisAlignment.center,
      //                   children: [
      //                     CircleAvatar(
      //                       backgroundColor: CustomColors.accentColor2,
      //                       minRadius: 35.0,
      //                       child: SizedBox(
      //                         height: 40.0,
      //                         child: Padding(
      //                           padding: const EdgeInsets.all(0.0),
      //                           child: SvgPicture.asset(
      //                             '$iconLocation/Interior_Design_Consultation.svg',
      //                             colorFilter: const ColorFilter.mode(
      //                               CustomColors.primaryColor,
      //                               BlendMode.srcIn,
      //                             ),
      //                             height: 50.0,
      //                             width: 50.0,
      //                           ),
      //                         ),
      //                       ),
      //                     ),
      //                     Text(
      //                       'AC Services',
      //                       style: TextStyle(
      //                         fontSize: x * 0.03,
      //                         color: Colors.black,
      //                       ),
      //                     ),
      //                   ],
      //                 ),
      //               ),
      //             );
      //           });
      //     } else {
      //       return Center(
      //         child: SizedBox(
      //           width: x * 0.9, // Adjust the width factor as needed
      //           child: const LinearProgressIndicator(
      //             color: CustomColors.primaryColor,
      //           ),
      //         ),
      //       );
      //     }
      //   },
      // ),

      // child: Center(
      //   child: ListView.builder(
      //     itemCount: widget.serviceCategory.length,
      //     itemBuilder: (context, index) {
      //       return SingleChildScrollView(
      //         scrollDirection: Axis.horizontal,
      //         child: Row(
      //           children: [
      //             Text(
      //               'as${widget.serviceCategory[index]!.categoryName}',
      //             ),
      //             // InkWell(
      //             //   onTap: () {},
      //             //   child: Padding(
      //             //     padding: const EdgeInsets.symmetric(
      //             //       horizontal: 10.0,
      //             //       vertical: 7.0,
      //             //     ),
      //             //     child: Column(
      //             //       mainAxisAlignment: MainAxisAlignment.center,
      //             //       children: [
      //             //         CircleAvatar(
      //             //           minRadius: 37.0,
      //             //           backgroundColor: Colors.grey.shade400,
      //             //           child: CircleAvatar(
      //             //             backgroundColor: CustomColors.accentColor2,
      //             //             minRadius: 35.0,
      //             //             child: SizedBox(
      //             //               height: 40.0,
      //             //               child: Padding(
      //             //                 padding: const EdgeInsets.all(0.0),
      //             //                 child: SvgPicture.asset(
      //             //                   '$iconLocation/Interior_Design_Consultation.svg',
      //             //                   colorFilter: const ColorFilter.mode(
      //             //                     CustomColors.primaryColor,
      //             //                     BlendMode.srcIn,
      //             //                   ),
      //             //                   height: 50.0,
      //             //                   width: 50.0,
      //             //                 ),
      //             //               ),
      //             //             ),
      //             //           ),
      //             //         ),
      //             //         const SizedBox(height: 5.0),
      //             //         Text(
      //             //           'as${widget.serviceCategory[index]!.categoryName}',
      //             //           style: TextStyle(
      //             //             fontSize: x * 0.03,
      //             //             color: Colors.black,
      //             //           ),
      //             //         ),
      //             //       ],
      //             //     ),
      //             //   ),
      //             // ),
      //             // *--------------------
      //           ],
      //         ),
      //       );
      //     },
      //   ),
      // ));
