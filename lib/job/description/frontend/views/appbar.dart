import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomJobAppBar extends StatefulWidget {
  const CustomJobAppBar({super.key});

  @override
  State<CustomJobAppBar> createState() => _CustomJobAppBarState();
}

class _CustomJobAppBarState extends State<CustomJobAppBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        children: [
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color:
                  const Color.fromARGB(255, 233, 234, 237), // Background color
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 206, 209, 213),
                  offset: Offset(8, 10),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: const Icon(Icons.arrow_back_ios_new),
          ),
          const Spacer(),
          Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color:
                  const Color.fromARGB(255, 233, 234, 237), // Background color
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 206, 209, 213),
                  offset: Offset(8, 10),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: SvgPicture.asset(
              'lib/resources/assets/icons/menu-strawberry.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
        ],
      ),
    );
  }
}
