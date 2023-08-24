import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:freelance_app/UI/user/profile_info/bottom_sheet.dart';
import 'package:freelance_app/res/ui_global/buttons.dart';
import 'package:freelance_app/res/ui_global/phone_input.dart';

import '../../../../res/constants/colors.dart';
import '../../../../res/ui_global/appbar.dart';
import '../../../../res/ui_global/text_widget.dart';
import '../../services/put_remote_services.dart';
import '../global/checkout/widget/text_field.dart';

class FreelancePost extends StatefulWidget {
  const FreelancePost({super.key});

  @override
  State<FreelancePost> createState() => _FreelancePostState();
}

class _FreelancePostState extends State<FreelancePost> {
  // variables
  int currentStep = 0;

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();

  // controllers
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _countryValue = TextEditingController();
  final TextEditingController _stateValue = TextEditingController();
  final TextEditingController _cityValue = TextEditingController();
  final TextEditingController _profileDesc = TextEditingController();
  // final TextEditingController _category = TextEditingController();
  // final TextEditingController _subCategory = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _deliveryTime = TextEditingController();
  final TextEditingController _productDescrition = TextEditingController();
  final TextEditingController _serviceProvided = TextEditingController();
  final TextEditingController _toolTechUsed = TextEditingController();
  // final TextEditingController _images = TextEditingController();
  final TextEditingController _faq1 = TextEditingController();
  final TextEditingController _faq2 = TextEditingController();
  final TextEditingController _faq3 = TextEditingController();
  final TextEditingController _faq4 = TextEditingController();
  final TextEditingController _faq5 = TextEditingController();

  final List<String> _dropdownItems = [
    'Categories',
    'Design & Creative',
    'Digital Marketing',
    'Programming & Tech',
  ];

  // functions
  Future<String> basicInfo(
    username,
    email,
    phone,
    passwordHash,
    firstName,
    lastName,
    languageProficiency,
    residenceCountry,
    residenceState,
    residenceCity,
    userBio,
    profilePictureUrl,
  ) async {
    var response = await PutRemoteService().putUsers(
        username,
        email,
        phone,
        passwordHash,
        firstName,
        lastName,
        languageProficiency,
        residenceCountry,
        residenceState,
        residenceCity,
        userBio,
        profilePictureUrl);
    print(response);
    if (response == '') {
      // do something
    }
    return response;
  }

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

                        switch (currentStep) {
                          case 0:
                            // do something for step 0

                            if (_formKey.currentState!.validate()) {
                              basicInfo(
                                _username.text,
                                'gaurabroy.kyptronix@gmail.com',
                                _phoneNumber.text,
                                '_passwordHash',
                                _fName.text,
                                _lName.text,
                                '_languageProficiency',
                                _countryValue.text,
                                _stateValue.text,
                                _cityValue.text,
                                _profileDesc.text,
                                '_profilePictureUrl',
                              );
                            } else {}

                            break;
                          case 1:
                            // do something for step 1
                            break;
                          case 2:
                            // do something for step 2
                            break;
                          case 3:
                            // do something for step 3
                            break;
                          case 4:
                            // do something for step 4
                            break;
                          default:
                          // Handle cases not covered by the above steps
                        }

