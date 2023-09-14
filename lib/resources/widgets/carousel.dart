import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../constants/strings.dart';

class CustomCarousel extends StatelessWidget {
  const CustomCarousel({super.key, required this.images});
  final List<Project>? images;

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        CachedNetworkImage(
          imageUrl: '$productImage/${images![0].images.gallery1}',
          fit: BoxFit.fitWidth,
        ),

        CachedNetworkImage(
          imageUrl: '$productImage/${images![0].images.gallery2}',
          fit: BoxFit.fitWidth,
        ),
        //
        CachedNetworkImage(
          imageUrl: '$productImage/${images![0].images.gallery3}',
          fit: BoxFit.fitWidth,
        ),
        (images![0].images.gallery4.isNotEmpty)
            ? CachedNetworkImage(
                imageUrl: '$productImage/${images![0].images.gallery4}',
                fit: BoxFit.fitWidth,
              )
            : const SizedBox(),
        (images![0].images.gallery5.isNotEmpty)
            ? CachedNetworkImage(
                imageUrl: '$productImage/${images![0].images.gallery5}',
                fit: BoxFit.fitWidth,
              )
            : const SizedBox(),
      ],
      options: CarouselOptions(
        aspectRatio: 16 / 9,
        viewportFraction: 0.8,
        initialPage: 0,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        // onPageChanged: () {},
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}
