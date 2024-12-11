import 'package:flutter/foundation.dart';
import 'package:invenmanager/pages/splash/splash_state.dart';
import 'package:invenmanager/services/secure_storage.dart';

class SplashController extends ChangeNotifier {
  final SecureStorage _service;

  SplashController(this._service);

  SplashState _state = SplashInitialState();

  SplashState get state => _state;

  void _changeState(SplashState newState) {
    _state = newState;
    notifyListeners();
  }

  void isUserLogged() async {
    await Future.delayed(const Duration(seconds: 2));

    final result = await _service.read(key: "CURRENT_USER");

    if (result == null) {
      _changeState(SplashErrorState());
    }
    _changeState(SplashSuccessState());
  }
}
