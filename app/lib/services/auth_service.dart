import 'package:invenmanager/models/product_model.dart';
import 'package:invenmanager/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> createAccount({
    required String name,
    required String username,
    required String email,
    required String phone,
    required String password,
  });
  Future<UserModel> editAccount({
    required String name,
    required String email,
    required String phone,
    required String password,
  });

  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<ProductModel> createProduct({
    required String name,
    required int currentQuantity,
    required int minimumQuantity,
    required double unitValue,
    required int barCode,
  });

  Future<ProductModel> editProduct({
    required String name,
    required int minimumQuantity,
    required double unitValue,
    required int barCode,
  });

  Future<ProductModel> updateQuantityProduct({
    required int id,
    required int oldQuantity,
    required int newQuantity,
    required DateTime currentDate,
  });

  Future<void> recoverPassword({
    required String email,
  });
}
