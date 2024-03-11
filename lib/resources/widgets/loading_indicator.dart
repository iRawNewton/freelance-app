import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.5), // Overlay background color
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ), // Loading indicator
      ),
    );
  }
}

class LoadingIndicator1 extends StatelessWidget {
  const LoadingIndicator1({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(0.0), // Overlay background color
      child: const Center(
        child: CircularProgressIndicator(
          color: Colors.blue,
        ), // Loading indicator
      ),
    );
  }
}
