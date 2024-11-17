import 'package:invenmanager/models/user_model.dart';
import 'package:invenmanager/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> createAccount(
      {String? username,
      required String email,
      required String password}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (password.startsWith('123')) {
        throw Exception();
      }

      return UserModel(id: email.hashCode, username: username, email: email);
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Senha insegura. Digite uma senha forte';
      }
      throw 'Não foi possivel criar sua conta nesse momento. Tente mais tarde';
    }
  }

  @override
  Future<UserModel> login(
      {required String username, required String password}) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (password.startsWith('123')) {
        throw Exception();
      }

      return UserModel(id: username.hashCode, username: username);
    } catch (e) {
      if (password.startsWith('123')) {
        throw 'Erro ao logar. Tente novamente';
      }
      throw 'Não foi possivel realizar o login nesse momento. Tente mais tarde';
    }
  }
}
