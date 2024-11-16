import 'package:flutter/foundation.dart';
import 'package:invenmanager/pages/user/create_account/create_account_state.dart';
import 'package:invenmanager/services/auth_service.dart';

class CreateAccountController extends ChangeNotifier {
  final AuthService _service;

  CreateAccountController(this._service);

  CreateAccountState _state = CreateAccountInitialState();

  CreateAccountState get state => _state;

  void _changeState(CreateAccountState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> createAccount(
      {required String username,
      required String email,
      required String password}) async {
    _changeState(CreateAccountLoadingState());

    try {
      await _service.createAccount(
          username: username, email: email, password: password);
      _changeState(CreateAccountSuccessState());
    } catch (e) {
      _changeState(CreateAccountErrorState(e.toString()));
    }
  }
}
