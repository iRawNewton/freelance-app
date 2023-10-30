import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  String res1 = 'Write clean, maintainable and efficient code.';
  String res2 = 'Design robust, scalable and secure features.';
  String res3 =
      'Work on bug fixing, identifying performance issues and improving application performance';
  String res4 = 'Write unit and functional testcases.';

  String qs1 = 'Bachelor\'s degree';
  String qs2 = 'BCA/MCA';
  String qs3 = 'BSC IT/Msc IT';
  String qs4 = 'Or any other equivalent degree';

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

            // ^ ====================================
            // * job requirements
            // ^ ====================================
            const SizedBox(height: 20.0),
            const CustomJobText(
              title: 'Job Requirements',
              size: 20.0,
              color: Colors.black87,
              weight: FontWeight.w800,
            ),
            const SizedBox(height: 10.0),
            const CustomJobText(
              title: 'Requirements:',
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

            const SizedBox(height: 30.0),
            const CustomJobText(
              title: 'Responsibilities:',
              size: 16.0,
              color: Colors.black87,
              weight: FontWeight.w800,
            ),

            // ^ res 1
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
                    title: res1,
                    size: 14.0,
                    color: const Color.fromRGBO(0, 44, 63, 0.6),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),

            // ^ res 2
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
                    title: res2,
                    size: 14.0,
                    color: const Color.fromRGBO(0, 44, 63, 0.6),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),

            // ^ res 3
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
                    title: res3,
                    size: 14.0,
                    color: const Color.fromRGBO(0, 44, 63, 0.6),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),

            // ^ ====================================
            // * Qualifications and Skills
            // ^ ====================================

            const SizedBox(height: 20.0),
            const CustomJobText(
              title: 'Qualifications and Skills',
              size: 20.0,
              color: Colors.black87,
              weight: FontWeight.w800,
            ),
            const SizedBox(height: 10.0),

            // ^ q and s 1
            const SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Color.fromRGBO(0, 44, 63, 0.6),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: CustomJobText(
                    title: qs1,
                    size: 14.0,
                    color: const Color.fromRGBO(0, 44, 63, 0.6),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),

            // ^ q and s 2
            const SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Color.fromRGBO(0, 44, 63, 0.6),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: CustomJobText(
                    title: qs2,
                    size: 14.0,
                    color: const Color.fromRGBO(0, 44, 63, 0.6),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),

            // ^ q and s 3
            const SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Color.fromRGBO(0, 44, 63, 0.6),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: CustomJobText(
                    title: qs3,
                    size: 14.0,
                    color: const Color.fromRGBO(0, 44, 63, 0.6),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),

            // ^ q and s 4
            const SizedBox(height: 10.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Color.fromRGBO(0, 44, 63, 0.6),
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.7,
                  child: CustomJobText(
                    title: qs4,
                    size: 14.0,
                    color: const Color.fromRGBO(0, 44, 63, 0.6),
                    textAlign: TextAlign.justify,
                  ),
                )
              ],
            ),

            const SizedBox(height: 30.0),

            // ^ divider
            const Divider(),
            const SizedBox(height: 10.0),
            Row(
              children: [
                const CustomJobText(
                  title: 'Share This Job:',
                  size: 16.0,
                  color: Colors.black,
                  weight: FontWeight.bold,
                ),
                const SizedBox(width: 15.0),
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SvgPicture.asset(
                      'lib/resources/assets/icons/facebook.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.black54,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SvgPicture.asset(
                      'lib/resources/assets/icons/instagram.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.black54,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 15.0),
                Container(
                  height: 30.0,
                  width: 30.0,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: SvgPicture.asset(
                      'lib/resources/assets/icons/twitter.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.black54,
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
