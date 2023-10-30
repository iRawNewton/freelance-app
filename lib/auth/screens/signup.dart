import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelance_app/auth/screens/widgets.dart';
import 'package:freelance_app/resources/widgets/footer.dart';
import 'package:freelance_app/resources/widgets/loading_indicator.dart';
import 'package:freelance_app/resources/widgets/snackbar.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:freelance_app/resources/constants/colors.dart';
import 'package:freelance_app/services/post_remote_services.dart';

import '../../presentation/global/home/home.dart';
import '../../resources/functions/convert.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final String _loginMessage =
      'Join the world\'s largest community of freelancers and connect with other experienced professionals.';

  // variables
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();

  bool isPasswordCorrect = false;
  bool isLoading = false;
  bool isEmailValid = false;
  bool isPasswordValid = false;

  Future signUp<String>(context, email, password) async {
    var response = await PostRemoteService().signUp(email, password);

    if (response == 'Data inserted successfully') {
      setState(() {
        isLoading = false;
      });
      _email.clear();
      _password.clear();
      _confirmPassword.clear();

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    } else if (response == 'Dublicate data') {
      setState(() {
        isLoading = false;
      });
      customSnackBar(context, 'Error! Please try again', CustomColors.warning,
          Colors.black87);
    } else {
      setState(() {
        isLoading = false;
      });
      customSnackBar(context, 'An account with same email id already exists',
          CustomColors.danger, Colors.white);
    }
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SvgPicture.network(
                'https://demoapus1.com/freeio-new/wp-content/themes/freeio/images/logo.svg'),
          ),
          leadingWidth: 120.0,
          actions: const [
            Icon(Icons.menu),
            SizedBox(width: 8.0),
          ],
        ),
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              color: CustomColors.accentColor2,
              child: Column(
                children: [
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  children: [
                                    const SizedBox(height: 24.0),
                                    const CustomText(
                                      title: 'Register',
                                      size: 24.0,
                                      color: CustomColors.primaryTextColor,
                                      weight: FontWeight.bold,
                                    ),
                                    const SizedBox(height: 10.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0),
                                      child: CustomText(
                                        title: _loginMessage,
                                        size: 14.0,
                                        color: CustomColors.primaryTextColor,
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    const SizedBox(height: 24.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 14.0),
                                      child: Card(
                                        elevation: 0,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12.0),
                                          child: SizedBox(
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 15.0),
                                                /* start of form box */

                                                /* email */
                                                AuthWidget(
                                                  controller: _email,
                                                  label: 'Email',
                                                  hintText: 'Email',
                                                  textInputType: TextInputType
                                                      .emailAddress,
                                                  hasPassword: false,
                                                  onChanged: (value) {
                                                    if (emailValidityChecker(
                                                        _email.text)) {
                                                      setState(() {
                                                        isEmailValid = false;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        isEmailValid = true;
                                                      });
                                                    }
                                                  },
                                                ),
                                                (isEmailValid)
                                                    ? const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15.0),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: CustomText(
                                                            title:
                                                                'Invalid email address',
                                                            size: 14.0,
                                                            color: CustomColors
                                                                .danger,
                                                          ),
                                                        ),
                                                      )
                                                    : const SizedBox(),

                                                /* password */
                                                AuthWidget(
                                                  controller: _password,
                                                  label: 'Password',
                                                  hintText: 'Password',
                                                  textInputType:
                                                      TextInputType.text,
                                                  hasPassword: true,
                                                  onChanged: (value) {
                                                    if (passwordValidChecker(
                                                        _password.text)) {
                                                      setState(() {
                                                        isPasswordValid = false;
                                                      });
                                                    } else {
                                                      setState(() {
                                                        isPasswordValid = true;
                                                      });
                                                    }
                                                  },
                                                ),
                                                (isPasswordValid)
                                                    ? const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15.0),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: CustomText(
                                                            title:
                                                                'Password must be at least 8 characters long and contain 1 uppercase letter, 1 lowercase letter, and 1 number.',
                                                            size: 14.0,
                                                            color: CustomColors
                                                                .danger,
                                                          ),
                                                        ),
                                                      )
                                                    : const SizedBox(),

                                                /* confirm password */
                                                AuthWidget(
                                                  controller: _confirmPassword,
                                                  label: 'Confirm Password',
                                                  hintText: 'Confirm Password',
                                                  textInputType:
                                                      TextInputType.text,
                                                  hasPassword: true,
                                                  onChanged: (value) {
                                                    if (_password.text !=
                                                        _confirmPassword.text) {
                                                      setState(() {
                                                        isPasswordCorrect =
                                                            true;
                                                      });
                                                    } else if (_password.text ==
                                                        _confirmPassword.text) {
                                                      setState(() {
                                                        isPasswordCorrect =
                                                            false;
                                                      });
                                                    }
                                                  },
                                                ),
                                                (isPasswordCorrect)
                                                    ? const Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 15.0),
                                                        child: Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: CustomText(
                                                            title:
                                                                'Password do not match',
                                                            size: 14.0,
                                                            color: CustomColors
                                                                .danger,
                                                          ),
                                                        ),
                                                      )
                                                    : const SizedBox(),

                                                const SizedBox(height: 24.0),

                                                /* button */
                                                SizedBox(
                                                  width: double.infinity,
                                                  child: Directionality(
                                                    textDirection:
                                                        TextDirection.rtl,
                                                    child: ElevatedButton.icon(
                                                      style: ElevatedButton
                                                          .styleFrom(
                                                        elevation: 0,
                                                        backgroundColor:
                                                            CustomColors
                                                                .buttonColor,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                            10.0,
                                                          ),
                                                        ),
                                                      ),
                                                      onPressed: () {
                                                        setState(() {
                                                          isLoading = true;
                                                        });
                                                        if (_email.text
                                                                .isNotEmpty &&
                                                            (isPasswordCorrect ==
                                                                false)) {
                                                          signUp(
                                                            context,
                                                            _email.text.trim(),
                                                            _password.text
                                                                .trim(),
                                                          );
                                                        } else {
                                                          setState(() {
                                                            isLoading = false;
                                                          });
                                                          customSnackBar(
                                                            context,
                                                            'Fields empty or invalid!',
                                                            CustomColors
                                                                .warning,
                                                            Colors.black87,
                                                          );
                                                        }
                                                      },
                                                      icon: const Icon(
                                                        Icons.app_registration,
                                                        color: Colors.white,
                                                      ),
                                                      label: const CustomText(
                                                        title: 'Register Now',
                                                        size: 16.0,
                                                        color: Colors.white,
                                                      ),
                                                    ),
                                                  ),
                                                ),

                                                // login
                                                Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                    },
                                                    child: const CustomText(
                                                      title:
                                                          'Alread have an account? Login now',
                                                      size: 12.0,
                                                      color: CustomColors
                                                          .primaryTextColor,
                                                    ),
                                                  ),
                                                ),

                                                const SizedBox(height: 42.0),
                                                /* end of form box */
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),

                          // Add other content in the SingleChildScrollView as needed
                        ],
                      ),
                    ),
                  ),
                  const AppFooter(), // This will stay at the bottom
                ],
              ),
            ),
            if (isLoading) const LoadingIndicator(),
          ],
        ),
      ),
    );
  }
}
