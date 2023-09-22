import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'exp_event_card.dart';

class CustomTimelineTileExp extends StatelessWidget {
  final bool isFirst, isLast, isPast;
  final String companyName, jobTitle, description, startDate, endDate;
  final IconData iconData;
  const CustomTimelineTileExp({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.isPast,
    required this.companyName,
    required this.jobTitle,
    required this.description,
    required this.startDate,
    required this.endDate,
    required this.iconData,
  });

// companyName
// jobTitle
// description
// startDate
// endDate
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
          EventCardExp(
            iconData: iconData,
            companyName: companyName,
            jobTitle: jobTitle,
            description: description,
            startDate: startDate,
            endDate: endDate,
          ),
        ],
      ),
    );
  }
}
