import 'package:get_it/get_it.dart';
import 'package:invenmanager/pages/product/create_product/create_product_controller.dart';
import 'package:invenmanager/pages/product/edit_product/edit_product_controller.dart';
import 'package:invenmanager/pages/product/information_product/info_product_controller.dart';
import 'package:invenmanager/pages/user/create_account/create_account_controller.dart';
import 'package:invenmanager/pages/user/edit_account/edit_account_controller.dart';
import 'package:invenmanager/pages/user/login/login_controller.dart';
import 'package:invenmanager/services/auth_service.dart';
import 'package:invenmanager/services/mock_auth_service.dart';

final locator = GetIt.instance;

void setupDependencies() {
  locator.registerLazySingleton<AuthService>(() => MockAuthService());

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
}
