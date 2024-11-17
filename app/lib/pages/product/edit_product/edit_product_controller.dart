import 'package:flutter/foundation.dart';
import 'package:invenmanager/pages/product/Edit_product/edit_product_state.dart';
import 'package:invenmanager/services/auth_service.dart';

class EditProductController extends ChangeNotifier {
  final AuthService _service;

  EditProductController(this._service);

  EditProductState _state = EditProductInitialState();

  EditProductState get state => _state;

  void _changeState(EditProductState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> editProduct({
    required String name,
    required double unitValue,
    required int minimumQuantity,
    required int barCode,
  }) async {
    _changeState(EditProductLoadingState());

    try {
      await _service.editProduct(
        name: name,
        unitValue: unitValue,
        minimumQuantity: minimumQuantity,
        barCode: barCode,
      );
      _changeState(EditProductSuccessState());
    } catch (e) {
      _changeState(EditProductErrorState(e.toString()));
    }
  }
}
