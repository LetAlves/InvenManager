import 'package:invenmanager/models/product_model.dart';

abstract class ProductRepository {
  Future<void> addProduct();
  Future<List<ProductModel>> getAllProducts();
}

class ProductRepositoryImplemetation implements ProductRepository {
  @override
  Future<void> addProduct() {
    // TODO: implement addProduct
    throw UnimplementedError();
  }

  @override
  Future<List<ProductModel>> getAllProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      ProductModel(
          name: "Toddy",
          currentQuantity: 5,
          minimumQuantity: 10,
          unitValue: 11.99,
          barCode: 123456789),
      ProductModel(
          name: "Nescau",
          currentQuantity: 20,
          minimumQuantity: 5,
          unitValue: 12.99,
          barCode: 987654321),
    ];
  }
}
