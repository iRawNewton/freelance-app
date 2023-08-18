import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/dev/screens/user/profile_info/bottom_sheet.dart';
import 'package:freelance_app/dev/ui_global/buttons.dart';

import '../../../../res/constants/colors.dart';
import '../../../ui_global/appbar.dart';
import '../../../ui_global/text_widget.dart';
import '../../checkout/widget/text_field.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _formKey = GlobalKey<FormState>();
  // controllers
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _company = TextEditingController();
  final TextEditingController _country = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            TopAppBar(
              onTap: () {},
            ),
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
                      title: 'User Information',
                      size: 18.0,
                      color: CustomColors.primaryTextColor,
                      weight: FontWeight.bold,
                    ),

                    /* ------------------------------------------------ */
                    /* personal information */
                    /* ------------------------------------------------ */
                    const SizedBox(height: 14.0),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(
                            title: 'Personal Information',
                            size: 18.0,
                            color: CustomColors.primaryTextColor,
                            weight: FontWeight.bold,
                          ),
                          const SizedBox(height: 40.0),

                          // display picture
                          Column(
                            children: [
                              Align(
                                alignment: Alignment.topCenter,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      maxRadius: 50.0,
                                      backgroundColor: Colors.grey,
                                      child: ClipOval(
                                        child: SizedBox(
                                          width:
                                              140.0, // Set a fixed width and height
                                          height: 140.0,
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                'https://shorturl.at/elV34',
                                            placeholder: (context, url) =>
                                                const CircularProgressIndicator(),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 20.0),
                                    CustomButton(
                                      color: CustomColors.info,
                                      title: 'Update Picture',
                                      textColor: Colors.white,
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return const UpdateProfileBottomSheet();
                                          },
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 40.0),

                          // first name and last name
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
                            label: 'Display Name',
                            controller: _company,
                            hintText: '',
                            isImp: true,
                            textInputType: TextInputType.name,
                          ),
                          const SizedBox(height: 24.0),
                          CheckoutFormWidget(
                            width: 1.0,
                            label: 'Bio',
                            controller: _country,
                            hintText: 'Highlight your expertise and experience',
                            isImp: true,
                            textInputType: TextInputType.name,
                            maxLines: 5,
                          ),
                          const SizedBox(height: 24.0),

                          // const SizedBox(height: 24.0),
                          // CheckoutFormWidget(
                          //   width: 1.0,
                          //   label: 'Phone',
                          //   controller: _phn,
                          //   hintText: '+1 (213) 425 6693',
                          //   isImp: true,
                          //   textInputType: TextInputType.number,
                          // ),
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
