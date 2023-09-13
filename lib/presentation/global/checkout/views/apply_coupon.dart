import 'package:flutter/material.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../resources/widgets/text_widget.dart';

class ApplyCoupon extends StatefulWidget {
  const ApplyCoupon({super.key});

  @override
  State<ApplyCoupon> createState() => _ApplyCouponState();
}

class _ApplyCouponState extends State<ApplyCoupon> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        collapsedBackgroundColor: const Color(0XffF7F6F7),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              title: 'Have a coupon?',
              size: 15.0,
              color: CustomColors.primaryTextColor,
            ),
            CustomText(
              title: 'Click here to enter you code',
              size: 15.0,
              color: CustomColors.buttonColor,
            ),
          ],
        ),
        trailing: const SizedBox(),
        children: [
          const SizedBox(height: 12.0),
          Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey.shade200,
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(
                  10.0,
                )),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14.0,
                vertical: 20.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const CustomText(
                    title: 'If you have a coupon code, please apply it below.',
                    size: 15.0,
                    color: CustomColors.primaryTextColor,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width * 0.35,
                        height: 40.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5.0),
                          border: Border.all(
                            color: Colors.black26,
                            width: 2.0,
                          ),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 15.0, 0, 0),
                          child: TextField(
                            cursorColor: Colors.black54,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Coupon Code',
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColors.buttonColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(
                              10.0,
                            ),
                          ),
                        ),
                        onPressed: () {},
                        child: const CustomText(
                          title: 'Apply Coupon',
                          size: 14.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
