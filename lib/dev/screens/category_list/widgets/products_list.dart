import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/dimens.dart';

class ProductList extends StatefulWidget {
  const ProductList({
    super.key,
    required this.imgUrl,
    required this.category,
    required this.title,
    this.ratings,
    this.reviews,
    required this.user,
    required this.price,
  });
  final String imgUrl, category, title, user, price;
  final String? ratings, reviews;
  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
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
                  CachedNetworkImage(
                    imageUrl: widget.imgUrl,
                    fit: BoxFit.fitWidth,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: Align(
                      alignment: Alignment.topRight,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.favorite_outline,
                            color: Colors.black87,
                          ),
                        ),
                      ),
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
                    Text(
                      widget.category,
                      style: GoogleFonts.roboto(
                        fontSize: 14.0,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      widget.title,
                      style: GoogleFonts.roboto(
                        fontSize: 18.0,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Colors.amber,
                        ),
                        Text(
                          widget.ratings ?? '0',
                          style: GoogleFonts.roboto(
                              color: Colors.black87, fontSize: 14.0),
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          '(${widget.reviews ?? '0'}) reviews',
                          style: GoogleFonts.roboto(
                              color: Colors.black54, fontSize: 13.0),
                        ),
                      ],
                    ),
                    const Divider(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.account_circle_rounded,
                          ),
                          Text(
                            ' ${widget.user}',
                            style: GoogleFonts.roboto(
                              color: Colors.black54,
                              fontSize: 14.0,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            'Starting at: ',
                            style: GoogleFonts.roboto(
                              color: Colors.black54,
                              fontSize: 14.0,
                            ),
                          ),
                          Text(
                            '\$${widget.price}',
                            style: GoogleFonts.roboto(
                              color: Colors.black54,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
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
