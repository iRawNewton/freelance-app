import 'package:flutter/material.dart';
import '../../../../resources/constants/colors.dart';
import '../../../../resources/widgets/text_widget.dart';

class SelectService extends StatefulWidget {
  const SelectService({super.key});

  @override
  State<SelectService> createState() => _SelectServiceState();
}

class _SelectServiceState extends State<SelectService> {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      title: const Align(
        alignment: Alignment.topCenter,
        child: CustomText(
          title: 'Select a service',
          size: 20.0,
          color: CustomColors.primaryTextColor,
          weight: FontWeight.bold,
        ),
      ),
      children: [
        const Divider(),
        SimpleDialogOption(
          onPressed: () {
            // Navigator.push(
            //   context,
            //   MaterialPageRoute(
            //     builder: (context) =>
            //         // PostServiceFreelance()
            //         const FreelancePost(),
            //   ),
            // ); // Return the chosen option
          },
          child: const CustomText(
            title: '1. Freelancing',
            size: 16.0,
            color: CustomColors.primaryTextColor,
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, "Option 2"); // Return the chosen option
          },
          child: const CustomText(
            title: '2. Post a Service',
            size: 16.0,
            color: CustomColors.primaryTextColor,
          ),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context, "Option 3"); // Return the chosen option
          },
          child: const CustomText(
            title: '3. Post a JOB',
            size: 16.0,
            color: CustomColors.primaryTextColor,
          ),
        ),
      ],
    );
  }
}
