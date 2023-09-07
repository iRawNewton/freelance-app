import 'package:flutter/material.dart';

// &Define a custom navigation function
void navigateToPage(BuildContext context, Widget page, {Object? arguments}) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => page,
      settings: RouteSettings(arguments: arguments),
    ),
  );
}

// *Usage:
// *You can now use the `navigateToPage` function to navigate to different pages.
// *Example 1: Navigating to UserProfile without arguments
// ~ navigateToPage(context, const UserProfile());

// *Example 2: Navigating to UserProfile with arguments
// ~ navigateToPage(context, const UserProfile(), arguments: {'userId': 123});
