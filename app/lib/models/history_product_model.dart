class HistoryProductItemModel {
  final DateTime? createdAt;
  final int? from;
  final int? to;

  HistoryProductItemModel({
    required this.createdAt,
    required this.from,
    required this.to,
  });

  HistoryProductItemModel.fromMap(Map<String, dynamic> map)
      : createdAt = map["createdAt"],
        from = map["from"],
        to = map["to"];

  Map<String, dynamic> toMap() {
    return {
      "createdAt": createdAt,
      "from": from,
      "to": to,
    };
  }
}
