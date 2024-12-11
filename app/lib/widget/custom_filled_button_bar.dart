import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';

class CustomFilledButtonBar extends StatefulWidget {
  final String label;
  final IconData icon;
  final Color? color;
  final VoidCallback? onPressed;

  const CustomFilledButtonBar({
    Key? key,
    required this.label,
    required this.icon,
    this.color,
    this.onPressed,
  }) : super(key: key);

  @override
  State<CustomFilledButtonBar> createState() => _CustomFilledButtonBarState();
}

class _CustomFilledButtonBarState extends State<CustomFilledButtonBar> {
  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: widget.onPressed,
      icon: Icon(widget.icon, color: AppColor.gray_100),
      label: Text(
        widget.label,
        style: AppTextStyle.smallText.copyWith(color: AppColor.gray_100),
      ),
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all<Color>(widget.color ?? AppColor.gray_750),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        ),
      ),
    );
  }
}
