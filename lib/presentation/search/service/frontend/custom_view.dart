import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../resources/constants/dimens.dart';
import '../../../user/stats/freelance_posted/views/prod_desc_views.dart';

class ServiceSearchResultView extends StatelessWidget {
  const ServiceSearchResultView({
    super.key,
    required this.productId,
    required this.imgUrl,
    required this.category,
    required this.title,
    this.ratings,
    this.reviews,
    required this.user,
    required this.price,
  });
  final String productId, imgUrl, category, title, user, price;
  final String? ratings, reviews;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductPostedDescView(productId: productId),
          ),
        );
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: CustomColors.accentColor,
          borderRadius: BorderRadiusDirectional.circular(10.0),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CachedNetworkImage(
                    imageUrl: imgUrl,
                    fit: BoxFit.fitWidth,
                    height: 200,
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category,
                      style: GoogleFonts.roboto(
                        fontSize: 14.0,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      title,
                      style: GoogleFonts.roboto(
                        fontSize: 18.0,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Text(
                        'Amount \$$price',
                        style: GoogleFonts.roboto(
                          color: Colors.black54,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ServiceSearchResultViewLoading extends StatelessWidget {
  const ServiceSearchResultViewLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenSize.width(context),
      decoration: BoxDecoration(
        // color: const Color(0xffF1FCFA),
        color: Colors.white60,
        borderRadius: BorderRadiusDirectional.circular(10.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    width: double.infinity,
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: const Card(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 12.0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20.0,
                      width: 100.0,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: const Card(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 30.0,
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: const Card(),
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    SizedBox(
                      height: 20.0,
                      width: MediaQuery.sizeOf(context).width * 0.35,
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: const Card(),
                      ),
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 20.0,
                            width: MediaQuery.sizeOf(context).width * 0.35,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: const Card(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
