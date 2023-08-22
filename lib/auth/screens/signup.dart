import 'package:flutter_svg/svg.dart';
import 'package:freelance_app/auth/bloc/post_bloc_bloc.dart';
import 'package:freelance_app/auth/screens/widgets.dart';
import 'package:freelance_app/dev/ui_global/footer.dart';
import 'package:freelance_app/dev/ui_global/text_widget.dart';
import 'package:freelance_app/res/constants/colors.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

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

  // final PostBlocBloc postBloc = PostBlocBloc();
  // @override
  // void initState() {
  //   postBloc.add(PostInitialPostEvent());
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: SvgPicture.network(
                'https://demoapus1.com/freeio/wp-content/themes/freeio/images/logo.svg'),
          ),
          leadingWidth: 120.0,
          actions: const [
            Icon(Icons.menu),
            SizedBox(width: 8.0),
          ],
        ),
        body: Container(
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
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                                            /* confirm password */
                                            AuthWidget(
                                              controller: _confirmPassword,
                                              label: 'Confirm Password',
                                              hintText: 'Confirm Password',
                                              textInputType: TextInputType.text,
                                              hasPassword: true,
                                            ),
                                            const SizedBox(height: 24.0),
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
                                                  onPressed: () {},
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
                                              alignment: Alignment.centerRight,
                                              child: TextButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: const CustomText(
                                                  title:
                                                      'Alread have an account? login now',
                                                  size: 12.0,
                                                  color: CustomColors
                                                      .primaryTextColor,
                                                ),
                                              ),
                                            ),
                                            /* social logins */
                                            /* 
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
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Neumorphic(
                                                  style: const NeumorphicStyle(
                                                    color: Colors.white,
                                                    depth: 2.0,
                                                    lightSource:
                                                        LightSource.top,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image.asset(
                                                      'lib/res/assets/icons/facebook_logo.png',
                                                      height: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 40.0),
                                                Neumorphic(
                                                  style: const NeumorphicStyle(
                                                    color: Colors.white,
                                                    depth: 2.0,
                                                    lightSource:
                                                        LightSource.top,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image.asset(
                                                      'lib/res/assets/icons/google_logo.png',
                                                      height: 40.0,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(width: 40.0),
                                                Neumorphic(
                                                  style: const NeumorphicStyle(
                                                    color: Colors.white,
                                                    depth: 2.0,
                                                    lightSource:
                                                        LightSource.top,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Image.asset(
                                                      'lib/res/assets/icons/apple_logo.png',
                                                      height: 40.0,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            */
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
      ),
    );
  }
}
