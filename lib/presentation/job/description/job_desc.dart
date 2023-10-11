import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:freelance_app/presentation/job/description/views/appbar.dart';
import 'package:freelance_app/presentation/job/description/views/job_details_card.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/widgets/buttons.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';

class JobDescription extends StatefulWidget {
  const JobDescription({super.key});

  @override
  State<JobDescription> createState() => _JobDescriptionState();
}

class _JobDescriptionState extends State<JobDescription> {
  String para1 =
      'Themezhub Web provides equal employment opportunities to all qualified individuals without regard to race, color, religion, sex, gender identity, sexual orientation, pregnancy, age, national origin, physical or mental disability, military or veteran status, genetic information, or any other protected classification. Equal employment opportunity includes, but is not limited to, hiring, training, promotion, demotion, transfer, leaves of absence, and termination. Thynk Web takes allegations of discrimination, harassment, and retaliation seriously, and will promptly investigate when such behavior is reported.';
  String para2 =
      'Our company is seeking to hire a skilled Web Developer to help with the development of our current projects. Your duties will primarily revolve around building software by writing code, as well as modifying software to fix errors, adapt it to new hardware, improve its performance, or upgrade interfaces. You will also be involved in directing system testing and validation procedures, and also working with customers or departments on technical issues including software system design and maintenance.';
  String para3 =
      'We are looking for a Senior Web Developer to build and maintain functional web pages and applications. Senior Web Developer will be leading junior developers, refining website specifications, and resolving technical issues. He/She should have extensive experience building web pages from scratch and in-depth knowledge of at least one of the following programming languages: Javascript, Ruby, or PHP. He/She will ensure our web pages are up and running and cover both internal and customer needs.';

  String req1 =
      'Candidate must have a Bachelors or Masters degree in Computer. (B.tech, Bsc or BCA/MCA)';
  String req2 =
      'Candidate must have a good working knowledge of Javascript and Jquery.';
  String req3 = 'Good knowledge of HTML and CSS is required.';
  String req4 = 'Experience in Word press is an advantage';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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

                      // ^ department and location
                      const SizedBox(height: 30.0),
                      const Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.work_history,
                                color: Colors.white,
                                size: 50.0,
                              ),
                              SizedBox(width: 5.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomJobText(
                                    title: 'Category',
                                    size: 14.0,
                                    color: Color(0xffF8F9FA),
                                  ),
                                  CustomJobText(
                                    title: 'Software',
                                    size: 16.0,
                                    color: Color(0xffF8F9FA),
                                    weight: FontWeight.w700,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_rounded,
                                color: Colors.white,
                                size: 50.0,
                              ),
                              SizedBox(width: 5.0),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CustomJobText(
                                    title: 'Location',
                                    size: 14.0,
                                    color: Color(0xffF8F9FA),
                                  ),
                                  CustomJobText(
                                    title: 'California, USA',
                                    size: 16.0,
                                    color: Color(0xffF8F9FA),
                                    weight: FontWeight.w700,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),

                      // ^ salary
                      const SizedBox(height: 20.0),
                      const Row(
                        children: [
                          Icon(
                            Icons.attach_money_rounded,
                            color: Colors.white,
                            size: 50.0,
                          ),
                          SizedBox(width: 5.0),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomJobText(
                                title: 'Location',
                                size: 14.0,
                                color: Color(0xffF8F9FA),
                              ),
                              CustomJobText(
                                title: 'California, USA',
                                size: 16.0,
                                color: Color(0xffF8F9FA),
                                weight: FontWeight.w700,
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
              // ^ ********************************
              // ^ banner ends
              // ^ ********************************

              // ^ ********************************
              // ^ job details starts
              // ^ ********************************

              const SizedBox(height: 20.0),
              const JobDetailsCard(),
              // ^ ********************************
              // ^ job details ends
              // ^ ********************************
            ],
          ),
        ),
      ),
    );
  }
}
