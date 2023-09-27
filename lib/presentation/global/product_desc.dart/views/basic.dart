import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/product_model.dart';

// & starter plan
class StarterPlan extends StatelessWidget {
  const StarterPlan({super.key, required this.package});

  final List<Package>? package;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ^ title
              Text(
                package![0].name.toUpperCase(),
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              // ^ price
              Text(
                '\$ ${package![0].price}',
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          // ^ short description
          const SizedBox(height: 20.0),
          Text(
            package![0].description,
            style: GoogleFonts.roboto(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20.0),

          // ^ features
          Text(
            package![0].featureDescription,
            style: GoogleFonts.roboto(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

// & pro plan
class ProPlan extends StatelessWidget {
  const ProPlan({super.key, required this.package});

  final List<Package>? package;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ^ title
              Text(
                package![1].name.toUpperCase(),
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              // ^ price
              Text(
                '\$ ${package![1].price}',
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),

          // ^ short description
          Text(
            package![1].description,
            style: GoogleFonts.roboto(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20.0),

          // ^ features
          Text(
            package![1].featureDescription,
            style: GoogleFonts.roboto(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

class PremiumPlan extends StatelessWidget {
  const PremiumPlan({super.key, required this.package});

  final List<Package>? package;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ^ title
              Text(
                package![2].name.toUpperCase(),
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              // ^ price
              Text(
                '\$ ${package![2].price}',
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          // ^ short description
          const SizedBox(height: 20.0),
          Text(
            package![2].description,
            style: GoogleFonts.roboto(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20.0),

          // ^ features
          Text(
            package![2].featureDescription,
            style: GoogleFonts.roboto(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}

// & standard plan
class StandardPlan extends StatelessWidget {
  const StandardPlan({super.key, required this.package});

  final List<Package>? package;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ^ title
              Text(
                package![0].name.toUpperCase(),
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),

              // ^ price
              Text(
                '\$ ${package![0].price}',
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),

          // ^ short description
          const SizedBox(height: 20.0),
          Text(
            package![0].description,
            style: GoogleFonts.roboto(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20.0),

          // ^ features
          Text(
            package![0].featureDescription,
            style: GoogleFonts.roboto(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
