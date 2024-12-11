import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';

class NotificationCard extends StatelessWidget {
  final String message;
  final bool? isErrorMessage;

  const NotificationCard({
    super.key,
    required this.message,
    this.isErrorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(
        message,
        style: TextStyle(
            color: isErrorMessage == true ? AppColor.red : AppColor.gray_200),
      ),
      backgroundColor: AppColor.gray_750,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
        side: BorderSide(
            color: isErrorMessage == true ? AppColor.red : AppColor.yellow),
      ),
      duration: const Duration(seconds: 3),
    );
  }
}
