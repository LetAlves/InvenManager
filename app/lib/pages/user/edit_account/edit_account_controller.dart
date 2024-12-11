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
    required String username,
  }) async {
    _changeState(EditAccountLoadingState());

    try {
      _changeState(EditAccountLoadingState());
      await _service.editAccount(
        username: username,
        photoUrl:
            'https://i.pinimg.com/originals/50/ef/65/50ef65b8af841eb8638282f9dfc8f008.jpg',
      );
      _changeState(EditAccountSuccessState());
    } catch (e) {
      _changeState(EditAccountErrorState(e.toString()));
    }
  }

  Future<void> editPassword({
    required String password,
  }) async {
    _changeState(EditAccountLoadingState());

    try {
      await _service.editUserPassword(
        password: password,
      );
      _changeState(EditAccountSuccessState());
    } catch (e) {
      _changeState(EditAccountErrorState(e.toString()));
    }
  }
}
