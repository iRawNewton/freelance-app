import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import '../../../../resources/constants/colors.dart';
import '../../../../resources/widgets/text_widget.dart';

class RatingsSection extends StatefulWidget {
  const RatingsSection({super.key});

  @override
  State<RatingsSection> createState() => _RatingsSectionState();
}

class _RatingsSectionState extends State<RatingsSection> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            const Divider(),
            const SizedBox(height: 20.0),
            /* title */
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: CustomText(
                  title: 'Reviews',
                  size: 20.0,
                  color: CustomColors.primaryTextColor,
                  weight: FontWeight.bold,
                ),
              ),
            ),
            /* Rating figures */
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: const Color(0xffFFEDE8),
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  child: Column(
                    children: [
                      CustomText(
                        title: '4.0',
                        size: 35.0,
                        color: Color(0xffE1C03F),
                        weight: FontWeight.bold,
                      ),
                      CustomText(
                        title: '★★★★',
                        size: 15.0,
                        color: Color(0xffE1C03F),
                      ),
                      CustomText(
                        title: '3 ratings',
                        size: 15.0,
                        color: CustomColors.primaryTextColor,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            /* Rating stats */
            const SizedBox(height: 30.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  Row(children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.15,
                      child: const CustomText(
                        title: '5 Star',
                        size: 16.0,
                        color: CustomColors.primaryTextColor,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.70,
                      child: LinearPercentIndicator(
                        animation: true,
                        animateFromLastPercent: true,
                        percent: 0.67,
                        progressColor: Colors.amber,
                      ),
                    ),
                    const CustomText(
                      title: '67%',
                      size: 16.0,
                      color: CustomColors.primaryTextColor,
                    ),
                  ]),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.15,
                        child: const CustomText(
                          title: '4 Star',
                          size: 16.0,
                          color: CustomColors.primaryTextColor,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.70,
                        child: LinearPercentIndicator(
                          animation: true,
                          animateFromLastPercent: true,
                          percent: 0.9,
                          progressColor: Colors.amber,
                        ),
                      ),
                      const CustomText(
                        title: '90%',
                        size: 16.0,
                        color: CustomColors.primaryTextColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.15,
                        child: const CustomText(
                          title: '3 Star',
                          size: 16.0,
                          color: CustomColors.primaryTextColor,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.70,
                        child: LinearPercentIndicator(
                          animation: true,
                          animateFromLastPercent: true,
                          percent: 0.4,
                          progressColor: Colors.amber,
                        ),
                      ),
                      const CustomText(
                        title: '40%',
                        size: 16.0,
                        color: CustomColors.primaryTextColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.15,
                        child: const CustomText(
                          title: '2 Star',
                          size: 16.0,
                          color: CustomColors.primaryTextColor,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.70,
                        child: LinearPercentIndicator(
                          animation: true,
                          animateFromLastPercent: true,
                          percent: 0.75,
                          progressColor: Colors.amber,
                        ),
                      ),
                      const CustomText(
                        title: '75%',
                        size: 16.0,
                        color: CustomColors.primaryTextColor,
                      ),
                    ],
                  ),
                  const SizedBox(height: 10.0),
                  Row(
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.15,
                        child: const CustomText(
                          title: '1 Star',
                          size: 16.0,
                          color: CustomColors.primaryTextColor,
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.70,
                        child: LinearPercentIndicator(
                          animation: true,
                          animateFromLastPercent: true,
                          percent: 0.35,
                          progressColor: Colors.amber,
                        ),
                      ),
                      const CustomText(
                        title: '35%',
                        size: 16.0,
                        color: CustomColors.primaryTextColor,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            /* Comments */
            const SizedBox(height: 25.0),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        child: Icon(
                          Icons.person,
                          color: Colors.white70,
                          size: 40.0,
                        ),
                      ),
                      SizedBox(width: 30.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            title: 'Ali Tufan',
                            size: 14.0,
                            color: CustomColors.primaryTextColor,
                          ),
                          Row(
                            children: [
                              Text(
                                '★',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 16.0,
                                ),
                              ),
                              SizedBox(width: 10.0),
                              CustomText(
                                title: '5.0',
                                size: 14.0,
                                color: CustomColors.primaryTextColor,
                              ),
                              SizedBox(width: 20.0),
                              CustomText(
                                title: 'November 16, 2022',
                                size: 14.0,
                                color: CustomColors.primaryTextColor,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 1.0),
                    child: CustomText(
                      title:
                          'Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.',
                      size: 14.0,
                      color: CustomColors.primaryTextColor,
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
            /* Add a review section */
            const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomText(
                    title: 'Add a review',
                    size: 18.0,
                    color: CustomColors.primaryTextColor,
                    weight: FontWeight.bold,
                  ),
                  const SizedBox(height: 10.0),
                  const CustomText(
                    title: 'Your rating for this listing',
                    size: 14.0,
                    color: CustomColors.secondaryTextColor,
                  ),
                  const SizedBox(height: 10.0),
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: false,
                    itemCount: 5,
                    itemSize: 16.0,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      debugPrint(rating.toString());
                    },
                  ),
                  const SizedBox(height: 10.0),
                  const CustomText(
                    title: 'Your Comment',
                    size: 14.0,
                    color: CustomColors.primaryTextColor,
                    weight: FontWeight.bold,
                  ),
                  /* comment */
                  Container(
                    height: 200.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(
                          color: Colors.black26,
                        )),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Comment',
                          hintStyle: TextStyle(fontSize: 16.0),
                          border: InputBorder.none,
                        ),
                        maxLines: null,
                      ),
                    ),
                  ),

                  /* button */
                  const SizedBox(height: 10.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor: CustomColors.buttonColor,
                    ),
                    onPressed: () {},
                    child: const CustomText(
                      title: 'Submit Review',
                      size: 16.0,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
