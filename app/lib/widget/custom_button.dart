import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/app_text_style.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color? labelColor;
  final Color? backgroundColor;

  const CustomButton({
    Key? key,
    this.onPressed,
    required this.label,
    this.labelColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? AppColor.yellow,
        minimumSize: const Size(350, 52),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Text(
        label,
        style: AppTextStyle.mediumText
            .copyWith(color: labelColor ?? AppColor.gray_800),
      ),
    );
  }
}
