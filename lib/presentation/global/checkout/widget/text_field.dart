import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../resources/constants/colors.dart';
import '../../../../resources/widgets/text_widget.dart';

class CheckoutFormWidget extends StatefulWidget {
  const CheckoutFormWidget(
      {super.key,
      required this.width,
      required this.label,
      required this.controller,
      required this.hintText,
      this.isImp,
      required this.textInputType,
      this.maxLines,
      this.enabled,
      this.errorText});
  final double width;
  final TextEditingController controller;
  final String label, hintText;
  final bool? isImp;
  final TextInputType textInputType;
  final int? maxLines;
  final bool? enabled;
  final String? errorText;
  @override
  State<CheckoutFormWidget> createState() => _CheckoutFormWidgetState();
}

class _CheckoutFormWidgetState extends State<CheckoutFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              CustomText(
                title: widget.label,
                size: 14.0,
                color: CustomColors.primaryTextColor,
              ),
              const SizedBox(width: 5.0),
              widget.isImp ?? false
                  ? const CustomText(
                      title: '*',
                      size: 14.0,
                      color: Colors.red,
                    )
                  : const SizedBox(),
            ],
          ),
        ),
        const SizedBox(height: 5.0),
        SizedBox(
          width: MediaQuery.sizeOf(context).width * widget.width,
          child: TextFormField(
            controller: widget.controller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return widget.errorText;
              }
              // Add more validation rules if needed
              return null;
            },
            keyboardType: widget.textInputType,
            maxLines: widget.maxLines,
            textCapitalization: TextCapitalization.sentences,
            enabled: widget.enabled ?? true,
            style: GoogleFonts.roboto(
              color: CustomColors.primaryTextColor,
              fontSize: 14.0,
            ),
            cursorColor: CustomColors.primaryTextColor,
            decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 0.0),
              hintText: widget.hintText,
              border: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Color(0xFFE9E9E9),
                  width: 1.0,
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  width: 3.0,
                  color: CustomColors.primaryColor,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
