import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:invenmanager/models/product_model.dart';

class ProductService {
  String userId;
  ProductService() : userId = FirebaseAuth.instance.currentUser!.uid;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Future<void> createProduct(ProductModel productModel) async {
    await firebaseFirestore
        .collection(userId)
        .doc(productModel.id)
        .set(productModel.toMap());
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> getProducts() {
    return firebaseFirestore.collection(userId).snapshots();
  }

  Future<void> deleteProduct({required String idProduct}) {
    return firebaseFirestore.collection(userId).doc(idProduct).delete();
  }
}
