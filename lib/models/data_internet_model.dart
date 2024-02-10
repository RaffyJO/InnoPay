class DataInternetModel {
  final int? id;
  final String? name;
  final int? price;
  final int? operatorCardId;

  DataInternetModel({
    this.id,
    this.name,
    this.price,
    this.operatorCardId,
  });

  factory DataInternetModel.fromJson(Map<String, dynamic> json) =>
      DataInternetModel(
        id: json['id'],
        name: json['name'],
        price: json['price'],
        operatorCardId: json['operator_card_id'],
      );
}
