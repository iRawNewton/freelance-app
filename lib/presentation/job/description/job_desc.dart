// 081721
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class JobDescription extends StatefulWidget {
  const JobDescription({super.key});

  @override
  State<JobDescription> createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const SizedBox(height: 15.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E5EC), // Background color
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFA3B1C6),
                          offset: Offset(8, 8),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const Spacer(),
                  Container(
                    height: 50.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE0E5EC), // Background color
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Color(0xFFA3B1C6),
                          offset: Offset(8, 8),
                          blurRadius: 12,
                        ),
                      ],
                    ),
                    child: SvgPicture.asset(
                      'lib/resources/assets/icons/menu-strawberry.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: double.infinity,
              color: const Color(0xff081721),
              child: const Column(
                children: [
                  Text('data'),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
