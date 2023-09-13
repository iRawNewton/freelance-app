import 'package:flutter/material.dart';

import '../../resources/widgets/text_widget.dart';
import '../../resources/constants/colors.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({
    super.key,
    required this.controller,
    required this.label,
    required this.hintText,
    required this.textInputType,
    required this.hasPassword,
    this.onChanged,
    this.onEditingComplete,
  });
  final TextEditingController controller;
  final String label, hintText;
  final TextInputType textInputType;
  final bool hasPassword;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  // bool isPassword = false;
  // false
  // true
  bool isPassword = true;
  bool isPasswordVisible = true;

  @override
  void initState() {
    setState(() {
      isPassword = widget.hasPassword;
      isPasswordVisible = widget.hasPassword;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20.0),
        CustomText(
          title: widget.label,
          size: 16.0,
          color: CustomColors.primaryTextColor,
        ),
        const SizedBox(height: 5.0),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(5.0)),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 0.0),
            child: TextField(
              controller: widget.controller,
              keyboardType: widget.textInputType,
              obscureText: isPassword,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.hintText,
                hintStyle: const TextStyle(
                  color: CustomColors.secondaryTextColor,
                  fontSize: 15.0,
                ),
                suffixIcon: isPasswordVisible
                    ? IconButton(
                        onPressed: () {
                          toggleVisibility();
                        },
                        icon: isPassword
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      )
                    : null,
              ),
              onChanged: widget.onChanged,
              onEditingComplete: widget.onEditingComplete,
            ),
          ),
        ),
      ],
    );
  }

  toggleVisibility() {
    setState(() {
      isPassword = !isPassword;
    });
  }
}
