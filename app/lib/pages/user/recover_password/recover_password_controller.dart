import 'package:flutter/material.dart';
import 'package:invenmanager/pages/user/recover_password/recover_password_state.dart';
import 'package:invenmanager/services/auth_service.dart';

class RecoverPasswordController extends ChangeNotifier {
  final AuthService _service;

  RecoverPasswordController(this._service);

  RecoverPasswordState _state = RecoverPasswordInitialState();
  RecoverPasswordState get state => _state;

  void _changeState(RecoverPasswordState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> recoverPassword({required String email}) async {
    _changeState(RecoverPasswordLoadingState());

    try {
      await _service.recoverPassword(email: email);
      _changeState(RecoverPasswordSuccessState());
    } catch (e) {
      _changeState(RecoverPasswordErrorState(e.toString()));
    }
  }
}