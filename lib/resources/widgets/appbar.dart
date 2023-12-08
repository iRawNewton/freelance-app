import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopAppBar extends StatefulWidget {
  const TopAppBar({super.key, required this.onTap});
  final void Function() onTap;

  @override
  State<TopAppBar> createState() => _TopAppBarState();
}

class _TopAppBarState extends State<TopAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 70.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image.asset(
          'lib/resources/assets/icons/CFC_Logo.png',
          fit: BoxFit.fitWidth,
        ),
      ),
      leadingWidth: 120.0,
      actions: [
        const SizedBox(width: 15.0),
        IconButton(
          onPressed: widget.onTap,
          icon: SvgPicture.asset(
              'lib/resources/assets/icons/menu-strawberry.svg'),
        ),
        const SizedBox(width: 8.0),
      ],
    );
  }
}

class JobAppBar extends StatefulWidget {
  const JobAppBar({super.key, required this.onTap});
  final void Function() onTap;

  @override
  State<JobAppBar> createState() => _JobAppBarState();
}

class _JobAppBarState extends State<JobAppBar> {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 70.0,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Image.asset(
          'lib/resources/assets/icons/CFC_Logo.png',
          fit: BoxFit.fitWidth,
        ),
      ),
      leadingWidth: 120.0,
      actions: [
        const SizedBox(width: 15.0),
        InkWell(
          onTap: widget.onTap,
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
              color:
                  const Color.fromARGB(255, 233, 234, 237), // Background color
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 206, 209, 213),
                  offset: Offset(8, -7),
                  blurRadius: 20.0,
                ),
              ],
            ),
            child: SvgPicture.asset(
              'lib/resources/assets/icons/menu-strawberry.svg',
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        // IconButton(
        //   onPressed: widget.onTap,
        //   icon: SvgPicture.asset(
        //       'lib/resources/assets/icons/menu-strawberry.svg'),
        // ),
        const SizedBox(width: 8.0),
      ],
    );
  }
}
