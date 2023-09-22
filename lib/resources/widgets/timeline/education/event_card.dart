import 'package:flutter/material.dart';

import '../../text_widget.dart';

class EventCard extends StatelessWidget {
  final String instituteName, degree, year, grade, studyField;
  final IconData iconData;

  const EventCard({
    super.key,
    required this.instituteName,
    required this.degree,
    required this.year,
    required this.grade,
    required this.studyField,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    Color accentColor = Colors.orange.shade600;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            children: [
              SizedBox(
                width: 20.0,
                child: Icon(
                  iconData,
                  color: accentColor,
                ),
              ),
              const SizedBox(width: 20.0),
              CustomText(
                title: instituteName,
                size: 16.0,
                weight: FontWeight.bold,
                color: Colors.black87,
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            children: [
              const SizedBox(
                width: 40.0,
              ),
              CustomText(
                title: degree,
                size: 16.0,
                // fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ],
          ),
          Row(
            children: [
              const SizedBox(
                width: 40.0,
              ),
              CustomText(
                title: year,
                size: 16.0,
                // fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              const SizedBox(
                width: 40.0,
              ),
              CustomText(
                title: grade,
                size: 16.0,
                // fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ],
          ),
          const SizedBox(height: 5.0),
          Row(
            children: [
              const SizedBox(
                width: 40.0,
              ),
              CustomText(
                title: studyField,
                size: 16.0,
                // fontWeight: FontWeight.bold,
                color: Colors.black54,
              ),
            ],
          ),
          const SizedBox(height: 15.0),
        ],
      ),
    );
  }
}
