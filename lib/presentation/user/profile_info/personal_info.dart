import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
// import 'package:freelance_app/presentation/user/profile_info/bottom_sheetEXP.dart';
import 'package:freelance_app/res/ui_global/buttons.dart';
import 'package:freelance_app/res/ui_global/phone_input.dart';
import 'package:freelance_app/res/ui_global/tags_textfield.dart';

import '../../../../res/constants/colors.dart';
import '../../../../res/ui_global/appbar.dart';
import '../../../../res/ui_global/text_widget.dart';
import '../../global/checkout/widget/text_field.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
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
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.0),
                    child: CustomText(
                      title: 'User Information',
                      size: 18.0,
                      color: CustomColors.primaryTextColor,
                      weight: FontWeight.bold,
                    ),
                  ),
                  Theme(
                    data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                      primary: CustomColors.buttonColor,
                    )),
                    child: Stepper(
                      controlsBuilder:
                          (BuildContext context, ControlsDetails details) {
                        final isLastStep = currentStep == getSteps().length - 1;
                        return Container(
                          margin: const EdgeInsets.only(top: 50.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: CustomButton(
                                  color: CustomColors.buttonColor,
                                  title: isLastStep ? 'Save' : 'Next',
                                  textColor: Colors.white,
                                  onPressed: () => details.onStepContinue!(),
                                ),
                              ),
                              const SizedBox(
                                width: 15.0,
                              ),
                              if (currentStep != 0)
                                Expanded(
                                  child: CustomButton(
                                    color: CustomColors.danger,
                                    title: 'Cancel',
                                    textColor: Colors.white,
                                    onPressed: () => details.onStepCancel!(),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                      physics: const BouncingScrollPhysics(),
                      currentStep: currentStep,
                      steps: getSteps(),
                      onStepContinue: () {
                        final isLastStep = currentStep == getSteps().length - 1;
                        if (isLastStep) {
                          // submit form
                          debugPrint('Completed');
                        } else {
                          setState(() => currentStep += 1);
                        }
                      },
                      onStepCancel: currentStep == 0
                          ? null
                          : () {
                              setState(() => currentStep -= 1);
                            },
                    ),
                  ),
                  const SizedBox(height: 14.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Step> getSteps() => [
        /* ------------------------------------------------ */
        // Basic information
        /* ------------------------------------------------ */
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 0,
          title: const CustomText(
            title: 'Basic Information',
            size: 18.0,
            color: CustomColors.primaryTextColor,
            weight: FontWeight.bold,
          ),
          content: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                                width: 140.0, // Set a fixed width and height
                                height: 140.0,
                                child: CachedNetworkImage(
                                  imageUrl: 'https://shorturl.at/elV34',
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
                              // showModalBottomSheet<void>(
                              //   context: context,
                              //   builder: (BuildContext context) {
                              //     return const UpdateProfileBottomSheet();
                              //   },
                              // );
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
                      width: 0.36,
                      controller: _fName,
                      label: 'First Name',
                      hintText: 'John',
                      isImp: true,
                      textInputType: TextInputType.name,
                    ),
                    CheckoutFormWidget(
                      width: 0.36,
                      controller: _lName,
                      label: 'Last Name',
                      hintText: 'Doe',
                      isImp: true,
                      textInputType: TextInputType.name,
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),

                // username
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Display Name',
                  controller: _company,
                  hintText: '@johndoe',
                  isImp: true,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 24.0),

                // contact number
                PhoneInput(
                  label: 'Phone',
                  controller: _country,
                  isImp: true,
                ),
                const SizedBox(height: 24.0),

                // short description
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Short Description',
                  controller: _country,
                  hintText: ' Briefly describe yourself and your expertise',
                  isImp: true,
                  textInputType: TextInputType.name,
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),

        /* ------------------------------------------------ */
        //  Skills and Experience
        /* ------------------------------------------------ */
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const CustomText(
            title: 'Contact Information',
            size: 18.0,
            color: CustomColors.primaryTextColor,
            weight: FontWeight.bold,
          ),
          content: Form(
            key: _formKey1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Skills
                const SizedBox(height: 24.0),
                const TagsTextField(label: 'Skills', isImp: true),

                // years of experience
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Experience',
                  controller: _country,
                  hintText: 'Years (in numbers)',
                  isImp: true,
                  textInputType: TextInputType.number,
                  maxLines: 1,
                ),

                // Relevant projects or experience
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Relevant projects or experience',
                  controller: _country,
                  hintText: 'Share any relevant projects or experiences',
                  isImp: false,
                  textInputType: TextInputType.number,
                  maxLines: null,
                ),

                // portfolio images
                // portfolio description
              ],
            ),
          ),
        ),
        // step 3
        /* 
         Services Offered: A detailed list of the specific services the freelancer offers 
         (e.g., logo design, content writing, social media management).
          Project Types: Examples of the types of projects the freelancer excels at 
          (e.g., e-commerce websites, mobile app development).
        
         */
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const CustomText(
            title: 'Specialization',
            size: 18.0,
            color: CustomColors.primaryTextColor,
            weight: FontWeight.bold,
          ),
          content: Form(
            key: _formKey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24.0),
                const TagsTextField(
                  label: 'Services Offered',
                  isImp: true,
                ),
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Project Types',
                  controller: _country,
                  hintText: 'e-commerce, crm...',
                  isImp: true,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                ),
              ],
            ),
          ),
        ),
      ];
}
