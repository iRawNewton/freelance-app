import 'package:flutter/material.dart';
import 'package:freelance_app/auth/screens/widgets.dart';
import 'package:freelance_app/dev/ui_global/footer.dart';
import 'package:freelance_app/dev/ui_global/text_widget.dart';
import 'package:freelance_app/res/constants/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String _loginMessage =
      'Join the world\'s largest community of freelancers and connect with other experienced professionals.';
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: Container(
          width: double.infinity,
          color: CustomColors.accentColor2,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 36.0),
                              const CustomText(
                                title: 'Log In',
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
                              const SizedBox(height: 36.0),
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
                                          const AuthWidget(
                                            label: 'Email',
                                            hintText: 'Email',
                                            textInputType:
                                                TextInputType.emailAddress,
                                            hasPassword: false,
                                          ),
                                          /* password */
                                          const AuthWidget(
                                            label: 'Password',
                                            hintText: 'Password',
                                            textInputType: TextInputType.text,
                                            hasPassword: true,
                                          ),
                                          /* forgot password */
                                          Align(
                                            alignment: Alignment.centerRight,
                                            child: TextButton(
                                              onPressed: () {},
                                              child: const CustomText(
                                                title: 'Forgot Password?',
                                                size: 14.0,
                                                color: Colors.blue,
                                              ),
                                            ),
                                          ),
                                          /* button */
                                          SizedBox(
                                            width: double.infinity,
                                            child: Directionality(
                                              textDirection: TextDirection.rtl,
                                              child: ElevatedButton.icon(
                                                style: ElevatedButton.styleFrom(
                                                  elevation: 0,
                                                  backgroundColor:
                                                      CustomColors.buttonColor,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      10.0,
                                                    ),
                                                  ),
                                                ),
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.login,
                                                  color: Colors.white,
                                                ),
                                                label: const CustomText(
                                                  title: 'Log In',
                                                  size: 16.0,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ),
                                          /* not a memeber */
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              const CustomText(
                                                title: 'Not a member?',
                                                size: 14.0,
                                                color: CustomColors
                                                    .primaryTextColor,
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: const CustomText(
                                                  title: 'Register now',
                                                  size: 14.0,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ],
                                          ),
                                          /* social logins */
                                          const SizedBox(height: 25.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.3,
                                                child: const Divider(),
                                              ),
                                              const CustomText(
                                                title: 'or log in with',
                                                size: 14.0,
                                                color: CustomColors
                                                    .primaryTextColor,
                                              ),
                                              SizedBox(
                                                width:
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.3,
                                                child: const Divider(),
                                              ),
                                            ],
                                          ),
                                          const SizedBox(height: 40.0),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Card(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                    'lib/res/assets/icons/facebook_logo.png',
                                                    height: 40.0,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 40.0),
                                              Card(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                    'lib/res/assets/icons/google_logo.png',
                                                    height: 40.0,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 40.0),
                                              Card(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Image.asset(
                                                    'lib/res/assets/icons/apple_logo.png',
                                                    height: 40.0,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          /* end of form box */
                                          const SizedBox(height: 25.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const AppFooter(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
