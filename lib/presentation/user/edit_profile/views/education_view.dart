import 'package:flutter/material.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/widgets/buttons.dart';

import '../../../../resources/widgets/text_widget.dart';

class EducationDetailsView extends StatefulWidget {
  const EducationDetailsView({
    super.key,
    required this.title,
    required this.degree,
    required this.field,
    required this.grade,
  });
  final String title, degree, field, grade;

  @override
  State<EducationDetailsView> createState() => _EducationDetailsViewState();
}

class _EducationDetailsViewState extends State<EducationDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        leading: const Icon(Icons.school),
        title: CustomText(
          title: widget.title,
          size: 18.0,
          color: Colors.black87,
        ),
        children: [
          const SizedBox(height: 5.0),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              title: 'Degree: ${widget.degree}',
              size: 16.0,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5.0),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              title: 'Field of Study: ${widget.field}',
              size: 16.0,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5.0),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              title: 'Grade/GPA: ${widget.grade}',
              size: 16.0,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            child: CustomButton(
                color: CustomColors.danger,
                title: 'Delete',
                textColor: Colors.white,
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
