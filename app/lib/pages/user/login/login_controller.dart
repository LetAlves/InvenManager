import 'package:flutter/material.dart';
import 'package:invenmanager/pages/user/login/login_state.dart';
import 'package:invenmanager/services/auth_service.dart';

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
    required String username,
    required String password,
  }) async {
    _changeState(LoginLoadingState());

    try {
      await _service.login(
        username: username,
        password: password,
      );
      _changeState(LoginSuccessState());
    } catch (e) {
      _changeState(LoginErrorState(e.toString()));
    }
  }
}
