import 'package:flutter/material.dart';
import 'package:freelance_app/presentation/global/category_list/category.dart';

void switchCategoryList(BuildContext context, String pageName) {
  switch (pageName) {
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
    case 'page2':
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
      print('Unknown page: $pageName');
  }
}
