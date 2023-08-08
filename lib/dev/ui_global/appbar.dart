import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freelance_app/auth/screens/login.dart';
import 'package:google_fonts/google_fonts.dart';

class TopAppBar extends StatefulWidget {
  const TopAppBar({super.key});

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
        child: SvgPicture.network(
            'https://demoapus1.com/freeio/wp-content/themes/freeio/images/logo.svg'),
      ),
      leadingWidth: 120.0,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const LoginPage(),
              ),
            );
          },
          child: Text(
            'Login',
            style: GoogleFonts.lato(
              fontSize: 14.0,
              color: Colors.black87,
            ),
          ),
        ),
        const SizedBox(width: 15.0),
        const Icon(Icons.menu),
        const SizedBox(width: 8.0),
      ],
    );
  }
}
