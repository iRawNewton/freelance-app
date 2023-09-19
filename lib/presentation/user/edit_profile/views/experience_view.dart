import 'package:flutter/material.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/resources/widgets/buttons.dart';

import '../../../../resources/widgets/text_widget.dart';

/* 
"experience_id": "1",
"user_id": "18",
"company_name": "Kyptronix LLP",
"job_title": "Flutter Developer",
"start_date": "2023-02-15",
"end_date": null,
"is_current": "1",
"description": "Working as a flutter developer"
*/

class ExpDetailsView extends StatefulWidget {
  const ExpDetailsView({
    super.key,
    required this.companyName,
    required this.jobTitle,
    required this.description,
  });
  final String companyName, jobTitle, description;

  @override
  State<ExpDetailsView> createState() => _ExpDetailsViewState();
}

class _ExpDetailsViewState extends State<ExpDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        leading: const Icon(Icons.business),
        title: CustomText(
          title: widget.companyName,
          size: 18.0,
          color: Colors.black87,
        ),
        children: [
          const SizedBox(height: 5.0),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              title: 'Job Title: ${widget.jobTitle}',
              size: 16.0,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 5.0),
          Align(
            alignment: Alignment.centerLeft,
            child: CustomText(
              title: 'Description: ${widget.description}',
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
