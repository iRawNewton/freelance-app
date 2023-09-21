import 'package:flutter/material.dart';

import '../../../resources/widgets/text_widget.dart';
import '../../global/checkout/widget/text_field.dart';

class MultiplePricing extends StatefulWidget {
  const MultiplePricing({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.controller3,
    required this.controller4,
    required this.controller5,
    required this.controller6,
    required this.controller7,
    required this.controller8,
    required this.controller9,
  });

  final TextEditingController controller1;
  final TextEditingController controller2;
  final TextEditingController controller3;
  final TextEditingController controller4;
  final TextEditingController controller5;
  final TextEditingController controller6;
  final TextEditingController controller7;
  final TextEditingController controller8;
  final TextEditingController controller9;

  @override
  State<MultiplePricing> createState() => _MultiplePricingState();
}

class _MultiplePricingState extends State<MultiplePricing> {
  Color starterColorText = Colors.white;
  Color proColorText = Colors.black;
  Color premiumColorText = Colors.black;
  Color starterColorTextBg = Colors.blue;
  Color proColorTextBg = Colors.blue.shade50;
  Color premiumColorTextBg = Colors.blue.shade50;

  bool starterForm = true;
  bool proForm = false;
  bool premiumForm = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        const Center(
          child: CustomText(
            title: 'Type: Multiple Pricing',
            size: 18.0,
            color: Colors.black,
            weight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            // starter pro premium
            children: [
              // * starter
              InkWell(
                onTap: () {
                  if (widget.controller1.text.isNotEmpty &&
                      widget.controller2.text.isNotEmpty) {
                    setState(() {
                      starterForm = true;
                      proForm = false;
                      premiumForm = false;
                      starterColorText = Colors.white;
                      starterColorTextBg = Colors.blue;
                    });
                  }
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: starterColorTextBg,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: CustomText(
                      title: 'Starter',
                      size: 20.0,
                      color: starterColorText,
                      // weight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // * pro
              const SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  if (widget.controller1.text.isNotEmpty &&
                      widget.controller2.text.isNotEmpty &&
                      widget.controller3.text.isNotEmpty) {
                    setState(() {
                      starterForm = false;
                      proForm = true;
                      premiumForm = false;
                      proColorText = Colors.white;
                      proColorTextBg = Colors.blue;
                    });
                  }
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: proColorTextBg,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: CustomText(
                      title: 'Pro',
                      size: 20.0,
                      color: proColorText,
                    ),
                  ),
                ),
              ),

              // * premium
              const SizedBox(width: 10.0),
              InkWell(
                onTap: () {
                  if (widget.controller4.text.isNotEmpty &&
                      widget.controller5.text.isNotEmpty &&
                      widget.controller6.text.isNotEmpty) {
                    setState(() {
                      starterForm = false;
                      proForm = false;
                      premiumForm = true;
                      premiumColorText = Colors.white;
                      premiumColorTextBg = Colors.blue;
                    });
                  }
                },
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.3,
                  height: 100.0,
                  decoration: BoxDecoration(
                    color: premiumColorTextBg,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Center(
                    child: CustomText(
                      title: 'Premium',
                      size: 20.0,
                      color: premiumColorText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // ^ starter form
        (starterForm)
            ? Column(
                children: [
                  const SizedBox(height: 20.0),
                  const CustomText(
                    title: 'Starter Package',
                    size: 16.0,
                    color: Colors.black,
                    weight: FontWeight.w500,
                  ),
                  const SizedBox(height: 20.0),
                  CheckoutFormWidget(
                    width: 1.0,
                    label: 'Description',
                    controller: widget.controller1,
                    hintText: 'Description of the pricing type',
                    isImp: true,
                    textInputType: TextInputType.multiline,
                    maxLines: 2,
                    errorText: 'Field cannot be empty',
                  ),
                  const SizedBox(height: 10.0),
                  CheckoutFormWidget(
                    width: 1.0,
                    label: 'Price',
                    controller: widget.controller2,
                    hintText: 'Price in dollars',
                    isImp: true,
                    textInputType: TextInputType.number,
                    maxLines: 1,
                    errorText: 'Field cannot be empty',
                  ),
                  const SizedBox(height: 10.0),
                  CheckoutFormWidget(
                    width: 1.0,
                    label: 'Features',
                    controller: widget.controller3,
                    hintText: 'List all features for the package',
                    isImp: true,
                    textInputType: TextInputType.multiline,
                    maxLines: 1,
                    errorText: 'Field cannot be empty',
                  ),
                ],
              )
            : const SizedBox(),

        // ^ pro form
        (proForm)
            ? Column(
                children: [
                  const SizedBox(height: 20.0),
                  const CustomText(
                    title: 'Pro Package',
                    size: 16.0,
                    color: Colors.black,
                    weight: FontWeight.w500,
                  ),
                  const SizedBox(height: 20.0),
                  CheckoutFormWidget(
                    width: 1.0,
                    label: 'Description',
                    controller: widget.controller4,
                    hintText: 'Description of the pricing type',
                    isImp: true,
                    textInputType: TextInputType.multiline,
                    maxLines: 2,
                    errorText: 'Field cannot be empty',
                  ),
                  const SizedBox(height: 10.0),
                  CheckoutFormWidget(
                    width: 1.0,
                    label: 'Price',
                    controller: widget.controller5,
                    hintText: 'price in dollars',
                    isImp: true,
                    textInputType: TextInputType.number,
                    maxLines: 1,
                    errorText: 'Field cannot be empty',
                  ),
                  const SizedBox(height: 10.0),
                  CheckoutFormWidget(
                    width: 1.0,
                    label: 'Features',
                    controller: widget.controller6,
                    hintText: 'List all features for the package',
                    isImp: true,
                    textInputType: TextInputType.multiline,
                    maxLines: null,
                    errorText: 'Field cannot be empty',
                  ),
                ],
              )
            : const SizedBox(),

        // ^ premium form
        (premiumForm)
            ? Column(
                children: [
                  const SizedBox(height: 20.0),
                  const CustomText(
                    title: 'Premium Package',
                    size: 16.0,
                    color: Colors.black,
                    weight: FontWeight.w500,
                  ),
                  const SizedBox(height: 20.0),
                  CheckoutFormWidget(
                    width: 1.0,
                    label: 'Description',
                    controller: widget.controller7,
                    hintText: 'Description of the pricing type',
                    isImp: true,
                    textInputType: TextInputType.multiline,
                    maxLines: 2,
                    errorText: 'Field cannot be empty',
                  ),
                  const SizedBox(height: 10.0),
                  CheckoutFormWidget(
                    width: 1.0,
                    label: 'Price',
                    controller: widget.controller8,
                    hintText: 'Price in dollars',
                    isImp: true,
                    textInputType: TextInputType.number,
                    maxLines: null,
                    errorText: 'Field cannot be empty',
                  ),
                  const SizedBox(height: 10.0),
                  CheckoutFormWidget(
                    width: 1.0,
                    label: 'Features',
                    controller: widget.controller9,
                    hintText: 'List all features for the package',
                    isImp: true,
                    textInputType: TextInputType.multiline,
                    maxLines: null,
                    errorText: 'Field cannot be empty',
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
