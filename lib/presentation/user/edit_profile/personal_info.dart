import 'package:cached_network_image/cached_network_image.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/user/edit_profile/views/education_view.dart';
import 'package:freelance_app/presentation/user/edit_profile/views/experience_view.dart';
import 'package:freelance_app/resources/functions/data_func.dart';
import 'package:freelance_app/resources/widgets/buttons.dart';
import 'package:freelance_app/resources/widgets/phone_input.dart';
import 'package:freelance_app/resources/widgets/snackbar.dart';

import '../../../models/edit_user.dart';
import '../../../resources/constants/colors.dart';
import '../../../resources/widgets/appbar.dart';
import '../../../resources/widgets/text_widget.dart';
import '../../../services/get_remote_services.dart';
import '../../global/checkout/widget/text_field.dart';
import 'bottom_sheet_exp.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({super.key});

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  int currentStep = 0;
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  bool isChecked = false;
  // controllers
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _country = TextEditingController();
  final TextEditingController _state = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _shortDesc = TextEditingController();

  final TextEditingController _institute = TextEditingController();
  final TextEditingController _degree = TextEditingController();
  final TextEditingController _fieldOfStudy = TextEditingController();
  final TextEditingController _startDate = TextEditingController();
  final TextEditingController _endDate = TextEditingController();
  final TextEditingController _gradeGpa = TextEditingController();

  final TextEditingController _coName = TextEditingController();
  final TextEditingController _jobTitle = TextEditingController();
  final TextEditingController _jobStart = TextEditingController();
  final TextEditingController _jobEnd = TextEditingController();
  final TextEditingController _isWorking = TextEditingController();
  final TextEditingController _jobDesc = TextEditingController();

  int educationLength = 0;
  int expLength = 0;
  List<EditUser>? userProfile = [];

  // & get Profile Info
  Future<List<EditUser>?> getInfo() async {
    userProfile = await GetRemoteService().getEditUserDetails('');
    var bI = userProfile![0]; // bI for basicInfo

    setState(() {
      _fName.text = bI.firstName;
      _lName.text = bI.lastName;
      _username.text = bI.username;
      _phone.text = bI.phone;
      _country.text = bI.residenceCountry;
      _state.text = bI.residenceState;
      _city.text = bI.residenceState;
      _shortDesc.text = bI.userBio;

      educationLength = userProfile![0].educationQualification.length;
      expLength = userProfile![0].experience.length;

      // print(userProfile![0].educationQualification[0].runtimeType);
      // exI = userProfile![0].experience[0];
    });

    return userProfile;
  }

  @override
  void initState() {
    getInfo();
    super.initState();
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
                      ),
                    ),

                    // ^ stepper
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
                          // ^ basic information
                          case 0:
                            if (_formKey1.currentState!.validate()) {
                              setState(() {
                                currentStep = currentStep + 1;
                              });
                            } else {
                              customSnackBar(
                                context,
                                'Fields missing or Invalid input',
                                CustomColors.danger,
                                Colors.white,
                              );
                            }
                            break;

                          // ^ education
                          case 1:
                            if (_formKey2.currentState!.validate()) {
                              setState(() {
                                currentStep = currentStep + 1;
                              });
                            } else {
                              customSnackBar(
                                context,
                                'Fields missing or Invalid input',
                                CustomColors.danger,
                                Colors.white,
                              );
                            }
                            break;

                          // ^ experience
                          case 2:
                            if (_formKey3.currentState!.validate()) {
                              //  ! final step
                              // setState(() {
                              //   currentStep = currentStep + 1;
                              // });
                            } else {
                              customSnackBar(
                                context,
                                'Fields missing or Invalid input',
                                CustomColors.danger,
                                Colors.white,
                              );
                            }
                            break;

                          default:
                            customSnackBar(
                              context,
                              'Oops something went wrong.',
                              CustomColors.danger,
                              Colors.white,
                            );
                        }

                        if (isLastStep) {
                          // *submit form
                          // debugPrint('Completed');
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
        // ? Basic information
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
            key: _formKey1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40.0),

                // ^ display picture
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

                // ^ first name and last name
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
                      errorText: 'Field cannot be empty',
                    ),
                    CheckoutFormWidget(
                      width: 0.36,
                      controller: _lName,
                      label: 'Last Name',
                      hintText: 'Doe',
                      isImp: true,
                      textInputType: TextInputType.name,
                      errorText: 'Field cannot be empty',
                    ),
                  ],
                ),
                const SizedBox(height: 24.0),

                // ^ username
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Username',
                  controller: _username,
                  hintText: '@johndoe',
                  isImp: true,
                  textInputType: TextInputType.name,
                  errorText: 'Field cannot be empty',
                ),
                const SizedBox(height: 24.0),

                // ^ contact number
                (_phone.text.isNotEmpty)
                    ? Row(
                        children: [
                          CustomText(
                            title: 'Phone: ${_phone.text}',
                            size: 16.0,
                            color: Colors.black87,
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                _phone.text = '';
                              });
                            },
                            icon: const Icon(Icons.edit),
                          ),
                        ],
                      )
                    : PhoneInput(
                        label: 'Phone',
                        controller: _phone,
                        isImp: true,
                      ),
                const SizedBox(height: 24.0),

                // ^ country state city
                (_country.text.isNotEmpty)
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                CustomText(
                                  title: 'Country: ${_country.text}',
                                  size: 16.0,
                                  color: Colors.black87,
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _country.text = '';
                                    });
                                  },
                                  icon: const Icon(Icons.edit),
                                ),
                              ],
                            ),
                          ),
                          CustomText(
                            title: 'State: ${_state.text}',
                            size: 16.0,
                            color: Colors.black87,
                          ),
                          CustomText(
                            title: 'City: ${_city.text}',
                            size: 16.0,
                            color: Colors.black87,
                          ),
                        ],
                      )
                    : SelectState(
                        onCountryChanged: (value) {
                          setState(() {
                            _country.text = value;
                          });
                        },
                        onStateChanged: (value) {
                          setState(() {
                            _state.text = value;
                          });
                        },
                        onCityChanged: (value) {
                          setState(() {
                            _city.text = value;
                          });
                        },
                      ),

                // ^ short description
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Short Description',
                  controller: _shortDesc,
                  hintText: ' Briefly describe yourself and your expertise',
                  isImp: true,
                  textInputType: TextInputType.name,
                  maxLines: 5,
                  errorText: 'Field cannot be empty',
                ),

                // ^ button
                const SizedBox(height: 24.0),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      color: CustomColors.buttonColor,
                      title: 'Save',
                      textColor: Colors.white,
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ),

        /* ------------------------------------------------ */
        //  ? Education
        /* ------------------------------------------------ */
        Step(
          state: currentStep > 1 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 1,
          title: const CustomText(
            title: 'Education Qualification',
            size: 18.0,
            color: CustomColors.primaryTextColor,
            weight: FontWeight.bold,
          ),
          content: Form(
            key: _formKey2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Skills
                // ^ listview
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: educationLength,
                  itemBuilder: (context, index) {
                    if (userProfile![0].educationQualification.isNotEmpty) {
                      return Column(
                        children: [
                          Column(
                            children: [
                              EducationDetailsView(
                                title: userProfile![0]
                                    .educationQualification[index]
                                    .institutionName,
                                degree: userProfile![0]
                                    .educationQualification[index]
                                    .degreeObtained,
                                field: userProfile![0]
                                    .educationQualification[index]
                                    .fieldOfStudy,
                                grade: userProfile![0]
                                    .educationQualification[index]
                                    .gradeOrGpa,
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // const SizedBox(height: 24.0),
                // const TagsTextField(label: 'Skills', isImp: true),

                // ^ Institute Name
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Institute Name',
                  controller: _institute,
                  hintText: 'University/School name',
                  isImp: true,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  errorText: 'Field cannot be empty',
                ),

                // ^ Degree Obtained
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Degree Obtained',
                  controller: _degree,
                  hintText: 'Degree name',
                  isImp: true,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  errorText: 'Field cannot be empty',
                ),

                // ^ Field of study
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Field of Study',
                  controller: _fieldOfStudy,
                  hintText: 'Specialization',
                  isImp: true,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  errorText: 'Field cannot be empty',
                ),

                // ^ start date
                const SizedBox(height: 24.0),
                InkWell(
                  onTap: () {
                    showDatePickerFunction(context, _startDate);
                  },
                  child: CheckoutFormWidget(
                    width: 1.0,
                    label: 'Start Date',
                    controller: _startDate,
                    hintText: 'Start date',
                    isImp: true,
                    textInputType: TextInputType.none,
                    maxLines: 1,
                    errorText: 'Field cannot be empty',
                    enabled: false,
                  ),
                ),

                // ^ end date
                const SizedBox(height: 24.0),
                InkWell(
                  onTap: () {
                    showDatePickerFunction(context, _endDate);
                  },
                  child: CheckoutFormWidget(
                    width: 1.0,
                    label: 'End Date',
                    controller: _endDate,
                    hintText: 'End date',
                    isImp: true,
                    textInputType: TextInputType.none,
                    maxLines: 1,
                    errorText: 'Field cannot be empty',
                    enabled: false,
                  ),
                ),

                // ^ grade or gpa
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Grade / GPA',
                  controller: _gradeGpa,
                  hintText: 'Grade or gpa',
                  isImp: true,
                  textInputType: TextInputType.number,
                  maxLines: 1,
                  errorText: 'Field cannot be empty',
                ),

                // ^ button
                const SizedBox(height: 24.0),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      color: CustomColors.buttonColor,
                      title: 'Save',
                      textColor: Colors.white,
                      onPressed: () {}),
                ),
                // portfolio images
                // portfolio description
              ],
            ),
          ),
        ),
        // step 3

        Step(
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
          title: const CustomText(
            title: 'Experience',
            size: 18.0,
            color: CustomColors.primaryTextColor,
            weight: FontWeight.bold,
          ),
          content: Form(
            key: _formKey3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ^ listview
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: expLength,
                  itemBuilder: (context, index) {
                    if (userProfile![0].educationQualification.isNotEmpty) {
                      return Column(
                        children: [
                          Column(
                            children: [
                              ExpDetailsView(
                                companyName: userProfile![0]
                                    .experience[index]
                                    .companyName,
                                jobTitle:
                                    userProfile![0].experience[index].jobTitle,
                                description: userProfile![0]
                                    .experience[index]
                                    .description,
                              ),
                            ],
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
                // ^ Company Name
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Company Name',
                  controller: _coName,
                  hintText: 'Name of company',
                  isImp: true,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  errorText: 'Field cannot be empty',
                ),

                // ^ Job title
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Job Title',
                  controller: _jobTitle,
                  hintText: 'Frontend Developer',
                  isImp: true,
                  textInputType: TextInputType.name,
                  maxLines: 1,
                  errorText: 'Field cannot be empty',
                ),

                // ^ start date
                const SizedBox(height: 24.0),
                InkWell(
                  onTap: () {
                    showDatePickerFunction(context, _jobStart);
                  },
                  child: CheckoutFormWidget(
                    width: 1.0,
                    label: 'Start Date',
                    controller: _jobStart,
                    hintText: 'Start date',
                    isImp: true,
                    textInputType: TextInputType.none,
                    maxLines: 1,
                    errorText: 'Field cannot be empty',
                    enabled: false,
                  ),
                ),

                // ^ end date
                const SizedBox(height: 24.0),
                InkWell(
                  onTap: () {
                    showDatePickerFunction(context, _jobEnd);
                  },
                  child: CheckoutFormWidget(
                    width: 1.0,
                    label: 'End Date',
                    controller: _jobEnd,
                    hintText: 'End date',
                    isImp: true,
                    textInputType: TextInputType.none,
                    maxLines: 1,
                    errorText: 'Field cannot be empty',
                    enabled: false,
                  ),
                ),

                // ^ is current
                // const SizedBox(height: 24.0),
                CheckboxListTile(
                  title: const CustomText(
                    title: 'Currently Working',
                    size: 14.0,
                    color: Colors.black87,
                  ),
                  value: isChecked,
                  onChanged: (bool? newValue) {
                    setState(() {
                      isChecked = newValue!;
                      _isWorking.text = isChecked.toString();
                      if (isChecked) {
                        _jobEnd.clear();
                      }
                    });
                  },
                ),

                // ^ description
                const SizedBox(height: 24.0),
                CheckoutFormWidget(
                  width: 1.0,
                  label: 'Job Description',
                  controller: _jobDesc,
                  hintText: 'Your job description',
                  isImp: true,
                  textInputType: TextInputType.name,
                  maxLines: null,
                  errorText: 'Field cannot be empty',
                ),

                // ^ button
                const SizedBox(height: 24.0),
                SizedBox(
                  width: double.infinity,
                  child: CustomButton(
                      color: CustomColors.buttonColor,
                      title: 'Save',
                      textColor: Colors.white,
                      onPressed: () {}),
                )
              ],
            ),
          ),
        ),
      ];
}
