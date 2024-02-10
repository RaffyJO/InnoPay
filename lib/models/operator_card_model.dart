import 'package:innopay/models/data_internet_model.dart';

class OperatorCardModel {
  final int? id;
  final String? name;
  final String? status;
  final String? thumbnail;
  final List<DataInternetModel>? dataInternets;

  OperatorCardModel({
    this.id,
    this.name,
    this.status,
    this.thumbnail,
    this.dataInternets,
  });

  factory OperatorCardModel.fromJson(Map<String, dynamic> json) =>
      OperatorCardModel(
        id: json['id'],
        name: json['name'],
        status: json['status'],
        thumbnail: json['thumbnail'],
        dataInternets: json['data_plans'] == null
            ? null
            : (json['data_plans'] as List)
                .map((dataInternet) => DataInternetModel.fromJson(dataInternet))
                .toList(),
      );
}
