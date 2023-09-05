import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:freelance_app/models/service_category.dart';
import 'package:freelance_app/models/service_subcategory.dart';
import 'package:freelance_app/res/widgets/buttons.dart';
import 'package:freelance_app/res/widgets/dropdown.dart';
import 'package:freelance_app/res/widgets/phone_input.dart';
import 'package:freelance_app/res/widgets/snackbar.dart';
import 'package:freelance_app/services/get_remote_services.dart';
import 'package:freelance_app/services/post_remote_services.dart';
import 'package:freelance_app/services/upload_image.dart';
import '../../../../res/constants/colors.dart';
import '../../models/users.dart';
import '../../res/widgets/appbar.dart';
import '../../res/widgets/text_widget.dart';
import '../../res/widgets/loading_indicator.dart';
import '../../services/pick_image.dart';
import '../../services/put_remote_services.dart';
import '../global/checkout/widget/text_field.dart';

class FreelancePost extends StatefulWidget {
  const FreelancePost({super.key});

  @override
  State<FreelancePost> createState() => _FreelancePostState();
}

class _FreelancePostState extends State<FreelancePost> {
  // variables
  bool isLoading = false;
  int currentStep = 0;
  bool isNetworkImage = true;

  final _formKey = GlobalKey<FormState>();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final _formKey3 = GlobalKey<FormState>();
  final _formKey4 = GlobalKey<FormState>();

  // controllers
  File? profilePictureFile;
  File? galleryFile1;
  File? galleryFile2;
  File? galleryFile3;
  File? galleryFile4;
  File? galleryFile5;

  final TextEditingController _profilePicture = TextEditingController();
  final TextEditingController _fName = TextEditingController();
  final TextEditingController _lName = TextEditingController();
  final TextEditingController _username = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _languageProficiency = TextEditingController();
  final TextEditingController _countryValue = TextEditingController();
  final TextEditingController _stateValue = TextEditingController();
  final TextEditingController _cityValue = TextEditingController();
  final TextEditingController _profileDesc = TextEditingController();
  final TextEditingController _category = TextEditingController();
  final TextEditingController _subCategory = TextEditingController();
  final TextEditingController _title = TextEditingController();
  final TextEditingController _deliveryTime = TextEditingController();
  final TextEditingController _productDescrition = TextEditingController();
  final TextEditingController _serviceProvided = TextEditingController();
  final TextEditingController _toolTechUsed = TextEditingController();

  final TextEditingController _gallery1 = TextEditingController();
  final TextEditingController _gallery2 = TextEditingController();
  final TextEditingController _gallery3 = TextEditingController();
  final TextEditingController _gallery4 = TextEditingController();
  final TextEditingController _gallery5 = TextEditingController();

  //
  final TextEditingController _faq1 = TextEditingController();
  final TextEditingController _faq2 = TextEditingController();
  final TextEditingController _faq3 = TextEditingController();
  final TextEditingController _faq4 = TextEditingController();
  final TextEditingController _faq5 = TextEditingController();

  final List<String> options = [
    'Beginner',
    'Intermediate',
    'Advanced',
    'Fluent',
  ];

  List<ServiceCategory>? serviceCategory = [];
  List<ServiceSubcategory>? serviceSubCategory = [];
  List<Users>? userInfo = [];

  // get user details
  getUserInfo() async {
    userInfo = await GetRemoteService().getUserInfo('gaurabroy16@gmail.com');
    if (userInfo!.isNotEmpty) {
      setState(() {
        _fName.text = userInfo![0].firstName;
        _lName.text = userInfo![0].lastName;
        _username.text = userInfo![0].username;
        _phoneNumber.text = userInfo![0].phone;
        _languageProficiency.text = userInfo![0].languageProficiency;
        _countryValue.text = userInfo![0].residenceCountry;
        _stateValue.text = userInfo![0].residenceState;
        _cityValue.text = userInfo![0].residenceCity;
        _profileDesc.text = userInfo![0].userBio;
      });
    }
  }

  // get category
  getCategory() async {
    List<ServiceCategory>? response =
        await GetRemoteService().getCategoriesInfo('', '', '', '', '');

    setState(() {
      _subCategory.clear();
      serviceSubCategory = [];

      serviceCategory = response;
    });
  }

