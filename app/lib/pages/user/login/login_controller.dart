import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:invenmanager/pages/user/login/login_state.dart';

class LoginController extends ChangeNotifier {
  LoginState _state = LoginInitialState();

  LoginState get state => _state;

  void _changeState(LoginState newState) {
    _state = newState;
  }

  Future<bool> doLogin() async {
    _changeState(LoginLoadingState());

    try {
      await Future.delayed(Duration(seconds: 2));

      throw Exception("TEste");

      //TODO: Implementar logica de logar usuário
      log("usuário logado");

      _changeState(LoginSuccessState());
      return true;
    } catch (e) {
      _changeState(LoginErrorState());
      return false;
    }
  }
}
