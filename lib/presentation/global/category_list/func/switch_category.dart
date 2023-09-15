import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/global/category_list/category.dart';

void switchCategoryList(BuildContext context, String pageName) {
  switch (pageName) {
    // ^ Development & IT
    case '1':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            id: pageName,
          ),
        ),
      );
      break;

    // ^ Design & Creative
    case '5':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            id: pageName,
          ),
        ),
      );
      break;

    // ^ Digital Marketing
    case '6':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            id: pageName,
          ),
        ),
      );
      break;

    // ^ Writing & Translation
    case '7':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            id: pageName,
          ),
        ),
      );
      break;

    // ^ Music & Audio
    case '8':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            id: pageName,
          ),
        ),
      );
      break;

    // ^ Video & Animation
    case '9':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            id: pageName,
          ),
        ),
      );
      break;

    // ^ Programming & Tech
    case '10':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            id: pageName,
          ),
        ),
      );
      break;

    // ^ Finance & Accounting
    case '11':
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CategoryPage(
            id: pageName,
          ),
        ),
      );
      break;

    // Add more cases for additional pages
    default:
      // Handle unknown page or error condition
      debugPrint('Unknown page: $pageName');
  }
}
