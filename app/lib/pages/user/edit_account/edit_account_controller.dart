import 'package:flutter/foundation.dart';
import 'package:invenmanager/pages/user/Edit_account/Edit_account_state.dart';
import 'package:invenmanager/services/auth_service.dart';

class EditAccountController extends ChangeNotifier {
  final AuthService _service;

  EditAccountController(this._service);

  EditAccountState _state = EditAccountInitialState();

  EditAccountState get state => _state;

  void _changeState(EditAccountState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> editAccount({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    _changeState(EditAccountLoadingState());

    try {
      await _service.editAccount(
        name: name,
        email: email,
        phone: phone,
        password: password,
      );
      _changeState(EditAccountSuccessState());
    } catch (e) {
      _changeState(EditAccountErrorState(e.toString()));
    }
  }
}
