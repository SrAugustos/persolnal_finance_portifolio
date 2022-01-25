class TransactionModel {
  String name;
  String type;
  String category;
  double value;
  int id;
  DateTime date;

  TransactionModel(
      {required this.name,
      required this.type,
      required this.category,
      required this.value,
      required this.id,
      required this.date});

  TransactionModel.fromJson(Map<String, dynamic> json)
      : this(
            name: json['name'],
            type: json['type'],
            category: json['category'],
            value: json['value'],
            id: json['id'],
            date: json['date']);

  Map<String, dynamic> toJason() {
    return {
      'name': name,
      'type': type,
      'category': category,
      'value': value,
      'id': id,
      'date': date
    };
  }
}
