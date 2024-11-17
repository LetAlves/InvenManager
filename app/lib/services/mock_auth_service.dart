import 'package:invenmanager/models/product_model.dart';
import 'package:invenmanager/models/user_model.dart';
import 'package:invenmanager/services/auth_service.dart';

class MockAuthService implements AuthService {
  @override
  Future<UserModel> createAccount({
    required String name,
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
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
  Future<UserModel> editAccount({
    required String name,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));
      if (password.startsWith('123')) {
        throw Exception();
      }

      return UserModel(id: email.hashCode, name: name, email: email);
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

  @override
  Future<ProductModel> createProduct({
    required String name,
    required int currentQuantity,
    required int minimumQuantity,
    required double unitValue,
    required int barCode,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      return ProductModel(
        id: name.hashCode,
        name: name,
        unitValue: unitValue,
        currentQuantity: currentQuantity,
        minimumQuantity: minimumQuantity,
        barCode: barCode,
      );
    } catch (e) {
      throw 'Não foi possivel cadastrar o produto nesse momento. Tente mais tarde';
    }
  }

  @override
  Future<ProductModel> editProduct({
    required String name,
    required int minimumQuantity,
    required double unitValue,
    required int barCode,
  }) async {
    try {
      await Future.delayed(const Duration(seconds: 2));

      return ProductModel(
        id: name.hashCode,
        name: name,
        unitValue: unitValue,
        minimumQuantity: minimumQuantity,
        barCode: barCode,
      );
    } catch (e) {
      throw 'Não foi possivel editar o produto nesse momento. Tente mais tarde';
    }
  }

  @override
  Future<ProductModel> updateQuantityProduct(
      {required int id,
      required int oldQuantity,
      required int newQuantity,
      required DateTime currentDate}) {
    // TODO: implement updateQuantityProduct
    throw UnimplementedError();
  }
}
