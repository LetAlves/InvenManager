import 'package:flutter/foundation.dart';
import 'package:invenmanager/pages/product/create_product/create_product_state.dart';
import 'package:invenmanager/services/auth_service.dart';

class CreateProductController extends ChangeNotifier {
  final AuthService _service;

  CreateProductController(this._service);

  CreateProductState _state = CreateProductInitialState();

  CreateProductState get state => _state;

  void _changeState(CreateProductState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> createProduct({
    required String name,
    required double unitValue,
    required int currentQuantity,
    required int minimumQuantity,
    required int barCode,
  }) async {
    _changeState(CreateProductLoadingState());

    try {
      await _service.createProduct(
        name: name,
        unitValue: unitValue,
        currentQuantity: currentQuantity,
        minimumQuantity: minimumQuantity,
        barCode: barCode,
      );
      _changeState(CreateProductSuccessState());
    } catch (e) {
      _changeState(CreateProductErrorState(e.toString()));
    }
  }
}
