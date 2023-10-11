import 'package:flutter/material.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../resources/widgets/text_widget.dart';

class JobDetailsCard extends StatefulWidget {
  const JobDetailsCard({super.key});

  @override
  State<JobDetailsCard> createState() => _JobDetailsCardState();
}

class _JobDetailsCardState extends State<JobDetailsCard> {
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
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.97,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10), // Rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ^ job description
            const CustomJobText(
              title: 'Job Description',
              size: 20.0,
              color: Colors.black87,
              weight: FontWeight.w800,
            ),
            const SizedBox(height: 15.0),
            CustomJobText(
              title: para1,
              size: 14.0,
              color: JobCustomColors.textColor,
            ),
            const SizedBox(height: 7.0),
            CustomJobText(
              title: para2,
              size: 14.0,
              color: JobCustomColors.textColor,
            ),
            const SizedBox(height: 7.0),
            CustomJobText(
              title: para3,
              size: 14.0,
              color: JobCustomColors.textColor,
            ),

            // ^ job requirements
            const SizedBox(height: 20.0),
            const CustomJobText(
              title: 'Job Requirements',
              size: 20.0,
              color: Colors.black87,
              weight: FontWeight.w800,
            ),
            const SizedBox(height: 10.0),
            const CustomJobText(
              title: 'Requirements',
              size: 16.0,
              color: Colors.black87,
              weight: FontWeight.w800,
            ),
            const SizedBox(height: 15.0),

            // ^ req 1

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.radio_button_checked,
                  color: Color.fromRGBO(0, 44, 63, 0.6),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: CustomJobText(
                    title: req1,
                    size: 14.0,
                    color: const Color.fromRGBO(0, 44, 63, 0.6),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),

            // ^ req 2
            const SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.radio_button_checked,
                  color: Color.fromRGBO(0, 44, 63, 0.6),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: CustomJobText(
                    title: req2,
                    size: 14.0,
                    color: const Color.fromRGBO(0, 44, 63, 0.6),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),

            // ^ req 3
            const SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.radio_button_checked,
                  color: Color.fromRGBO(0, 44, 63, 0.6),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: CustomJobText(
                    title: req3,
                    size: 14.0,
                    color: const Color.fromRGBO(0, 44, 63, 0.6),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),

            // ^ req 4
            const SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.radio_button_checked,
                  color: Color.fromRGBO(0, 44, 63, 0.6),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: CustomJobText(
                    title: req4,
                    size: 14.0,
                    color: const Color.fromRGBO(0, 44, 63, 0.6),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),

            // ^
          ],
        ),
      ),
    );
  }
}