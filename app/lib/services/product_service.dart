import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductService {
  String userId;
  ProductService() : userId = FirebaseAuth.instance.currentUser!.uid;

  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  Stream<QuerySnapshot<Map<String, dynamic>>> getProducts() {
    return firebaseFirestore.collection(userId).snapshots();
  }
}
