import 'dart:async';

import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/widget/custom_circular_progress_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    init();
  }

  Timer init() {
    return Timer(Duration(seconds: 2), navigateToLoginPage);
  }

  void navigateToLoginPage() {
    Navigator.pushReplacementNamed(
      context,
      NamedRoutes.login,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.gray_800,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'lib/assets/logo-light.png',
              fit: BoxFit.cover,
            ),
            const CustomCircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
