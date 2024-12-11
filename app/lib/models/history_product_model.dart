class HistoryProductItemModel {
  final String? id;
  final DateTime? createdAt;
  final int? from;
  final int? to;

  HistoryProductItemModel({
    required this.id,
    required this.createdAt,
    required this.from,
    required this.to,
  });
  
  HistoryProductItemModel.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        createdAt = map["createdAt"],
        from = map["from"],
        to = map["to"];

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "createdAt": createdAt,
      "from": from,
      "to": to,
          };
  }
}

