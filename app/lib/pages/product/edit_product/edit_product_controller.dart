import 'package:flutter/foundation.dart';
import 'package:invenmanager/pages/product/edit_product/edit_product_state.dart';
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
    required String id,
    required String name,
    required double unitValue,
    required int minimumQuantity,
    required int barCode,
  }) async {
    _changeState(EditProductLoadingState());

    try {
      await _service.editProduct(
        id: id,
        name: name,
        unitValue: unitValue,
        minimumQuantity: minimumQuantity,
        barCode: barCode,
      );
      await _service.editProduct(
          id: id,
          name: name,
          unitValue: unitValue,
          minimumQuantity: minimumQuantity,
          barCode: barCode);
      _changeState(EditProductSuccessState());
    } catch (e) {
      _changeState(EditProductErrorState(e.toString()));
    }
  }

  Future<void> deleteProduct({
    required String id,
  }) async {
    _changeState(EditProductLoadingState());
    try {
      await _service.deleteProduct(idProduct: id);
      _changeState(EditProductSuccessState());
    } catch (e) {
      _changeState(EditProductErrorState(e.toString()));
    }
  }
}
