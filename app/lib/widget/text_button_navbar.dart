import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';

class TextButtonNavBar extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final IconData icon;

  const TextButtonNavBar(
      {Key? key, this.onPressed, required this.label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      label: Text(
        label,
        style: const TextStyle(color: AppColor.gray_300),
      ),
      icon: Icon(
        icon,
        color: AppColor.gray_300,
      ),
    );
  }
}
