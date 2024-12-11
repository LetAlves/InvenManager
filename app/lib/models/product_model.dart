import 'package:invenmanager/models/history_product_model.dart';

class ProductModel {
  final String? id;
  final String? name;
  final int? currentQuantity;
  final int? minimumQuantity;
  final double? unitValue;
  final int? barCode;
  final List<HistoryProductItemModel>? history;

  ProductModel({
    this.id,
    this.name,
    this.currentQuantity,
    this.minimumQuantity,
    this.unitValue,
    this.barCode,
    this.history,
  });

  ProductModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        name = map["name"],
        currentQuantity = map["currentQuantity"],
        minimumQuantity = map["minimumQuantity"],
        unitValue = map["unitValue"],
        barCode = map["barCode"],
        history = (map['historyItems'] as List<dynamic>?)
            ?.map((item) =>
                HistoryProductItemModel.fromMap(item as Map<String, dynamic>))
            .toList();

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "name": name,
      "currentQuantity": currentQuantity,
      "minimumQuantity": minimumQuantity,
      "unitValue": unitValue,
      "barCode": barCode,
      "history": history
    };
  }
}
