import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousel extends StatefulWidget {
  const CustomCarousel({super.key});

  @override
  State<CustomCarousel> createState() => _CustomCarouselState();
}

class _CustomCarouselState extends State<CustomCarousel> {
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        CachedNetworkImage(
          imageUrl:
              'https://demoapus1.com/freeio/wp-content/uploads/2022/11/service12-495x370.jpg',
          fit: BoxFit.fitWidth,
        ),
        CachedNetworkImage(
          imageUrl:
              'https://demoapus1.com/freeio/wp-content/uploads/elementor/thumbs/service10-py2khwd9b307cpru7zo4vne3y7r9bf2fwt3v6dbncw.jpg',
          fit: BoxFit.fitWidth,
        ),
        //
        CachedNetworkImage(
          imageUrl:
              'https://demoapus1.com/freeio/wp-content/uploads/elementor/thumbs/service8-py2khwd9b307cpru7zo4vne3y7r9bf2fwt3v6dbncw.jpg',
          fit: BoxFit.fitWidth,
        ),
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
