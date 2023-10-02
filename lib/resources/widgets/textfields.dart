import 'package:flutter/material.dart';

class MyCustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final IconData icon;
  final Color iconColor;
  final double fontsize;
  final String fontstyle;
  final String labeltext;
  final String hinttext;

  const MyCustomTextField({
    super.key,
    required this.controller,
    required this.inputType,
    required this.icon,
    required this.iconColor,
    required this.fontsize,
    required this.fontstyle,
    required this.labeltext,
    required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double scaleFactor = screenHeight / 720.0;
    return TextField(
      controller: controller,
      keyboardType: inputType,
      style: TextStyle(
        fontSize: fontsize * scaleFactor,
        fontFamily: fontstyle,
      ),
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: iconColor),
        labelText: labeltext,
        labelStyle: const TextStyle(fontFamily: 'Body'),
        hintText: hinttext,
        hintStyle: const TextStyle(fontFamily: 'Body', color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 1),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class MyCustomJobTextField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType inputType;
  final IconData icon;
  final Color iconColor;
  final double fontsize;
  final String fontstyle;
  // final String labeltext;
  final String hinttext;

  const MyCustomJobTextField({
    super.key,
    required this.controller,
    required this.inputType,
    required this.icon,
    required this.iconColor,
    required this.fontsize,
    required this.fontstyle,
    // required this.labeltext,
    required this.hinttext,
  });

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double scaleFactor = screenHeight / 720.0;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: TextField(
        controller: controller,
        keyboardType: inputType,
        style: TextStyle(
          fontSize: fontsize * scaleFactor,
          fontFamily: fontstyle,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon, color: iconColor),
          // labelText: labeltext,
          labelStyle: const TextStyle(fontFamily: 'Body'),
          hintText: hinttext,
          hintStyle: const TextStyle(
            fontFamily: 'Body',
            color: Colors.black54,
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
