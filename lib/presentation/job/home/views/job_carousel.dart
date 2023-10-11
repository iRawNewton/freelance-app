import 'package:neumorphic_ui/neumorphic_ui.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../resources/widgets/buttons.dart';
import '../../../../resources/widgets/text_widget.dart';

class JobCarousel extends StatefulWidget {
  const JobCarousel({
    super.key,
    required this.color,
    required this.jobType,
  });
  final Color color;
  final String jobType;

  @override
  State<JobCarousel> createState() => _JobCarouselState();
}

class _JobCarouselState extends State<JobCarousel> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ^ height space
          const SizedBox(height: 25.0),
          Container(
            // height: 200.0,
            width: MediaQuery.sizeOf(context).width * 0.9,
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 2,
                  // offset: Offset(0, 1),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ^ logo & country name
                  Row(
                    children: [
                      Container(
                        height: 80.0,
                        width: 80.0,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.grey.shade300,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Neumorphic(
                            child: Image.network(
                                'https://htmldemo.net/finate/finate/assets/img/companies/1.webp'),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 14.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomJobText(
                              title: 'Darkento Ltd.',
                              size: 18.0,
                              color: JobCustomColors.textColor,
                              weight: FontWeight.w500,
                            ),
                            SizedBox(height: 5.0),
                            CustomJobText(
                              title: 'New York, USA',
                              size: 14.0,
                              color: Color(0xff656565),
                              weight: FontWeight.w500,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  // ^ height space
                  const SizedBox(height: 20.0),

                  // ^ title & type
                  const CustomJobText(
                    title: 'Front-End Developer',
                    size: 18.0,
                    color: JobCustomColors.textColor,
                    weight: FontWeight.w600,
                  ),
                  CustomJobText(
                    title: widget.jobType,
                    size: 14.0,
                    color: widget.color,
                    weight: FontWeight.w500,
                  ),

                  // ^ skills
                  const SizedBox(height: 20.0),
                  const CustomJobText(
                    title: 'CSS3, HTML5, Javascript, Bootstrap, Jquery',
                    size: 14.0,
                    color: JobCustomColors.textColor3,
                    weight: FontWeight.w500,
                  ),

                  // ^ price and button
                  const SizedBox(height: 15.0),
                  Row(
                    children: [
                      const CustomJobText(
                        title: '\$5000',
                        size: 18.0,
                        color: JobCustomColors.textColor,
                        weight: FontWeight.w600,
                      ),
                      const CustomJobText(
                        title: '/month',
                        size: 14.0,
                        color: JobCustomColors.textColor,
                      ),
                      const Spacer(),
                      CustomButton(
                          color: JobCustomColors.green,
                          title: 'Apply Now',
                          textColor: Colors.white,
                          onPressed: () {}),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
