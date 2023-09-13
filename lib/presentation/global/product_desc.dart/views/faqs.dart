import 'package:flutter/material.dart';
import 'package:freelance_app/resources/constants/colors.dart';

import '../../../../resources/widgets/text_widget.dart';

class ProductFaqs extends StatefulWidget {
  const ProductFaqs({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle;

  @override
  State<ProductFaqs> createState() => _ProductFaqsState();
}

class _ProductFaqsState extends State<ProductFaqs> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        backgroundColor: CustomColors.accentColor,
        trailing: isExpanded
            ? const Icon(
                Icons.add,
                color: Colors.black87,
              )
            : const Icon(
                Icons.remove,
                color: Colors.black87,
              ),
        onExpansionChanged: (value) {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        title: CustomText(
          title: widget.title,
          size: 16.0,
          color: Colors.black87,
        ),
        expandedAlignment: Alignment.topLeft,
        childrenPadding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CustomText(
              title: widget.subtitle,
              size: 14.0,
              color: Colors.black87,
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
