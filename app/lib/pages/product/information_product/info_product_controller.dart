import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:invenmanager/pages/product/information_product/info_product_state.dart';
import 'package:invenmanager/services/auth_service.dart';

class InfoProductController extends ChangeNotifier {
  final AuthService _service;

  InfoProductController(this._service);

  InfoProductState _state = InfoProductInitialState();

  InfoProductState get state => _state;

  void _changeState(InfoProductState newState) {
    _state = newState;
    notifyListeners();
  }

  Future<void> updateQuantityProduct({
    required String id,
    required int oldQuantity,
    required int newQuantity,
  }) async {
    _changeState(InfoProductLoadingState());

    try {
      await _service.updateQuantityProduct(
        id: id,
        oldQuantity: oldQuantity,
        newQuantity: newQuantity,
        currentDate: DateTime.now(),
      );
      _changeState(InfoProductSuccessState());
    } catch (e) {
      _changeState(InfoProductErrorState(e.toString(),
          message: 'Erro ao atualizar o produto'));
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getProductHistory({
    required String productId,
  }) {
    try {
      return _service.getProductHistory(productId: productId);
    } catch (e) {
      _changeState(InfoProductErrorState(e.toString(),
          message: 'Erro ao buscar os produtos'));
    }
    return null;
  }
}
