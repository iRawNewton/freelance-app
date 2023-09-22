import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'event_card.dart';

class CustomTimelineTile extends StatelessWidget {
  final bool isFirst, isLast, isPast;
  final String instituteName, degree, year, grade, studyField;
  final IconData iconData;
  const CustomTimelineTile({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.instituteName,
    required this.degree,
    required this.year,
    required this.grade,
    required this.studyField,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    const Color lineColor = Color(0xffeb595f);
    const Color dotColor = Color(0xffeb595f);

    return TimelineTile(
      isFirst: isFirst,
      // isLast: isLast,
      alignment: TimelineAlign.start,

      // * decorate line
      beforeLineStyle: const LineStyle(
        thickness: 2,
        color: lineColor,
      ),
      // * decorate the icon
      indicatorStyle: IndicatorStyle(
        indicatorXY: 0,
        width: 10.0,
        color: lineColor,
        iconStyle: IconStyle(
          iconData: Icons.circle,
          fontSize: 16.0,
          color: dotColor,
        ),
      ),

      endChild: Column(
        children: [
          EventCard(
            iconData: iconData,
            instituteName: instituteName,
            degree: degree,
            year: year,
            grade: grade,
            studyField: studyField,
          ),
        ],
      ),
    );
  }
}
