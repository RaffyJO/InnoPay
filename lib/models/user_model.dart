class UserModel {
  int? id;
  String? name;
  String? email;
  String? username;
  String? password;
  int? verified;
  String? profilePicture;
  int? balance;
  String? cardNumber;
  String? pin;
  String? token;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.password,
    this.verified,
    this.profilePicture,
    this.balance,
    this.cardNumber,
    this.pin,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        username: json['username'],
        password: json['password'],
        verified: json['verified'],
        profilePicture: json['profile_picture'],
        balance: json['balance'],
        cardNumber: json['card_number'],
        pin: json['pin'],
        token: json['token'],
      );

  UserModel copyWith({
    String? username,
    String? name,
    String? email,
    String? pin,
    String? password,
    int? balance,
  }) =>
      UserModel(
        id: id,
        username: username ?? this.username,
        name: name ?? this.name,
        email: email ?? this.email,
        password: password ?? this.password,
        verified: verified,
        profilePicture: profilePicture,
        balance: balance ?? this.balance,
        cardNumber: cardNumber,
        pin: pin ?? this.pin,
        token: token,
      );
}
