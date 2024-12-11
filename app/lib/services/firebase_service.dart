import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:invenmanager/models/product_model.dart';
import 'package:invenmanager/models/user_model.dart';
import 'package:invenmanager/services/auth_service.dart';
import 'package:uuid/uuid.dart';

class FirebaseService implements AuthService {
  final _auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // User
  @override
  Future<UserModel> createAccount({
    required String username,
    required String email,
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
      result.user!.updatePhotoURL(
          'https://i.pinimg.com/originals/50/ef/65/50ef65b8af841eb8638282f9dfc8f008.jpg');

      return UserModel(
        id: _auth.currentUser?.uid,
        username: _auth.currentUser?.displayName,
        email: _auth.currentUser?.email,
        photoUrl: _auth.currentUser?.photoURL,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "null";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<UserModel> editAccount({
    required String username,
    required String photoUrl,
  }) async {
    try {
      _auth.currentUser?.updateDisplayName(username);
      _auth.currentUser?.updatePhotoURL(photoUrl);

      return UserModel(
        id: _auth.currentUser?.uid,
        username: _auth.currentUser?.displayName,
        email: _auth.currentUser?.email,
        photoUrl: _auth.currentUser?.photoURL,
      );
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "null";
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> editUserPassword({required String password}) async {
    try {
      _auth.currentUser?.updatePassword(password);
    } on FirebaseAuthException catch (e) {
      throw e.message ?? "null";
    } catch (e) {
      rethrow;
    }
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
  Future<ProductModel> createProduct({
    required String name,
    required int currentQuantity,
    required int minimumQuantity,
    required double unitValue,
    required int barCode,
  }) async {
    ProductModel productModel = ProductModel(
      id: const Uuid().v1(),
      name: name,
      unitValue: unitValue,
      currentQuantity: currentQuantity,
      minimumQuantity: minimumQuantity,
      barCode: barCode,
    );

    await firebaseFirestore
        .collection(_auth.currentUser!.uid)
        .doc(productModel.id)
        .set(productModel.toMap());

    return productModel;
  }

  @override
  Future<ProductModel> editProduct({
    required String id,
    required String name,
    required int minimumQuantity,
    required double unitValue,
    required int barCode,
  }) async {
    try {
      await firebaseFirestore
          .collection(_auth.currentUser!.uid)
          .doc(id)
          .update({
        'name': name,
        'minimumQuantity': minimumQuantity,
        'unitValue': unitValue,
        'barCode': barCode,
      });

      return ProductModel(
        id: id,
        name: name,
        unitValue: unitValue,
        currentQuantity: 0,
        minimumQuantity: minimumQuantity,
        barCode: barCode,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<ProductModel> updateQuantityProduct({
    required String id,
    required int oldQuantity,
    required int newQuantity,
    required DateTime currentDate,
  }) async {
    try {
      final productDoc = await firebaseFirestore
          .collection(_auth.currentUser!.uid)
          .doc(id)
          .get();

      if (!productDoc.exists) {
        throw Exception("Produto não encontrado");
      }

      final productData = productDoc.data() as Map<String, dynamic>;
      List<dynamic> history = productData['history'] ?? [];

      final newHistoryItem = {
        'createdAt': currentDate.toIso8601String(),
        'from': oldQuantity,
        'to': newQuantity,
      };

      history.add(newHistoryItem);

      await firebaseFirestore
          .collection(_auth.currentUser!.uid)
          .doc(id)
          .update({
        'currentQuantity': newQuantity,
        'history': history,
      });

      return ProductModel(
        id: id,
        name: productData['name'],
        unitValue: productData['unitValue'],
        currentQuantity: newQuantity,
        minimumQuantity: productData['minimumQuantity'],
        barCode: productData['barCode'],
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllProducts() {
    try {
      return firebaseFirestore.collection(_auth.currentUser!.uid).snapshots();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getProductHistory({
    required String productId,
  }) {
    try {
      return firebaseFirestore
          .collection(_auth.currentUser!.uid)
          .where('id', isEqualTo: productId)
          .snapshots();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getProductByName({
    required String searchName,
  }) {
    try {
      return FirebaseFirestore.instance
          .collection(_auth.currentUser!.uid)
          .where('name', isEqualTo: searchName)
          .snapshots();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Stream<QuerySnapshot<Map<String, dynamic>>> getProductByBarcode({
    required int searchBarcode,
  }) {
    try {
      return FirebaseFirestore.instance
          .collection(_auth.currentUser!.uid)
          .where('barCode', isEqualTo: searchBarcode)
          .snapshots();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> deleteProduct({required String productId}) async {
    try {
      await firebaseFirestore
          .collection(_auth.currentUser!.uid)
          .doc(productId)
          .delete();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> getTotalProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await firebaseFirestore.collection(_auth.currentUser!.uid).get();
      return snapshot.size;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<int> getMissingTotalProducts() async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshot =
          await firebaseFirestore.collection(_auth.currentUser!.uid).get();

      int missingProducts = 0;

      for (var doc in snapshot.docs) {
        var currentQuantity = doc['currentQuantity'] as int;
        var minimumQuantity = doc['minimumQuantity'] as int;
        if (currentQuantity <= minimumQuantity) {
          missingProducts++;
        }
      }

      return missingProducts;
    } catch (e) {
      rethrow;
    }
  }
}
