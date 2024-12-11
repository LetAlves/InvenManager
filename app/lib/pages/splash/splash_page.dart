import 'package:flutter/material.dart';
import 'package:invenmanager/global/app_color.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/locator.dart';
import 'package:invenmanager/pages/splash/splash_controller.dart';
import 'package:invenmanager/pages/splash/splash_state.dart';
import 'package:invenmanager/widget/custom_circular_progress_indicator.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  final _splashController = locator.get<SplashController>();

  @override
  void initState() {
    super.initState();
    _splashController.isUserLogged();
    _splashController.addListener(() {
      if (_splashController.state is SplashSuccessState) {
        Navigator.popAndPushNamed(
          context,
          NamedRoutes.home,
        );
      } else {
        Navigator.popAndPushNamed(
          context,
          NamedRoutes.login,
        );
      }
    });
  }

  @override
  void dispose() {
    _splashController.dispose();
    super.dispose();
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
