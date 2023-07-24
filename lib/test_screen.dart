import 'package:flutter/material.dart';

import 'dev/ui_global/textfields.dart';

class MyTestScreen extends StatelessWidget {
  MyTestScreen({super.key});

  final TextEditingController cont = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 40.0),
                const SizedBox(height: 100.0),
                const SizedBox(height: 20),
                MyCustomTextField(
                  controller: cont,
                  icon: Icons.call,
                  iconColor: Colors.red,
                  inputType: TextInputType.number,
                  fontstyle: 'Body',
                  fontsize: 16.0,
                  hinttext: 'Phone Number',
                  labeltext: 'Phone Number',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