                        // -----------------------------------------------------------
                        if (isLastStep) {
                          // submit form
                          debugPrint('Completed');
                        }
                        //  else {
                        //   setState(() => currentStep += 1);
                        // }
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
                  controller: _username,
                  hintText: '@johndoe',
                  isImp: true,
                  textInputType: TextInputType.name,
                ),
                const SizedBox(height: 24.0),

                // contact number
                PhoneInput(
                  label: 'Phone',
                  controller: _phoneNumber,
                  isImp: true,
                ),
                const SizedBox(height: 24.0),

                // country
                SelectState(
                  onCountryChanged: (value) {
                    setState(() {
                      _countryValue.text = value;
                    });
                  },
                  onStateChanged: (value) {
                    setState(() {
                      _stateValue.text = value;
                    });
                  },
                  onCityChanged: (value) {
                    setState(() {
                      _cityValue.text = value;
                    });
                  },
                ),
                // short description
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Short Description',
                  controller: _profileDesc,
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
            title: 'Product Information',
            size: 18.0,
            color: CustomColors.primaryTextColor,
            weight: FontWeight.bold,
          ),
          content: Form(
            key: _formKey1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // categories
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    elevation: 0,
                    value: _dropdownItems[0],
                    // value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        // _selectedItem = newValue!;
                      });
                    },
                    items: _dropdownItems.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(height: 24.0),

                // sub categories
                Padding(
                  padding: const EdgeInsets.only(left: 0.0),
                  child: DropdownButton<String>(
                    isExpanded: true,
                    elevation: 0,
                    value: _dropdownItems[0],
                    // value: _selectedItem,
                    onChanged: (String? newValue) {
                      setState(() {
                        // _selectedItem = newValue!;
                      });
                    },
                    items: _dropdownItems.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),

                // product title
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Title',
                  controller: _title,
                  hintText: 'Enter the project title',
                  isImp: true,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                ),

                // project minimum delivery time
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Project minimum delivery time',
                  controller: _deliveryTime,
                  hintText: 'Enter the minimum delivery time (in days)',
                  isImp: true,
                  textInputType: TextInputType.number,
                  maxLines: 1,
                ),

                // project description
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Description',
                  controller: _productDescrition,
                  hintText: 'Describe your product in detail',
                  isImp: true,
                  textInputType: TextInputType.multiline,
                  maxLines: 5,
                ),
              ],
            ),
          ),
        ),

        /* ------------------------------------------------ */
        //  additional information
        /* ------------------------------------------------ */
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const CustomText(
            title: 'Additional Information',
            size: 18.0,
            color: CustomColors.primaryTextColor,
            weight: FontWeight.bold,
          ),
          content: Form(
            key: _formKey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const TagsTextField(
                //   label: 'Services Offered',
                //   isImp: true,
                // ),

                // services provided
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Services Provided',
                  controller: _serviceProvided,
                  hintText: 'List the services you will provide',
                  isImp: true,
                  textInputType: TextInputType.multiline,
                  maxLines: 2,
                ),

                // tools and technology used provided
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Tools and Technologies ',
                  controller: _toolTechUsed,
                  hintText: 'List the tools and technologies used (optional)',
                  isImp: false,
                  textInputType: TextInputType.multiline,
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),

        /* ------------------------------------------------ */
        //  add images
        /* ------------------------------------------------ */
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const CustomText(
            title: 'Add Images',
            size: 18.0,
            color: CustomColors.primaryTextColor,
            weight: FontWeight.bold,
          ),
          content: Form(
            key: _formKey3,
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // images 1
                SizedBox(height: 24.0),
                Text('image 1'),
                Text('image 2'),
                Text('image 3'),
                Text('image 4'),
              ],
            ),
          ),
        ),

        /* ------------------------------------------------ */
        //  add FAQ
        /* ------------------------------------------------ */
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const CustomText(
            title: 'FAQs',
            size: 18.0,
            color: CustomColors.primaryTextColor,
            weight: FontWeight.bold,
          ),
          content: Form(
            key: _formKey4,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // FAQ 1
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'What services do you offer as a freelancer?',
                  controller: _faq1,
                  hintText: '',
                  isImp: false,
                  textInputType: TextInputType.multiline,
                  maxLines: null,
                ),

                // FAQ 2
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'What is your typical turnaround time for projects?',
                  controller: _faq2,
                  hintText: '',
                  isImp: false,
                  textInputType: TextInputType.multiline,
                  maxLines: null,
                ),

                // FAQ 3
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'How do you handle revisions and feedback?',
                  controller: _faq3,
                  hintText: '',
                  isImp: false,
                  textInputType: TextInputType.multiline,
                  maxLines: null,
                ),

                // FAQ 4
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'What sets you apart from other freelancers?',
                  controller: _faq4,
                  hintText: '',
                  isImp: false,
                  textInputType: TextInputType.multiline,
                  maxLines: null,
                ),

                // FAQ 5
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Can you share samples of your previous work?',
                  controller: _faq5,
                  hintText: '',
                  isImp: false,
                  textInputType: TextInputType.multiline,
                  maxLines: null,
                ),
              ],
            ),
          ),
        ),
      ];
}
