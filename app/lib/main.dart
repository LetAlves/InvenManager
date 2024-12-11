import 'package:flutter/material.dart';
import 'package:invenmanager/global/routes.dart';
import 'package:invenmanager/locator.dart';
import 'package:invenmanager/pages/home/home_page_view.dart';
import 'package:invenmanager/pages/product/create_product/create_product_page.dart';
import 'package:invenmanager/pages/product/edit_product/edit_product_page.dart';
import 'package:invenmanager/pages/product/information_product/info_product_page.dart';
import 'package:invenmanager/pages/search_product/search_product_page.dart';
import 'package:invenmanager/pages/splash/splash_page.dart';
import 'package:invenmanager/pages/user/create_account/create_account_page.dart';
import 'package:invenmanager/pages/user/edit_account/edit_account_page.dart';
import 'package:invenmanager/pages/user/login/login_page.dart';
import 'package:invenmanager/pages/user/recover_password/recover_password_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupDependencies();
  runApp(const Invenmanager());
}

class Invenmanager extends StatelessWidget {
  const Invenmanager({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InvenManager',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: NamedRoutes.splash,
      routes: {
        NamedRoutes.initial: (context) => const HomePageView(),
        NamedRoutes.splash: (context) => const SplashPage(),
        NamedRoutes.login: (context) => const LoginPage(),
        NamedRoutes.createAccount: (context) => const CreateAccountPage(),
        NamedRoutes.editAccount: (context) => const EditAccountPage(),
        NamedRoutes.recoverPassword: (context) => const RecoverPasswordPage(),
        NamedRoutes.home: (context) => const HomePageView(),
        NamedRoutes.createProduct: (context) => const CreateProductPage(),
        NamedRoutes.editProduct: (context) => const EditProductPage(),
        NamedRoutes.informationProduct: (context) => const InfoProductPage(),
        NamedRoutes.searchProduct: (context) => const SearchProductPage(),
      },
    );
  }
}
