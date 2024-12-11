import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  User? getUser() {
    return FirebaseAuth.instance.currentUser;
  }
}
