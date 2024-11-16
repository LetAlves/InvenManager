import 'package:invenmanager/classes/product.dart';

class UserModel {
  final int? id;
  final String? name;
  final String? username;
  final String? email;
  final String? login;
  final String? phone;
  final String? password;
  final Product? products;

  UserModel(
      {this.id,
      this.name,
      this.username,
      this.email,
      this.login,
      this.phone,
      this.password,
      this.products});
}
