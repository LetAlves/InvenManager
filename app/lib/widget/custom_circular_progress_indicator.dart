import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  const CustomCircularProgressIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: AppColor.yellow,
      ),
    );
  }
}
