class TransferModel {
  final String? amount;
  final String? pin;
  final String? sendTo;

  TransferModel({
    this.amount,
    this.pin,
    this.sendTo,
  });

  TransferModel copyWith({
    String? amount,
    String? pin,
    String? sendTo,
  }) =>
      TransferModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        sendTo: sendTo ?? this.sendTo,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'pin': pin,
        'send_to': sendTo,
      };
}
