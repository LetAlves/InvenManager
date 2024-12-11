import 'package:get_it/get_it.dart';
import 'package:invenmanager/pages/home/home_controller.dart';
import 'package:invenmanager/pages/product/create_product/create_product_controller.dart';
import 'package:invenmanager/pages/product/edit_product/edit_product_controller.dart';
import 'package:invenmanager/pages/product/information_product/info_product_controller.dart';
import 'package:invenmanager/pages/search_product/search_product_controller.dart';
import 'package:invenmanager/pages/splash/splash_controller.dart';
import 'package:invenmanager/pages/user/create_account/create_account_controller.dart';
import 'package:invenmanager/pages/user/edit_account/edit_account_controller.dart';
import 'package:invenmanager/pages/user/login/login_controller.dart';
import 'package:invenmanager/services/auth_service.dart';
import 'package:invenmanager/services/firebase_service.dart';
import 'package:invenmanager/services/secure_storage.dart';
import 'package:invenmanager/widget/lateral_menu/lateral_menu_controller.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => FirebaseService());

  locator.registerFactory<SplashController>(
      () => SplashController(const SecureStorage()));

  locator.registerFactory<HomeController>(
      () => HomeController(locator.get<AuthService>()));

  locator.registerFactory<CreateAccountController>(
      () => CreateAccountController(locator.get<AuthService>()));

  locator.registerFactory<LoginController>(
      () => LoginController(locator.get<AuthService>()));

  locator.registerFactory<EditAccountController>(
      () => EditAccountController(locator.get<AuthService>()));

  locator.registerFactory<CreateProductController>(
      () => CreateProductController(locator.get<AuthService>()));

  locator.registerFactory<EditProductController>(
      () => EditProductController(locator.get<AuthService>()));

  locator.registerFactory<InfoProductController>(
      () => InfoProductController(locator.get<AuthService>()));

  locator.registerFactory<SearchProductController>(
      () => SearchProductController(locator.get<AuthService>()));

  locator.registerFactory<LateralMenuController>(
      () => LateralMenuController(locator.get<AuthService>()));
}
