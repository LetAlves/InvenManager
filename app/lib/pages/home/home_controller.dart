import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:invenmanager/pages/home/home_state.dart';
import 'package:invenmanager/services/auth_service.dart';

class HomeController extends ChangeNotifier {
  final AuthService _service;

  HomeController(this._service);

  HomeState _state = HomeStateInitial();

  HomeState get state => _state;

  void _changeState(HomeState newState) {
    _state = newState;
    notifyListeners();
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getProducts() {
    try {
      return _service.getAllProducts();
    } catch (e) {
      _changeState(
          HomeStateError(e.toString(), message: 'Erro ao buscar os produtos'));
    }
    return null;
  }

  Stream<QuerySnapshot<Map<String, dynamic>>>? getProduct(
      {required String value}) {
    try {} catch (e) {
      _changeState(
          HomeStateError(e.toString(), message: 'Erro os buscar o produto'));
    }
  }
}
