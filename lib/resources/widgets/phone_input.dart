import 'package:flutter/material.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../constants/colors.dart';

class PhoneInput extends StatefulWidget {
  const PhoneInput({
    super.key,
    required this.label,
    required this.controller,
    required this.isImp,
  });
  final TextEditingController controller;
  final String label;
  final bool isImp;
  @override
  State<PhoneInput> createState() => _PhoneInputState();
}

class _PhoneInputState extends State<PhoneInput> {
  final TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CustomText(
              title: widget.label,
              size: 14.0,
              color: CustomColors.primaryTextColor,
            ),
            const SizedBox(width: 5.0),
            widget.isImp
                ? const CustomText(
                    title: '*',
                    size: 14.0,
                    color: Colors.red,
                  )
                : const SizedBox(),
          ],
        ),
        const SizedBox(height: 5.0),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * 1,
          child: InternationalPhoneNumberInput(
            cursorColor: CustomColors.primaryTextColor,
            // initialValue: PhoneNumber(
            //   dialCode: '+1',
            //   isoCode: 'US',
            // ),
            textFieldController: phoneController,
            formatInput: true,
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: const TextStyle(color: Colors.black),
            selectorConfig: const SelectorConfig(
                selectorType: PhoneInputSelectorType.DROPDOWN),
            inputDecoration: const InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
              hintText: 'Contact number',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFE9E9E9),
                  width: 1.0,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3.0,
                  color: CustomColors.primaryColor,
                ),
              ),
            ),

            onInputChanged: (PhoneNumber number) {
              setState(() {
                widget.controller.text = number.phoneNumber!;
              });
            },
            onInputValidated: (bool value) {
              // print(value);
            },
            keyboardType: const TextInputType.numberWithOptions(
                signed: true, decimal: true),
            inputBorder: const OutlineInputBorder(),
            // onSaved: (PhoneNumber number) {
            //   print('On Saved: $number');
            // },
          ),
        ),
      ],
    );
  }
}
