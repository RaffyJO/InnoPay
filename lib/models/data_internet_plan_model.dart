class DataInternetPlanModel {
  final int? dataInternetId;
  final String? phoneNumber;
  final String? pin;

  DataInternetPlanModel({
    this.dataInternetId,
    this.phoneNumber,
    this.pin,
  });

  Map<String, dynamic> toJson() {
    return {
      'data_plan_id': dataInternetId.toString(),
      'phone_number': phoneNumber,
      'pin': pin,
    };
  }
}
