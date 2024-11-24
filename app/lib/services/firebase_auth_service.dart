import 'package:firebase_auth/firebase_auth.dart';
import 'package:invenmanager/models/product_model.dart';
import 'package:invenmanager/models/user_model.dart';
import 'package:invenmanager/services/auth_service.dart';

class FirebaseAuthService implements AuthService {
  final _auth = FirebaseAuth.instance;

  //User
  @override
  Future<UserModel> createAccount({
    required String name,
    required String username,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      final result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user == null) {
        throw Exception("O usuário não pode ser nulo!");
      }

      result.user!.updateDisplayName(username);

      return UserModel(
        id: _auth.currentUser?.uid,
        username: _auth.currentUser?.displayName,
        email: _auth.currentUser?.email,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "null";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> editAccount(
      {required String name,
      required String email,
      required String phone,
      required String password}) {
    // TODO: implement editAccount
    throw UnimplementedError();
  }

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (result.user == null) {
        throw Exception("O usuário não pode ser nulo!");
      }

      return UserModel(
        id: _auth.currentUser?.uid,
        username: _auth.currentUser?.displayName,
        email: _auth.currentUser?.email,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "null";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _auth.signOut();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> recoverPassword({required String email}) {
    // TODO: implement recoverPassword
    throw UnimplementedError();
  }

  // Product
  @override
  Future<ProductModel> createProduct(
      {required String name,
      required int currentQuantity,
      required int minimumQuantity,
      required double unitValue,
      required int barCode}) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }

  @override
  Future<ProductModel> editProduct(
      {required String name,
      required int minimumQuantity,
      required double unitValue,
      required int barCode}) {
    // TODO: implement editProduct
    throw UnimplementedError();
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
