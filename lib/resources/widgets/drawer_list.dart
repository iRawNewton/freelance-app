import 'package:flutter/material.dart';
import 'package:freelance_app/resources/widgets/text_widget.dart';
import 'package:freelance_app/resources/constants/colors.dart';

class DrawerList extends StatefulWidget {
  const DrawerList({
    super.key,
    this.onTap,
    required this.icon,
    required this.title,
  });
  final void Function()? onTap;
  final IconData icon;
  final String title;
  @override
  State<DrawerList> createState() => _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: widget.onTap,
      splashColor: CustomColors.accentColor,
      leading: Icon(
        widget.icon,
        size: 20.0,
      ),
      title: CustomText(
        title: widget.title,
        size: 14.0,
        color: CustomColors.primaryTextColor,
      ),
      trailing: const Icon(Icons.navigate_next),
    );
  }
}
