import 'package:flutter/foundation.dart';
import 'package:invenmanager/pages/user/create_account/create_account_state.dart';
import 'package:invenmanager/services/auth_service.dart';
import 'package:invenmanager/services/secure_storage.dart';

class CreateAccountController extends ChangeNotifier {
  final AuthService _service;

  CreateAccountController(this._service);

  CreateAccountState _state = CreateAccountInitialState();

  CreateAccountState get state => _state;

  void _changeState(CreateAccountState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> createAccount({
    required String username,
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    final secureStorage = SecureStorage();
    _changeState(CreateAccountLoadingState());

    try {
      final user = await _service.createAccount(
        username: username,
        name: name,
        email: email,
        phone: phone,
        password: password,
      );
      if (user.id == null) {
        throw Exception("Usuário não pode ser nulo!");
      }
      await secureStorage.write(key: "CURRENT_USER", value: user.toJson());
      _changeState(CreateAccountSuccessState());
    } catch (e) {
      _changeState(CreateAccountErrorState(e.toString()));
    }
  }
}
