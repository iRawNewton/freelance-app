import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelance_app/presentation/global/checkout/views/apply_coupon.dart';
import 'package:freelance_app/presentation/global/checkout/widget/text_field.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../resources/constants/strings.dart';

class Checkout extends StatefulWidget {
  const Checkout({super.key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final _formKey = GlobalKey<FormState>();
  // controllers
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _company = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _street1 = TextEditingController();
  final TextEditingController _street2 = TextEditingController();
  final TextEditingController _town = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _phn = TextEditingController();
  final TextEditingController _email = TextEditingController();
  // static const List<String> _kOptions = <String>[
  //   'Australia',
  //   'India',
  //   'United States of America',
  //   'United Kingdom',
  // ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              toolbarHeight: 70.0,
              leading: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SvgPicture.network(ConstStrings.logoUrl),
              ),
              leadingWidth: 120.0,
              actions: [
                Text(
                  'Login',
                  style: GoogleFonts.lato(
                    fontSize: 14.0,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(width: 25.0),
                const Icon(Icons.menu),
                const SizedBox(width: 8.0),
              ],
            )
          ],
          body: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(),
                    const CustomText(
                      title: 'Checkout',
                      size: 18.0,
                      color: CustomColors.primaryTextColor,
                      weight: FontWeight.bold,
                    ),
                    /* ------------------------------------------------ */
                    /* add coupon */
                    /* ------------------------------------------------ */
                    const ApplyCoupon(),

                    /* ------------------------------------------------ */
                    /* billing details */
                    /* ------------------------------------------------ */
                    const SizedBox(height: 14.0),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            title: 'Billing details',
                            size: 18.0,
                            color: CustomColors.primaryTextColor,
                            weight: FontWeight.bold,
                          ),
                          const SizedBox(height: 12.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CheckoutFormWidget(
                                width: 0.43,
                                controller: _fName,
                                label: 'First Name',
                                hintText: 'First Name',
                                isImp: true,
                                textInputType: TextInputType.name,
                              ),
                              CheckoutFormWidget(
                                width: 0.43,
                                controller: _lName,
                                label: 'Last Name',
                                hintText: 'Last Name',
                                isImp: true,
                                textInputType: TextInputType.name,
                              ),
                            ],
                          ),
                          const SizedBox(height: 24.0),
                          CheckoutFormWidget(
                            width: 1.0,
                            label: 'Company name (optional)',
                            controller: _company,
                            hintText: '',
                            isImp: false,
                            textInputType: TextInputType.name,
                          ),
                          const SizedBox(height: 24.0),
                          CheckoutFormWidget(
                            width: 1.0,
                            label: 'Country / Region',
                            controller: _country,
                            hintText: 'United States of America',
                            isImp: true,
                            textInputType: TextInputType.name,
                          ),
                          const SizedBox(height: 24.0),
                          CheckoutFormWidget(
                            width: 1.0,
                            label: 'Street address',
                            controller: _street1,
                            hintText: 'House number and street name',
                            isImp: true,
                            textInputType: TextInputType.streetAddress,
                          ),
                          const SizedBox(height: 24.0),
                          CheckoutFormWidget(
                            width: 1.0,
                            label: 'Street address 2',
                            controller: _street2,
                            hintText: 'Apartment, suite, unit, etc (optional)',
                            isImp: false,
                            textInputType: TextInputType.streetAddress,
                          ),
                          const SizedBox(height: 24.0),
                          CheckoutFormWidget(
                            width: 1.0,
                            label: 'Town / City',
                            controller: _town,
                            hintText: 'London,UK',
                            isImp: true,
                            textInputType: TextInputType.name,
                          ),
                          const SizedBox(height: 24.0),
                          CheckoutFormWidget(
                            width: 1.0,
                            label: 'State',
                            controller: _state,
                            hintText: '',
                            isImp: true,
                            textInputType: TextInputType.name,
                          ),
                          const SizedBox(height: 24.0),
                          CheckoutFormWidget(
                            width: 1.0,
                            label: 'Phone',
                            controller: _phn,
                            hintText: '+1 (213) 425 6693',
                            isImp: true,
                            textInputType: TextInputType.number,
                          ),
                          const SizedBox(height: 24.0),
                          CheckoutFormWidget(
                            width: 1.0,
                            label: 'Email address',
                            controller: _email,
                            hintText: 'johndoe@gmail.com',
                            isImp: true,
                            textInputType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 24.0),
                          SizedBox(
                            height: 50.0,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: CustomColors.buttonColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: const CustomText(
                                title: 'Proceed to checkout',
                                size: 14.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          const SizedBox(height: 24.0),
                        ],
                      ),
                    ),

                    /* ------------------------------------------------ */
                    /* footer section */
                    /* ------------------------------------------------ */
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
