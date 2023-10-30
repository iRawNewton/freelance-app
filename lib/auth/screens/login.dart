import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelance_app/auth/screens/signup.dart';
import 'package:freelance_app/auth/screens/widgets.dart';
import 'package:freelance_app/resources/widgets/snackbar.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:freelance_app/models/users_model.dart';
import 'package:freelance_app/resources/constants/colors.dart';
// import 'package:neumorphic_ui/neumorphic_ui.dart';
import '../../presentation/global/home/home.dart';
import '../../resources/widgets/loading_indicator.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String _loginMessage =
      'Join the world\'s largest community of freelancers and connect with other experienced professionals.';

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool isLoading = false;
  List<Users>? users;

  void onLoginSuccess(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomePage(),
        // UserProfile
      ),
    );
  }

  Future<void> login(context, String email, String password) async {
    try {
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      // If login is successful, invoke the callback to navigate to a different page.
      if (userCredential.user != null) {
        // debugPrint(userCredential.user.updateDisplayName('displayName'));
        onLoginSuccess(context);
        setState(() {
          isLoading = false;
        });
      } else {
        // Handle the case where userCredential.user is unexpectedly null.
        // This should not happen if the Firebase authentication is set up correctly.
        // You can show an error message or log the issue for debugging.
        customSnackBar(context, 'Login failed: User is null.',
            CustomColors.danger, Colors.white);
      }
    } catch (e) {
      // Handle login errors here.
      String errorMessage = "Login failed. Please check your credentials.";

      if (e is FirebaseAuthException) {
        switch (e.code) {
          case 'user-not-found':
            errorMessage = "User not found. Please register first.";
            break;
          case 'wrong-password':
            errorMessage = "Incorrect password. Please try again.";
            break;
          default:
            errorMessage =
                "An error occurred during login. Please try again later.";
            break;
        }
      }

      // Show an error message to the user.
      customSnackBar(context, errorMessage, CustomColors.danger, Colors.white);
    }
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
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Column(
                              children: [
                                const SizedBox(height: 24.0),
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
                                              textInputType:
                                                  TextInputType.emailAddress,
                                              hasPassword: false,
                                            ),
                                            /* password */
                                            AuthWidget(
                                              controller: _password,
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
                                                textDirection:
                                                    TextDirection.rtl,
                                                child: ElevatedButton.icon(
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    elevation: 0,
                                                    backgroundColor:
                                                        CustomColors
                                                            .buttonColor,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        10.0,
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    if (_email
                                                            .text.isNotEmpty &&
                                                        _password
                                                            .text.isNotEmpty) {
                                                      setState(() {
                                                        isLoading = true;
                                                      });
                                                      login(
                                                        context,
                                                        _email.text.trim(),
                                                        _password.text.trim(),
                                                      );
                                                    } else {
                                                      customSnackBar(
                                                        context,
                                                        'Email and password cannot be empty',
                                                        CustomColors.danger,
                                                        Colors.white,
                                                      );
                                                    }
                                                  },
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
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            const SignUpPage(),
                                                      ),
                                                    );
                                                  },
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                            const Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                // Neumorphic(
                                                //   style: const NeumorphicStyle(
                                                //     color: Colors.white,
                                                //     depth: 2.0,
                                                //     lightSource:
                                                //         LightSource.top,
                                                //   ),
                                                //   child: Padding(
                                                //     padding:
                                                //         const EdgeInsets.all(
                                                //             8.0),
                                                //     child: Image.asset(
                                                //       'lib/resources/assets/icons/facebook_logo.png',
                                                //       height: 40.0,
                                                //     ),
                                                //   ),
                                                // ),
                                                // Neumorphic(
                                                //   style: const NeumorphicStyle(
                                                //     color: Colors.white,
                                                //     depth: 2.0,
                                                //     lightSource:
                                                //         LightSource.top,
                                                //   ),
                                                //   child: Padding(
                                                //     padding:
                                                //         const EdgeInsets.all(
                                                //             8.0),
                                                //     child: Image.asset(
                                                //       'lib/resources/assets/icons/google_logo.png',
                                                //       height: 40.0,
                                                //     ),
                                                //   ),
                                                // ),
                                                SizedBox(width: 40.0),
                                                // Neumorphic(
                                                //   style: const NeumorphicStyle(
                                                //     color: Colors.white,
                                                //     depth: 2.0,
                                                //     lightSource:
                                                //         LightSource.top,
                                                //   ),
                                                //   child: Padding(
                                                //     padding:
                                                //         const EdgeInsets.all(
                                                //             8.0),
                                                //     child: Image.asset(
                                                //       'lib/resources/assets/icons/apple_logo.png',
                                                //       height: 40.0,
                                                //     ),
                                                //   ),
                                                // ),
                                              ],
                                            ),
                                            const SizedBox(height: 36.0),
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
                    ),
                  ),
                  // const AppFooter(), // This will stay at the bottom
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
