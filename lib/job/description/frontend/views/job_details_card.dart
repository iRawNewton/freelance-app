import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../resources/widgets/text_widget.dart';

class JobDetailsCard extends StatefulWidget {
  const JobDetailsCard({
    super.key,
    required this.description,
    required this.requirements,
    required this.responsiblity,
    required this.qualificatonSkill,
  });
  final String description, requirements, responsiblity, qualificatonSkill;

  @override
  State<JobDetailsCard> createState() => _JobDetailsCardState();
}

class _JobDetailsCardState extends State<JobDetailsCard> {
  List requirementList = [];
  List responsiblityList = [];
  List qualificatonSkillList = [];
  @override
  void initState() {
    // & requirements
    List<String> req = widget.requirements.split('\r\n');
    for (String line in req) {
      requirementList.add(line);
    }

    // & responsibility
    List<String> res = widget.responsiblity.split('\r\n');
    for (String line in res) {
      responsiblityList.add(line);
    }

    // & responsibility
    List<String> quaSkill = widget.responsiblity.split('\r\n');
    for (String line in quaSkill) {
      qualificatonSkillList.add(line);
    }

    super.initState();
  }

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
              title: widget.description,
              size: 14.0,
              color: JobCustomColors.textColor,
            ),
            const SizedBox(height: 7.0),

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

            // ^ requirements

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: requirementList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
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
                          title: requirementList[index],
                          size: 14.0,
                          color: const Color.fromRGBO(0, 44, 63, 0.6),
                          textAlign: TextAlign.justify,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),

            // ^ responsibilites

            const SizedBox(height: 30.0),
            const CustomJobText(
              title: 'Responsibilities:',
              size: 16.0,
              color: Colors.black87,
              weight: FontWeight.w800,
            ),

            const SizedBox(height: 10.0),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: responsiblityList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
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
                            title: responsiblityList[index],
                            size: 14.0,
                            color: const Color.fromRGBO(0, 44, 63, 0.6),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  );
                }),

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

            // ^ q and skill
            const SizedBox(height: 10.0),
            ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: qualificatonSkillList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: Row(
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
                            title: qualificatonSkillList[index],
                            size: 14.0,
                            color: const Color.fromRGBO(0, 44, 63, 0.6),
                            textAlign: TextAlign.justify,
                          ),
                        )
                      ],
                    ),
                  );
                }),

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
