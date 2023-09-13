import 'package:flutter/material.dart';
import 'package:freelance_app/resources/widgets/buttons.dart';

import '../../../resources/constants/colors.dart';
import '../../../resources/widgets/appbar.dart';
import '../../../resources/widgets/text_widget.dart';
import '../../global/checkout/widget/text_field.dart';

class PostServiceFreelance extends StatefulWidget {
  const PostServiceFreelance({super.key});

  @override
  State<PostServiceFreelance> createState() => _PostServiceFreelanceState();
}

class _PostServiceFreelanceState extends State<PostServiceFreelance> {
  int currentStep = 0;
  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  // controllers
  final TextEditingController _title = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _subCategory = TextEditingController();
  final TextEditingController _tags = TextEditingController();

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
        // step 1

        /* ------------------------------------------------ */
        /* overview */
        /* ------------------------------------------------ */
        Step(
          state: currentStep > 0 ? StepState.complete : StepState.editing,
          isActive: currentStep >= 0,
          title: const CustomText(
            title: 'Overview',
            size: 18.0,
            color: CustomColors.primaryTextColor,
            weight: FontWeight.bold,
          ),
          content: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // title

                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Title',
                  controller: _title,
                  hintText: '',
                  isImp: true,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 24.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CheckoutFormWidget(
                      width: 0.36,
                      controller: _category,
                      label: 'Category',
                      hintText: 'Category',
                      isImp: true,
                      textInputType: TextInputType.name,
                    ),
                    CheckoutFormWidget(
                      width: 0.36,
                      controller: _subCategory,
                      label: 'Sub Category',
                      hintText: 'Sub Category',
                      isImp: true,
                      textInputType: TextInputType.name,
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Search tags',
                  controller: _tags,
                  hintText: '#webdeveloper, #contentwriter',
                  isImp: true,
                  textInputType: TextInputType.name,
                ),
              ],
            ),
          ),
        ),

        // step 2
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.editing,
          isActive: currentStep >= 1,
          title: const CustomText(
            title: 'Requirements',
            size: 18.0,
            color: CustomColors.primaryTextColor,
            weight: FontWeight.bold,
          ),
          content: Form(
            key: _formKey1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Application Deadline Date',
                  controller: _tags,
                  hintText: 'hintText',
                  isImp: true,
                  textInputType: TextInputType.emailAddress,
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3),
                        itemBuilder: (context, index) {
                          return const Row(
                            children: [],
                          );
                        });
                  },
                )
              ],
            ),
          ),
        ),
      ];
}
