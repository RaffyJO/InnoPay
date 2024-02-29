class TransferModel {
  final String? amount;
  final String? pin;
  final String? sendTo;
  final String? description;

  TransferModel({
    this.amount,
    this.pin,
    this.sendTo,
    this.description,
  });

  TransferModel copyWith({
    String? amount,
    String? pin,
    String? sendTo,
    String? description,
  }) =>
      TransferModel(
        amount: amount ?? this.amount,
        pin: pin ?? this.pin,
        sendTo: sendTo ?? this.sendTo,
        description: description ?? this.description,
      );

  Map<String, dynamic> toJson() => {
        'amount': amount,
        'pin': pin,
        'send_to': sendTo,
        'description': description,
      };
}
