import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:invenmanager/pages/search_product/search_product_state.dart';
import 'package:invenmanager/services/auth_service.dart';

class SearchProductController extends ChangeNotifier {
  final AuthService _service;

  SearchProductController(this._service);

  SearchState _state = SearchStateInitial();

  SearchState get state => _state;

  void _changeState(SearchState newState) {
    _state = newState;
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getProduct(
      {required String value}) {
    try {
      final RegExp regexNum = RegExp(r'[0-9]');

      if (value.isNotEmpty && regexNum.hasMatch(value)) {
        int searchBarCode = int.parse(value);
        return _service.getProductByBarcode(searchBarcode: searchBarCode);
      } else if (value.isNotEmpty && !regexNum.hasMatch(value)) {
        return _service.getProductByName(searchName: value);
      }
    } catch (e) {
      _changeState(
          SearchStateError(e.toString(), message: 'Erro os buscar o produto'));
    }
    return null;
  }
}
