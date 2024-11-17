import 'package:invenmanager/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> createAccount(
      {required String name,
      required String username,
      required String email,
      required String phone,
      required String password});
  Future<UserModel> editAccount(
      {required String name,
      required String email,
      required String phone,
      required String password});

  Future<UserModel> login({required String username, required String password});
}
