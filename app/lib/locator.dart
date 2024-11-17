import 'package:get_it/get_it.dart';
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
}
