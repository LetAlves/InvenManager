import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:invenmanager/models/product_model.dart';
import 'package:invenmanager/models/user_model.dart';

abstract class AuthService {
  Future<UserModel> createAccount({
    required String username,
    required String email,
    required String password,
  });

  Future<UserModel> editAccount({
    required String username,
    required String photoUrl,
  });

  Future<void> editUserPassword({
    required String password,
  });

  Future<UserModel> login({
    required String email,
    required String password,
  });

  Future<void> logout();

  Future<void> recoverPassword({
    required String email,
  });

  Future<ProductModel> createProduct({
    required String name,
    required int currentQuantity,
    required int minimumQuantity,
    required double unitValue,
    required int barCode,
  });

  Future<ProductModel> editProduct({
    required String id,
    required String name,
    required int minimumQuantity,
    required double unitValue,
    required int barCode,
  });

  Future<ProductModel> updateQuantityProduct({
    required String id,
    required int oldQuantity,
    required int newQuantity,
    required DateTime currentDate,
  });

  Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts();

  Stream<QuerySnapshot<Map<String, dynamic>>> getProductHistory({
    required String productId,
  });

  Stream<QuerySnapshot<Map<String, dynamic>>> getProductByName({
    required String searchName,
  });

  Stream<QuerySnapshot<Map<String, dynamic>>> getProductByBarcode({
    required int searchBarcode,
  });

  Future<void> deleteProduct({required String productId});

  Future<int> getTotalProducts();

  Future<int> getMissingTotalProducts();
}
