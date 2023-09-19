import 'package:flutter/material.dart';

import '../../../resources/constants/colors.dart';
import '../../../resources/widgets/text_widget.dart';
// import '../../../services/pick_image.dart';

class UpdateProfileBottomSheet extends StatefulWidget {
  const UpdateProfileBottomSheet({super.key});

  @override
  State<UpdateProfileBottomSheet> createState() =>
      _UpdateProfileBottomSheetState();
}

class _UpdateProfileBottomSheetState extends State<UpdateProfileBottomSheet> {
  void selectPhotoFunc() async {
    // final result = await selectPhoto();
    setState(() {
      // catgPhoto.text = result.fileName;
      // categoryImage = File(result.filePath);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: CustomColors.accentColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Container(
              width: 150.0,
              decoration: BoxDecoration(
                color: const Color(0xffD4EDD9),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton.icon(
                onPressed: () {
                  selectPhotoFunc();
                },
                icon: const Icon(
                  Icons.edit,
                  size: 20.0,
                  color: CustomColors.success,
                ),
                label: const CustomText(
                  title: 'Update',
                  size: 16.0,
                  color: CustomColors.success,
                  weight: FontWeight.w600,
                ),
              ),
            ),
            Container(
              width: 150.0,
              decoration: BoxDecoration(
                color: const Color(0xffF8D7DA),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: TextButton.icon(
                onPressed: () {},
                icon: const Icon(
                  Icons.delete,
                  size: 20.0,
                  color: CustomColors.danger,
                ),
                label: const CustomText(
                  title: 'Delete',
                  size: 16.0,
                  color: CustomColors.primaryTextColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