  // get Sub category
  getSubCategory(String parentId) async {
    List<ServiceSubcategory>? response =
        await GetRemoteService().getSubserviceInfo(parentCategoryId: parentId);

    setState(() {
      serviceSubCategory = response;
    });
  }

  String? selectedCategory;

  // upload functions

  Future<String> uploadBasicInfo(
    String username,
    String email,
    String phone,
    String passwordHash,
    String firstName,
    String lastName,
    String languageProficiency,
    String residenceCountry,
    String residenceState,
    String residenceCity,
    String userBio,
    String profilePictureUrl,
  ) async {
    // upload data
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
      profilePictureUrl,
    );

    if (response == 'Data updated successfully') {
      // do something
      setState(() {
        isLoading = false;
        currentStep += 1;
      });
    }
    return response;
  }

  Future<String> uploadImage(
      File profilePictureFile, String profilePictureUrl) async {
    // upload image

    var imgResponse =
        await ImageUpload().uploadImage(profilePictureFile, profilePictureUrl);

    if (imgResponse.trim() == '"Image uploaded successfully"') {
      setState(() {
        customSnackBar(
          context,
          'Image updated successfully!',
          CustomColors.success,
          Colors.white,
        );
      });

      return '';
    } else {
      setState(() {
        isLoading = false;
        customSnackBar(
          context,
          'Something went wrong!',
          CustomColors.danger,
          CustomColors.primaryTextColor,
        );
      });

      return '';
    }
  }

  Future<String> uploadProduct(
    userId,
    projectCategory,
    projectSubcategory,
    projectTitle,
    projectMinDelivery,
    projctDescription,
    servicesProvided,
    toolsTechUsed,
    projectServiceId,
  ) async {
    var response = await PostRemoteService().postProducts(
      userId,
      projectCategory,
      projectSubcategory,
      projectTitle,
      projectMinDelivery,
      projctDescription,
      servicesProvided,
      toolsTechUsed,
      projectServiceId,
    );
    setState(() {
      isLoading = false;
    });

    if (response == 'Data updated successfully') {
      debugPrint('uploaded');
    }
    return response;
  }

  @override
  void initState() {
    getUserInfo();
    getCategory();
    super.initState();
  }

  @override
  void dispose() {
    _fName.dispose();
    _lName.dispose();
    _username.dispose();
    _phoneNumber.dispose();
    _languageProficiency.dispose();
    _countryValue.dispose();
    _stateValue.dispose();
    _cityValue.dispose();
    _profileDesc.dispose();
    _category.dispose();
    _subCategory.dispose();
    _title.dispose();
    _deliveryTime.dispose();
    _productDescrition.dispose();
    _serviceProvided.dispose();
    _toolTechUsed.dispose();
    _faq1.dispose();
    _faq2.dispose();
    _faq3.dispose();
    _faq4.dispose();
    _faq5.dispose();
    super.dispose();
  }

  void selectPhotoFunc() async {
    final result = await selectPhoto();
    setState(() {
      isNetworkImage = false;
      _profilePicture.text = result.fileName;
      profilePictureFile = File(result.filePath);
      if (_profilePicture.text.isNotEmpty) {
        uploadImage(profilePictureFile!, _profilePicture.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            NestedScrollView(
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
                            final isLastStep =
                                currentStep == getSteps().length - 1;
                            return Container(
                              margin: const EdgeInsets.only(top: 50.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: CustomButton(
                                      color: CustomColors.buttonColor,
                                      title: isLastStep ? 'Save' : 'Next',
                                      textColor: Colors.white,
                                      onPressed: () =>
                                          details.onStepContinue!(),
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
                                        onPressed: () =>
                                            details.onStepCancel!(),
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
                            final isLastStep =
                                currentStep == getSteps().length - 1;

                            switch (currentStep) {
                              case 0:
                                // do something for step 0 basic information

                                if (_formKey.currentState!.validate()) {
                                  isLoading = true;
                                  uploadBasicInfo(
                                    _username.text,
                                    'gaurabroy.kyptronix@gmail.com',
                                    _phoneNumber.text,
                                    '_passwordHash',
                                    _fName.text,
                                    _lName.text,
                                    _languageProficiency.text,
                                    _countryValue.text,
                                    _stateValue.text,
                                    _cityValue.text,
                                    _profileDesc.text,
                                    _profilePicture.text,
                                  );
                                } else {
                                  customSnackBar(
                                    context,
                                    'Fields missing or Invalid input',
                                    CustomColors.danger,
                                    Colors.white,
                                  );
                                }

                                break;
                              case 1:
                                // do something for step 1 product information

                                if (_formKey1.currentState!.validate()) {
                                  setState(() {
                                    currentStep = currentStep + 1;
                                  });
                                }

                                break;
                              case 2:
                                // do something for step 2 additional information
                                if (_formKey2.currentState!.validate()) {
                                  setState(() {
                                    currentStep = currentStep + 1;
                                  });
                                }

                                break;
                              case 3:
                                // do something for step 3 images
                                setState(() {
                                  currentStep = currentStep + 1;
                                });
                                break;
                              case 4:
                                // do something for step 4 faq
                                if (_formKey4.currentState!.validate()) {
                                  setState(() {
                                    isLoading = true;
                                    uploadProduct(
                                      '18',
                                      _category.text,
                                      _subCategory.text,
                                      _title.text,
                                      _deliveryTime.text,
                                      _productDescrition.text,
                                      _toolTechUsed.text,
                                      _serviceProvided.text,
                                      // ,projectServiceId,
                                      '1',
                                    );
                                    // currentStep = currentStep + 1;
                                    // save it
                                  });
                                } else {
                                  customSnackBar(context, 'Fields missing',
                                      CustomColors.danger, Colors.white);
                                }

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
            if (isLoading) const LoadingIndicator(),
          ],
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
                                child: isNetworkImage
                                    ? CachedNetworkImage(
                                        imageUrl: 'https://shorturl.at/elV34',
                                        placeholder: (context, url) =>
                                            const CircularProgressIndicator(),
                                        fit: BoxFit.cover,
                                      )
                                    : (_profilePicture.text != '')
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.file(
                                              File(profilePictureFile!.path),
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : const SizedBox(),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          CustomButton(
                            color: CustomColors.info,
                            title: 'Update Picture',
                            textColor: Colors.white,
                            onPressed: () {
                              selectPhotoFunc();
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

                // language proficiency
                const Row(
                  children: [
                    CustomText(
                        title: 'Language Proficiency in English',
                        size: 14.0,
                        color: CustomColors.primaryTextColor),
                    SizedBox(width: 5.0),
                    CustomText(
                      title: '*',
                      size: 14.0,
                      color: Colors.red,
                    )
                  ],
                ),
                const SizedBox(height: 5.0),
                CustomDropDown(
                  options: options,
                  controller: _languageProficiency,
                ),
                const SizedBox(height: 24.0),

                // country
                const Row(
                  children: [
                    CustomText(
                        title: 'Select your country',
                        size: 14.0,
                        color: CustomColors.primaryTextColor),
                    SizedBox(width: 5.0),
                    CustomText(
                      title: '*',
                      size: 14.0,
                      color: Colors.red,
                    )
                  ],
                ),
                const SizedBox(height: 5.0),

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
        //  Product and Information
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
                // parent category
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    // Add Horizontal padding using menuItemStyleData.padding so it matches
                    // the menu padding when button's width is not specified.
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    // Add more decoration..
                  ),
                  hint: const Text(
                    'Choose category',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: serviceCategory?.map((category) {
                        return DropdownMenuItem<String>(
                          value: category.categoryId,
                          child: Text(category.categoryName),
                        );
                      }).toList() ??
                      [],
                  validator: (value) {
                    if (value == null) {
                      return 'Please select any one option.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when selected item is changed.
                    setState(() {
                      _category.text = value.toString();
                      getSubCategory(_category.text);
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                  ),
                ),

                const SizedBox(height: 24.0),

                // sub categories
                DropdownButtonFormField2<String>(
                  isExpanded: true,
                  decoration: InputDecoration(
                    // Add Horizontal padding using menuItemStyleData.padding so it matches
                    // the menu padding when button's width is not specified.
                    contentPadding: const EdgeInsets.symmetric(vertical: 16),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  hint: const Text(
                    'Choose Sub Category',
                    style: TextStyle(fontSize: 14),
                  ),
                  items: serviceSubCategory?.map((subCategory) {
                        return DropdownMenuItem<String>(
                          value: subCategory.subcategoryId,
                          child: Text(subCategory.subcategoryName),
                        );
                      }).toList() ??
                      [],
                  validator: (value) {
                    if (value == null) {
                      return 'Please select any one option.';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    //Do something when selected item is changed.
                    setState(() {
                      _subCategory.text = value.toString();
                    });
                  },
                  buttonStyleData: const ButtonStyleData(
                    padding: EdgeInsets.only(right: 8),
                  ),
                  iconStyleData: const IconStyleData(
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: Colors.black45,
                    ),
                    iconSize: 24,
                  ),
                  dropdownStyleData: DropdownStyleData(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  menuItemStyleData: const MenuItemStyleData(
                    padding: EdgeInsets.symmetric(horizontal: 16),
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
          state: currentStep > 2 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 2,
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
          state: currentStep > 3 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 3,
          title: const CustomText(
            title: 'Add Images',
            size: 18.0,
            color: CustomColors.primaryTextColor,
            weight: FontWeight.bold,
          ),
          content: Form(
            key: _formKey3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // images 1
                const SizedBox(height: 24.0),

                // gallery 1

                InkWell(
                  onTap: () async {
                    selectGalleryFunc(_gallery1, galleryFile1);
                  },
                  child: CheckoutFormWidget(
                    width: 1.0,
                    label: 'Pick image 1',
                    controller: _gallery1,
                    hintText: 'Pick image 1',
                    isImp: true,
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    enabled: false,
                  ),
                ),
                const SizedBox(height: 10.0),

                // gallery 2

                InkWell(
                  onTap: () async {
                    selectGalleryFunc(_gallery2, galleryFile1);
                  },
                  child: CheckoutFormWidget(
                    width: 1.0,
                    label: 'Pick image 2',
                    controller: _gallery2,
                    hintText: 'Pick image 2',
                    isImp: true,
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    enabled: false,
                  ),
                ),
                const SizedBox(height: 10.0),

                // gallery 3

                InkWell(
                  onTap: () async {
                    selectGalleryFunc(_gallery3, galleryFile3);
                  },
                  child: CheckoutFormWidget(
                    width: 1.0,
                    label: 'Pick image 3',
                    controller: _gallery3,
                    hintText: 'Pick image 3',
                    isImp: true,
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    enabled: false,
                  ),
                ),
                const SizedBox(height: 10.0),

                // gallery 4

                InkWell(
                  onTap: () async {
                    selectGalleryFunc(_gallery4, galleryFile4);
                  },
                  child: CheckoutFormWidget(
                    width: 1.0,
                    label: 'Pick image 4',
                    controller: _gallery4,
                    hintText: 'Pick image 4',
                    isImp: true,
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    enabled: false,
                  ),
                ),
                const SizedBox(height: 10.0),

                // gallery 5

                InkWell(
                  onTap: () async {
                    selectGalleryFunc(_gallery5, galleryFile5);
                  },
                  child: CheckoutFormWidget(
                    width: 1.0,
                    label: 'Pick image 5',
                    controller: _gallery5,
                    hintText: 'Pick image 5',
                    isImp: true,
                    textInputType: TextInputType.text,
                    maxLines: 1,
                    enabled: false,
                  ),
                ),
              ],
            ),
          ),
        ),

        /* ------------------------------------------------ */
        //  add FAQ
        /* ------------------------------------------------ */
        Step(
          state: currentStep > 4 ? StepState.complete : StepState.indexed,
          isActive: currentStep >= 4,
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
  void selectGalleryFunc(TextEditingController fileName, File? file) async {
    final result = await selectPhoto();
    setState(() {
      fileName.text = result.fileName;
      file = File(result.filePath);
    });
  }
}

class DropdownItem {
  final String id;
  final String categoryName;

  DropdownItem(this.id, this.categoryName);
}
