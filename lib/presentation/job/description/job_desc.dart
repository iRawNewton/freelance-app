import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:freelance_app/presentation/job/description/views/appbar.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/widgets/buttons.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';

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
            // ^ ********************************
            // ^ appbar starts
            // ^ ********************************
            const SizedBox(height: 15.0),
            const CustomJobAppBar(),
            const SizedBox(height: 15.0),
            // ^ ********************************
            // ^ appbar ends
            // ^ ********************************

            // ^ ********************************
            // ^ banner starts
            // ^ ********************************
            Container(
              width: double.infinity,
              color: const Color(0xff081721),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 30.0),
                    // ^ job type | full time| Part time| Remote
                    SizedBox(
                      width: 100.0,
                      height: 30.0,
                      child: CustomButton(
                        color: const Color(0xff7BBD15),
                        title: 'Full-time',
                        textColor: Colors.white,
                        titleSize: 12.0,
                        onPressed: () {},
                      ),
                    ),

                    // ^ job title
                    const SizedBox(height: 10.0),
                    const CustomJobText(
                      title: 'Front-End Developer',
                      size: 24.0,
                      color: Color(0xffd7dde2),
                      weight: FontWeight.bold,
                    ),

                    // ^ location & ratings
                    const SizedBox(height: 10.0),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on,
                          color: Color(0xffd7dde2),
                        ),
                        const CustomJobText(
                          title: 'California, US',
                          size: 14.0,
                          color: Color(0xffd7dde2),
                        ),
                        const SizedBox(width: 40.0),
                        RatingBar.builder(
                          initialRating: 3,
                          minRating: 1,
                          direction: Axis.horizontal,
                          allowHalfRating: false,
                          itemCount: 5,
                          itemSize: 15.0,
                          itemPadding:
                              const EdgeInsets.symmetric(horizontal: 2.0),
                          itemBuilder: (context, _) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          unratedColor: const Color(0xffd7dde2),
                          onRatingUpdate: (rating) {
                            // print(rating);
                          },
                        ),
                        const CustomJobText(
                          title: '4.6',
                          size: 14.0,
                          color: Color(0xffF8F9FA),
                        ),
                      ],
                    ),

                    // ^ description
                    const SizedBox(height: 20.0),
                    const CustomJobText(
                      title:
                          'We are looking for a experienced Senior Front-End Developer with an advanced level of english to design UI/UX interface for web and mobile apps.',
                      size: 14.0,
                      color: Color(0xffd7dde2),
                    ),

                    // ^ apply button
                    const SizedBox(height: 20.0),
                    CustomButton(
                      color: JobCustomColors.green,
                      title: 'Apply',
                      textColor: Colors.white,
                      titleSize: 16.0,
                      weight: FontWeight.w500,
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
            // ^ ********************************
            // ^ banner ends
            // ^ ********************************
          ],
        ),
      ),
    );
  }
}
