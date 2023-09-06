import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class TestAuth extends StatelessWidget {
  const TestAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // await FirebaseAuth.
              debugPrint('${FirebaseAuth.instance.currentUser!.email}');
              // FirebaseAuth.instance.currentUser!;
            },
            child: const Text('Click me')),
      ),
    ));
  }
}
