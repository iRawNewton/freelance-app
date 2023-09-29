import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../models/product_model.dart';
import '../constants/strings.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key, required this.images});
  final List<Project>? images;

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: widget.images![0].images.map((image) {
        return CachedNetworkImage(
          imageUrl: '$productImage/$image',
          fit: BoxFit.fitWidth,
        );
      }).toList(),
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
