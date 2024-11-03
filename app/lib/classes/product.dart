class Product {
  final int id;
  final String name;
  final int currentQuantity;
  final int minimumQuantity;
  final double unitValue;
  final int barCode;

  Product({
    required this.id,
    required this.name,
    required this.currentQuantity,
    required this.minimumQuantity,
    required this.unitValue,
    required this.barCode,
  });
}
