import 'package:flutter/material.dart';
import 'package:invenmanager/pages/user/login/login_state.dart';
import 'package:invenmanager/services/auth_service.dart';
import 'package:invenmanager/services/secure_storage.dart';

class LoginController extends ChangeNotifier {
  final AuthService _service;

  LoginController(this._service);

  LoginState _state = LoginInitialState();

  LoginState get state => _state;

  void _changeState(LoginState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> login({
    required String email,
    required String password,
  }) async {
    const secureStorage = SecureStorage();
    _changeState(LoginLoadingState());

    try {
      final user = await _service.login(
        email: email,
        password: password,
      );

      if (user.id == null) {
        throw Exception("Usuário não pode ser nulo!");
      }

      await secureStorage.write(key: "CURRENT_USER", value: user.toJson());
      _changeState(LoginSuccessState());
    } catch (e) {
      _changeState(LoginErrorState(e.toString()));
    }
  }
}
