import 'package:flutter/foundation.dart';
import 'package:invenmanager/services/auth_service.dart';
import 'package:invenmanager/widget/lateral_menu/lateral_menu_state.dart';

class LateralMenuController extends ChangeNotifier {
  final AuthService _service;

  LateralMenuController(this._service);

  LateralMenuState _state = LateralMenuStateInitial();

  LateralMenuState get state => _state;

  void _changeState(LateralMenuState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<int> getTotalProducts() async {
    try {
      return _service.getTotalProducts();
    } catch (e) {
      _changeState(LateralMenuStateError(e.toString(),
          message: 'Erro ao obter a quantidade de produtos cadastrados'));
    }
    return 0;
  }

  Future<int> getMissingTotalProducts() async {
    try {
      return _service.getMissingTotalProducts();
    } catch (e) {
      _changeState(LateralMenuStateError(e.toString(),
          message: 'Erro ao obter a quantidade de produtos em falta'));
    }
    return 0;
  }
}
