import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BasicPlan extends StatefulWidget {
  const BasicPlan({super.key});

  @override
  State<BasicPlan> createState() => _BasicPlanState();
}

class _BasicPlanState extends State<BasicPlan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Starter',
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                '\$4342',
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            'One screen UI or UX design for your mobile or web page | Eye Catchy & Modern.',
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

class StandardPlan extends StatefulWidget {
  const StandardPlan({super.key});

  @override
  State<StandardPlan> createState() => _StandardPlanState();
}

class _StandardPlanState extends State<StandardPlan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Standard',
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                '\$4342',
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            'Three screen UI or UX design for your mobile or web page | Eye Catchy & Modern.',
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

class PremiumPlan extends StatefulWidget {
  const PremiumPlan({super.key});

  @override
  State<PremiumPlan> createState() => _PremiumPlanState();
}

class _PremiumPlanState extends State<PremiumPlan> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Premium',
                style: GoogleFonts.roboto(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Text(
                '\$4342',
                style: GoogleFonts.roboto(
                  fontSize: 20.0,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Text(
            'Seven screen UI or UX design for your mobile or web page | Eye Catchy & Modern.',
            style: GoogleFonts.roboto(
              fontSize: 14.0,
            ),
            textAlign: TextAlign.justify,
          ),
          const Row(
            children: [
              Row(
                children: [
                  Icon(Icons.schedule),
                  Text('5 Days Estimated Delivery')
                ],
              ),
              Row(
                children: [Icon(Icons.sync), Text('5 Revision')],
              ),
            ],
          )
        ],
      ),
    );
  }
}
