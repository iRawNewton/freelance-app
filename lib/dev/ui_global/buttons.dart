import 'package:flutter/material.dart';

class MyCustomButtons extends StatelessWidget {
  final dynamic onPressed;
  final IconData icon;
  const MyCustomButtons(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Increment',
      child: Icon(icon),
    );
  }
}
