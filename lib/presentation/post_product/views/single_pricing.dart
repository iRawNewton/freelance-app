import 'package:flutter/material.dart';

import '../../../resources/widgets/text_widget.dart';
import '../../global/checkout/widget/text_field.dart';

class SinglePricing extends StatefulWidget {
  const SinglePricing({
    super.key,
    required this.controller1,
    required this.controller2,
    required this.controller3,
  });

  final TextEditingController controller1, controller2, controller3;

  @override
  State<SinglePricing> createState() => _SinglePricingState();
}

class _SinglePricingState extends State<SinglePricing> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        const Center(
          child: CustomText(
            title: 'Type: Single Pricing',
            size: 18.0,
            color: Colors.black,
            weight: FontWeight.bold,
          ),
        ),
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
          controller: widget.controller3,
          hintText: 'List all features for the package',
          isImp: true,
          textInputType: TextInputType.multiline,
          maxLines: null,
          errorText: 'Field cannot be empty',
        ),
      ],
    );
  }
}
