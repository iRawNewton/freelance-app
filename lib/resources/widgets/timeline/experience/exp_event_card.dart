import 'package:flutter/material.dart';

import '../../text_widget.dart';

class EventCardExp extends StatelessWidget {
  final String companyName, jobTitle, description, startDate, endDate;
  final IconData iconData;

  const EventCardExp({
    super.key,
    required this.companyName,
    required this.jobTitle,
    required this.description,
    required this.startDate,
    required this.endDate,
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
                title: companyName,
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
                title: jobTitle,
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
                title: description,
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
                title: startDate,
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
                title: endDate,
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
