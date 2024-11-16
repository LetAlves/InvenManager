import 'package:invenmanager/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> createAccount(
      {String? username, required String email, required String password});
  Future login();
}
