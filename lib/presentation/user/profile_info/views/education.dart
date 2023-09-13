import 'package:flutter/material.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../resources/widgets/text_widget.dart';

class EducationView extends StatefulWidget {
  const EducationView({
    super.key,
    required this.institute,
    required this.degree,
    required this.duration,
    required this.grade,
    required this.studyField,
  });
  final String institute, degree, duration, grade, studyField;
  @override
  State<EducationView> createState() => _EducationViewState();
}

class _EducationViewState extends State<EducationView> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ^ institute name
          Row(
            children: [
              const SizedBox(
                width: 30.0,
                child: Icon(
                  Icons.school,
                  color: CustomColors.primaryTextColor,
                ),
              ),
              const SizedBox(width: 20.0),
              Column(
                children: [
                  CustomText(
                    title: widget.institute,
                    size: 16.0,
                    color: Colors.black87,
                    weight: FontWeight.bold,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 12.0),

          // ^ degree
          Row(
            children: [
              const SizedBox(width: 50.0),
              CustomText(
                title: widget.degree,
                size: 14.0,
                color: Colors.black87,
              ),
            ],
          ),

          // ^ study field
          Row(
            children: [
              const SizedBox(width: 50.0),
              CustomText(
                title: widget.studyField,
                size: 14.0,
                color: Colors.black54,
              ),
            ],
          ),
          const SizedBox(height: 6.0),

          // ^ duration
          Row(
            children: [
              const SizedBox(width: 50.0),
              CustomText(
                title: widget.duration,
                size: 14.0,
                color: Colors.black87,
              ),
            ],
          ),
          const SizedBox(height: 6.0),

          // ^ grade
          Row(
            children: [
              const SizedBox(width: 50.0),
              CustomText(
                title: widget.grade,
                size: 14.0,
                color: Colors.black87,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
