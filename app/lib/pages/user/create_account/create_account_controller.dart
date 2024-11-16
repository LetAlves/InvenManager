import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:invenmanager/pages/user/create_account/create_account_state.dart';

class CreateAccountController extends ChangeNotifier {
  CreateAccountState _state = CreateAccountInitialState();

  CreateAccountState get state => _state;

  void _changeState(CreateAccountState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<bool> doCreateAccount() async {
    _changeState(CreateAccountLoadingState());

    try {
      await Future.delayed(Duration(seconds: 2));

      //throw Exception("teste de erro");

      //Implementar lógica de Criar Usuário
      log("usuário criado com sucesso");

      _changeState(CreateAccountSuccessState());
      return true;
    } catch (e) {
      _changeState(CreateAccountErrorState());
      return false;
    }
  }
}
