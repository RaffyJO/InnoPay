class TopupModel {
  final String? amount;
  final String? pin;
  final String? paymentMethodCode;

  TopupModel({
    this.amount,
    this.pin,
    this.paymentMethodCode,
  });

  TopupModel copyWith({
    String? amount,
    String? pin,
    String? paymentMethodCode,
  }) =>
      TopupModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        paymentMethodCode: paymentMethodCode ?? this.paymentMethodCode,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'pin': pin,
        'payment_method_code': paymentMethodCode,
      };
}
